"""
Generate an ER diagram for the Steam Games database schema using matplotlib.

Convention follows CPSC 368 notation:
  - Rectangles: entity sets
  - Ovals: attributes (underlined primary keys)
  - Diamonds: relationship sets
  - Arrows: key constraint (points to the "one" side)
  - Thick lines: total participation

All edges connect to shape borders (not centers) for clean rendering.
"""

import matplotlib
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

matplotlib.rcParams["font.family"] = "DejaVu Sans"

fig, ax = plt.subplots(figsize=(18, 11))
ax.set_xlim(0, 18)
ax.set_ylim(0, 11)
ax.set_aspect("equal")
ax.axis("off")


# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
# Geometry helpers: find where a line from srcâ†’dst exits src
# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€


def rect_border(cx, cy, w, h, tx, ty):
    """Return the point where line from (cx,cy)â†’(tx,ty) exits the rectangle."""
    dx, dy = tx - cx, ty - cy
    if dx == 0 and dy == 0:
        return cx, cy
    hw, hh = w / 2, h / 2
    candidates = []
    if dx != 0:
        for xedge in [cx - hw, cx + hw]:
            t = (xedge - cx) / dx
            if t > 0:
                y = cy + t * dy
                if cy - hh <= y <= cy + hh:
                    candidates.append((t, xedge, y))
    if dy != 0:
        for yedge in [cy - hh, cy + hh]:
            t = (yedge - cy) / dy
            if t > 0:
                x = cx + t * dx
                if cx - hw <= x <= cx + hw:
                    candidates.append((t, x, yedge))
    if not candidates:
        return cx, cy
    _, bx, by = min(candidates)
    return bx, by


def ellipse_border(cx, cy, a, b, tx, ty):
    """Return the point where line from (cx,cy)â†’(tx,ty) exits the ellipse."""
    dx, dy = tx - cx, ty - cy
    if dx == 0 and dy == 0:
        return cx, cy
    t = 1.0 / np.sqrt((dx / a) ** 2 + (dy / b) ** 2)
    return cx + t * dx, cy + t * dy


def diamond_border(cx, cy, w, h, tx, ty):
    """Return exit point on a diamond (rhombus) shape."""
    dx, dy = tx - cx, ty - cy
    if dx == 0 and dy == 0:
        return cx, cy
    hw, hh = w / 2, h / 2
    corners = [(cx, cy + hh), (cx + hw, cy), (cx, cy - hh), (cx - hw, cy)]
    edges = [(corners[i], corners[(i + 1) % 4]) for i in range(4)]
    best_t = float("inf")
    best_pt = (cx, cy)
    for (ax1, ay1), (ax2, ay2) in edges:
        denom = dx * (ay2 - ay1) - dy * (ax2 - ax1)
        if abs(denom) < 1e-9:
            continue
        t_val = ((ax1 - cx) * (ay2 - ay1) - (ay1 - cy) * (ax2 - ax1)) / denom
        s_val = ((ax1 - cx) * dy - (ay1 - cy) * dx) / denom
        if t_val > 1e-6 and 0 <= s_val <= 1:
            if t_val < best_t:
                best_t = t_val
                best_pt = (cx + t_val * dx, cy + t_val * dy)
    return best_pt


# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
# Drawing functions
# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

shapes = {}  # name â†’ (type, cx, cy, w, h)


ENTITY_PAD = 0.05  # matches FancyBboxPatch pad parameter


def entity_box(name, cx, cy, w=2.2, h=0.75):
    rect = mpatches.FancyBboxPatch(
        (cx - w / 2, cy - h / 2),
        w,
        h,
        boxstyle=f"square,pad={ENTITY_PAD}",
        linewidth=2.5,
        edgecolor="black",
        facecolor="#DDEEFF",
    )
    ax.add_patch(rect)
    ax.text(cx, cy, name, ha="center", va="center", fontsize=11, fontweight="bold")
    # Store padded dimensions so border calculation uses the actual drawn edges
    shapes[name] = ("rect", cx, cy, w + 2 * ENTITY_PAD, h + 2 * ENTITY_PAD)


def attribute_oval(name, cx, cy, label, pk=False, w=1.65, h=0.52):
    ellipse = mpatches.Ellipse(
        (cx, cy), w, h, linewidth=1.5, edgecolor="black", facecolor="#FFFDE7"
    )
    ax.add_patch(ellipse)
    if pk:
        ax.text(cx, cy, label, ha="center", va="center", fontsize=9, fontweight="bold")
        uline_w = len(label) * 0.053
        ax.plot(
            [cx - uline_w, cx + uline_w],
            [cy - 0.115, cy - 0.115],
            color="black",
            linewidth=1.3,
        )
    else:
        ax.text(cx, cy, label, ha="center", va="center", fontsize=9)
    shapes[name] = ("ellipse", cx, cy, w, h)


def relationship_diamond(name, cx, cy, label, w=1.8, h=0.72):
    diamond = plt.Polygon(
        [[cx, cy + h / 2], [cx + w / 2, cy], [cx, cy - h / 2], [cx - w / 2, cy]],
        closed=True,
        linewidth=1.8,
        edgecolor="black",
        facecolor="#E8F5E9",
    )
    ax.add_patch(diamond)
    ax.text(cx, cy, label, ha="center", va="center", fontsize=9.5, fontstyle="italic")
    shapes[name] = ("diamond", cx, cy, w, h)


def get_border(name, toward_x, toward_y):
    kind, cx, cy, w, h = shapes[name]
    if kind == "rect":
        return rect_border(cx, cy, w, h, toward_x, toward_y)
    elif kind == "ellipse":
        return ellipse_border(cx, cy, w / 2, h / 2, toward_x, toward_y)
    elif kind == "diamond":
        return diamond_border(cx, cy, w, h, toward_x, toward_y)
    return cx, cy


def edge(src, dst, thick=False, arrow_at_dst=False):
    _, sx, sy, _, _ = shapes[src]
    _, dx, dy, _, _ = shapes[dst]
    x1, y1 = get_border(src, dx, dy)
    x2, y2 = get_border(dst, sx, sy)
    lw = 3.5 if thick else 1.8
    if arrow_at_dst:
        ax.annotate(
            "",
            xy=(x2, y2),
            xytext=(x1, y1),
            arrowprops=dict(arrowstyle="->", color="black", lw=lw, mutation_scale=18),
        )
    else:
        ax.plot([x1, x2], [y1, y2], color="black", linewidth=lw, zorder=1)


# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
# Layout
# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

entity_box("GAMES", 9, 5.8)
entity_box("REVIEWS", 14.5, 5.8)
entity_box("PLAYER_STATS", 3.5, 5.8)

relationship_diamond("has_scores", 11.75, 5.8, "receives")
relationship_diamond("has_players", 6.25, 5.8, "belongs_to")

# GAMES attributes (spread to 2.0 unit gaps, staggered lower row)
attribute_oval("g_appid", 7.0, 8.3, "app_id", pk=True)
attribute_oval("g_name", 9.0, 8.3, "name")
attribute_oval("g_genre", 11.0, 8.3, "genre")
attribute_oval("g_price", 7.0, 3.3, "price_usd")
attribute_oval("g_year", 9.0, 3.3, "release_year")
attribute_oval("g_free", 11.0, 3.3, "is_free")

# SCORES attributes
attribute_oval("s_appid", 13.2, 8.0, "app_id", pk=True)
attribute_oval("s_meta", 15.3, 8.1, "metascore")
attribute_oval("s_user", 15.3, 3.5, "user_score")

# PLAYERS attributes
attribute_oval("p_appid", 4.8, 8.5, "app_id", pk=True)
attribute_oval("p_ccu", 2.3, 8.5, "ccu")
attribute_oval("p_owners", 1.1, 4.5, "owners")
attribute_oval("p_apm", 2.3, 3.1, "avg_playtime_min", w=2.0)
attribute_oval("p_1yr", 5.0, 3.1, "ccu_at_1yr")
attribute_oval("p_peak", 5.6, 7.0, "ccu_peak")
# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
# Attribute edges
# â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
for attr in ["g_appid", "g_name", "g_genre", "g_price", "g_year", "g_free"]:
    edge("GAMES", attr)
for attr in ["s_appid", "s_meta", "s_user"]:
    edge("REVIEWS", attr)
for attr in ["p_appid", "p_ccu", "p_owners", "p_apm", "p_1yr", "p_peak"]:
    edge("PLAYER_STATS", attr)

# ----------------------------------------------------------
# Relationship edges - 1:1
# Arrows point FROM entity TOWARD diamond (tip on diamond border)
# Thick line = total participation (dependent tables)
# ----------------------------------------------------------
import math as _math


def rel_edge(entity, diamond_name, thick=False):
    """Draw arrowed edge from entity border to diamond border."""
    _, ex, ey, _, _ = shapes[entity]
    _, dxc, dyc, _, _ = shapes[diamond_name]
    x1, y1 = get_border(entity, dxc, dyc)  # leave entity toward diamond center
    x2r, y2r = get_border(diamond_name, ex, ey)  # diamond border toward entity center
    # Nudge 0.05 units into diamond so tip visibly touches
    _dist = _math.hypot(dxc - x2r, dyc - y2r) or 1
    x2 = x2r + 0.05 * (dxc - x2r) / _dist
    y2 = y2r + 0.05 * (dyc - y2r) / _dist
    lw = 3.5 if thick else 1.8
    ax.annotate(
        "",
        xy=(x2, y2),
        xytext=(x1, y1),
        arrowprops=dict(
            arrowstyle="->",
            color="black",
            lw=lw,
            mutation_scale=18,
            shrinkA=0,
            shrinkB=0,
        ),
    )


# GAMES --receives-- REVIEWS  (1:1, REVIEWS totally participates)
rel_edge("GAMES", "has_scores", thick=False)  # thin arrow GAMES -> diamond
rel_edge("REVIEWS", "has_scores", thick=True)  # thick arrow REVIEWS -> diamond

# PLAYER_STATS --belongs_to-- GAMES  (1:1, PLAYER_STATS totally participates)
rel_edge("GAMES", "has_players", thick=False)  # thin arrow GAMES -> diamond
rel_edge(
    "PLAYER_STATS", "has_players", thick=True
)  # thick arrow PLAYER_STATS -> diamond


ax.set_title(
    "ER Diagram - Steam Games Database (CPSC 368 Phase 3)",
    fontsize=13,
    fontweight="bold",
    pad=10,
)

plt.tight_layout()
fig.savefig("figures/er_diagram.png", dpi=150, bbox_inches="tight")
plt.close(fig)
print("Saved figures/er_diagram.png")
