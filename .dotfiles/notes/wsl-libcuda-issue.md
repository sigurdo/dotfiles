Kilde: [https://superuser.com/questions/1707681/wsl-libcuda-is-not-a-symbolic-link](https://superuser.com/questions/1707681/wsl-libcuda-is-not-a-symbolic-link)

```
cd /usr/lib/wsl/lib
sudo rm libcuda.so libcuda.so.1
sudo ln -s libcuda.so.1.1 libcuda.so.1
sudo ln -s libcuda.so.1 libcuda.so
sudo ldconfig
```

