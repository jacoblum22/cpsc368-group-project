"""Quick validation of steam_games.sql structure."""

with open("steam_games.sql", encoding="utf-8") as f:
    content = f.read()

print(f"drop table:        {content.count('drop table')}")
print(f"purge recyclebin:  {'purge recyclebin' in content}")
print(f"create table:      {content.count('create table')}")
print(f"grant select:      {content.count('grant select')}")
print(f"insert into:       {content.count(chr(10) + 'insert into')}")
print(f"ends with commit:  {content.strip().endswith('commit;')}")

insert_values = [l for l in content.split("\n") if l.startswith("values(")]
bad = [l for l in insert_values if l.count("'") % 2 != 0]
print(f"quoting issues:    {len(bad)}")
for b in bad[:5]:
    print(" ", b[:100])
