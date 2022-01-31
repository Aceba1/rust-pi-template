# Rust-Pi Template

A rust template for cross-compiling and remotely executing code for the Raspberry Pi.

(Instructions based off of this [blog post](https://chacin.dev/blog/cross-compiling-rust-for-the-raspberry-pi/))

# Workspace Setup
### Install rustup for Workspace
- https://rustup.rs/

### Add the Standard Library
- `rustup target add armv7-unknown-linux-gnueabihf`

### Install Raspberry Pi Toolchain
- Windows: https://gnutoolchains.com/raspberry/

# New Project Setup

### Initialize Rust project
- `cargo new "project-name"`

### Create config file
- Create a file in (project root)`/.cargo/config.toml`
- Add contents:
```
[build]
target = "armv7-unknown-linux-gnueabihf"

[target.armv7-unknown-linux-gnueabihf]
linker = "arm-linux-gnueabihf-gcc"
```

# Run on Remote SSH

It is recommended to generate `id_rsa.pub` (with `ssh-keygen`) for the workspace, and append it to the Pi host's keys (located in `~/.ssh/authorized_keys`)

Instructions here serve as reference, a local script may be of more use.

## Commands:

- Build: `cargo build`

- Copy: `scp .\target\armv7-unknown-linux-gnueabihf\debug\rust-pi-template pi@raspberrypi.local:/tmp/vscode-rust-exec`

- Run: `ssh pi@raspberrypi.local 'chmod +x /tmp/vscode-rust-exec && /tmp/vscode-rust-exec'`