# 检查证书过期

使用方法:

    $ ./cert-expire-alert.sh --help
    usage: cert-expire-alert.sh hostname

举例：

    $ DATE=gdate ./cert-expire-alert.sh emacs-china.org
    OK Expire after 88.86 days, Aug 29 14:51:45 2020 GMT
    
    $ DATE=gdate ./cert-expire-alert.sh elpa.emacs-china.org
    OK Expire after 79.29 days, Aug 20 01:13:19 2020 GMT
    
    $ DATE=gdate ./cert-expire-alert.sh elpa.zilongshanren.com
    ERROR Expire after 11.97 days, Jun 13 17:37:48 2020 GMT

## Emacs China & Emacs China ELPA 证书快过期了没有？

![](https://github.com/xuchunyang/cert-expire-alert/workflows/emacs-china-daily-check/badge.svg)

上面这个 GitHub Action 每天 0 点都会检查 https://emacs-china.org 和 https://elpa.emacs-china.org 的证书，如果快过期了，Action 就会失败。
