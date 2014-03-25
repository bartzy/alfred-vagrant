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
Since I'm using Vagrant with port forwarding for privileged ports, I run the vagrant executable with sudo.

Since you're probably running Vagrant as your own user, you will need to change this setting. It can be turned off on the workflow scripts ```action.sh``` and ```status.sh``` by changing ```use_sudo=false``` to ```use_sudo=true```.
