## compile 
```
apt install linux-headers-`uname -r`
make
make install
```

## set as default congestion method

```
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbrplus" >> /etc/sysctl.conf
```