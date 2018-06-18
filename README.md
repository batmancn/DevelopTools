# 概述

这里分享一些开发过程中用到的小脚本，用于加速开发，欢迎大家向这个仓库贡献自己的小脚本。

仓库：https://github.com/batmancn/DevelopTools.git


## zipandcryptofiles.sh

有一个文件夹，记录了工作中遇到的问题，但是这些东西不能传到网上，所以不能使用git。为了防止记录丢失，又需要经常备份，于是开发了这个脚本。

脚本的使用方法如下：
Usage: zipandcryptofiles.sh COMMAND zipfilename.zip [zipfilefolder]
  COMMAND: zip|unzip

可以通过zip的方式，压缩、解压缩文件夹。


## get_file_time.py

可以获得文件的创建、修改、访问时间。


## copy_modified.sh

这个工具用来拷贝git仓库中所有修改的文件到某个位置。
