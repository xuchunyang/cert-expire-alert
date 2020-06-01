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
