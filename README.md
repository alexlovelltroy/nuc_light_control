# NUC6CAYH led ring control container

![Blinky Lights Demo](DaemonSetDemo.gif)

This container includes the kernel module from [milesp20](https://github.com/milesp20/intel_nuc_led) compiled for several stretch kernel versions and a script to control the ring.

I use this in a Daemonset on my local kubernetes cluster to make lights blink.  See an example of the [DaemonSet in my gist](https://gist.github.com/alexlovelltroy/346a9f5200e7b3711e452c3e05fd9b9e).  In the gif above, I launch the daemonset and each node switches the color of the ring.  In reality, it takes about three minutes on my cluster, but I sped it up to fit in a 24 second gif.

You can find the container on dockerhub: [alexlovelltroy/nuc_light_control](https://hub.docker.com/r/alexlovelltroy/nuc_light_control) with tags for debian strech and ubuntu bionic.
