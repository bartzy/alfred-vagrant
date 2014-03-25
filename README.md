# Alfred Workflow for Vagrant

This workflow allows you to control a single Vagrant instance of your choice.

You can start, stop, restart and view the status of a Vagrant machine. You can also configure the Vagrant machine you want to control via this workflow.

The packaged workflow can be downloaded [**here**](https://raw.github.com/Bartzy/alfred-vagrant/master/vagrant.alfredworkflow).

![Workflow screenshot](https://raw.github.com/Bartzy/alfred-vagrant/master/screenshot.png "Workflow screenshot")


| Keyword      | Action                            |
| ------------ | --------------------------------- |
| vg           | View status                       |
| vg up        | Start Vagrant                     |
| vg halt      | Stop Vagrant                      |
| vg reload    | Restart Vagrant                   |
| vg configure | Configure the Vagrantfile to use* |

\* To configure the Vagrant workflow, you need to type ```vg configure ``` with a space, and then choose a Vagrantfile you want to control.

## sudo note
If you would like to run the vagrant executable with sudo (for forwarding privileged ports, for example), you would need to do 2 things:

1. Change ```use_sudo=false``` to ```use_sudo=true``` in the workflow files ```action.sh``` and ```status.sh```.
2. Add this line to your sudoers file via ```sudo visudo```:
    ```
%admin ALL = (root) NOPASSWD: /usr/bin/vagrant status, /usr/bin/vagrant status *, usr/bin/vagrant up, /usr/bin/vagrant halt, /usr/bin/vagrant reload
```

If you run Vagrant with your own user, no extra steps are needed to use this workflow.