# Reset the world

Reset the world is a technique I picked up while at Readify Queensland.
Without it, it is not uncommon for developers to remain unproductive
for a couple of days just setting up their environment.

All projects come with two scripts - [`Reset-the-world.ps1`](.ResetTheWorld\ResetTheWorld.ps1) and [`Update-the-world.ps1`](.\ResetTheWorld\UpdateTheWorld.ps1)

When you roll into a running project, running Reset-The-World should get
your project up and running, including setting up databases.

`Reset-The-World.ps1` performs these tasks
1. Recreate local databases
2. Build the migration script runner
3. Runs the migrations

`Update-The-World.ps1` is just like `Reset-The-World` except it doesn't
recreate local databases.

# Building .csproj files

The Reset-The-World.ps1 script applies a heuristic based on registry keys to find where MSBuild lives. The latest recommendation from Microsoft is to use [vswhere](https://github.com/Microsoft/vswhere)

# Migration scripts

Use [DbUp](http://dbup.readthedocs.io/en/latest/) - it is battle tested.
See My.Migrations.csproj for an example.




