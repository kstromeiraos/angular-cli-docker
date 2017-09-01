# Angular CLI

Angular CLI is a command line interface for Angular which makes easy to manage an Angular project.

See https://cli.angular.io/ for more information.

## Software versions

- angular-cli: latest
- node: 6.10.0
- npm: 3.1.10

## Create new containers "on-live"

I recommend you to add this line at the end of `~/.bashrc`. This way, when ng command it's called, a new container will be created, it will execute the command specified and then it will be destroyed.

```bash
function ng() {
	docker run --rm -it -v "${PWD}":/home/app -p 4200:4200 -p 49153:49153 -u `id -u`:`id -g` kstromeiraos/angular-cli "ng $* && true"
}
```

This line creates a container which access to your current directory (make sure that you're in the root directory of your project when you call ng command), expose port 4200 (webpack port) and 49153 (live reload port). Files created inside the container are created using your current user, so you won't have permission issues after use the container. Finally, `ng $* && true` make the container respond to signals.

Be aware that you have to reload your shell to apply changes. This can be done executing command `exec \bin\bash`.

## Usage

After you added above line to `~/.bashrc` you can just type ng commands as if Angular CLI were installed in your computer. Some examples are:

##### Generate new project

`ng new PROJECT_NAME`

##### Serve project via a development server

`ng serve --host 0.0.0.0`

##### Generate Components, Directives, Pipes and Services

`ng g component my-new-component # Generates a new component`  
`ng g directive my-new-directive # Generates a new directive`  
`ng g pipe my-new-pipe # Generates a new pipe`  
`ng g service my-new-service # Generates a new service`  
