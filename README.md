Ports of [Mutable
Instruments](https://github.com/pichenettes/eurorack) modules for the
Qu-Bit Electronix Nebulae v2.

Requires [alternate firmware](https://patchstorage.com/nebulae-firmware-technobear/)
and [mi-UGens](https://github.com/v7b1/mi-UGens)

## Installation

### Manual Build

```sh
git clone --recursive https://github.com/CarlColglazier/MI_Nebulae_v2.git
cd MI_Nebulae_v2
make all
sudo cp -r build/ /usr/share/SuperCollider/Extensions/MI
```

### Pre-built Binaries

```sh
curl https://github.com/CarlColglazier/MI_Nebulae_v2/releases/latest/download/mi_nebulae_v2.tar.gz > mi_nebulae_v2.tar.gz
tar -xzf mi_nebulae_v2.tar.gz
sudo cp -r build/ /usr/share/SuperCollider/Extensions/MI
```

