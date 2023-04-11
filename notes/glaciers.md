# Glaciers

**Glaciers** are system snapshots that are created using the `glacier.nix` file. They are a way to preserve the state of your system at a given point in time. Glaciers can be used to roll back to a previous state if something goes wrong, or to create a new system image from a previous snapshot.

To create a Glacier, you need to create a `glacier.nix` file. This file contains the information that is needed to create the snapshot, such as the name of the snapshot, the date and time of the snapshot, and the list of packages that are included in the snapshot.

Once you have created a glacier.nix file, you can create the snapshot by running the following command:

`nixos-rebuild switch --label=<label>`

Where "*label*" is the name of the Glacier.

To roll back to a previous Glacier, you need to run the following command:

`nixos-rebuild switch --rollback=<label>`

Where "*label*" is the name of the Glacier that you want to roll back to.

Here are some examples of how you can use Glaciers:

- **To protect your system from data loss**: You can create a Glacier of your system every day or week. This way, if your system is damaged or you accidentally delete files, you can easily restore your system to a previous state.
**To test new software or configurations**: You can create a Glacier of your system before you install new software or make changes to your configuration. This way, if the new software or configuration doesn't work, you can easily roll back to a previous state.
**To create a system image**: You can create a Glacier of your system and then use that snapshot to create a new system image. This is a great way to quickly and easily deploy a new system with the exact same configuration as an existing system.
