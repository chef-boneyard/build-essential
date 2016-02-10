#
# Cookbook Name:: build-essential
# Recipe:: _mingw
#
# Copyright 2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe '7-zip::default'

%w(
  http://downloads.sourceforge.net/mingw/msysCORE-1.0.17-1-msys-1.0.17-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/msysCORE-1.0.17-1-msys-1.0.17-ext.tar.lzma
  http://downloads.sourceforge.net/mingw/coreutils-5.97-3-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/coreutils-5.97-3-msys-1.0.13-ext.tar.lzma
  http://downloads.sourceforge.net/mingw/libiconv-1.14-1-msys-1.0.17-dll-2.tar.lzma
  http://downloads.sourceforge.net/mingw/libintl-0.18.1.1-1-msys-1.0.17-dll-8.tar.lzma
  http://downloads.sourceforge.net/mingw/libtermcap-0.20050421_1-2-msys-1.0.13-dll-0.tar.lzma
  http://downloads.sourceforge.net/mingw/make-3.81-3-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/perl-5.8.8-1-msys-1.0.17-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/zlib-1.2.3-2-msys-1.0.13-dll.tar.lzma
  http://downloads.sourceforge.net/mingw/libgdbm-1.8.3-3-msys-1.0.13-dll-3.tar.lzma
  http://downloads.sourceforge.net/mingw/libcrypt-1.1_1-3-msys-1.0.13-dll-0.tar.lzma
  http://downloads.sourceforge.net/mingw/bash-3.1.23-1-msys-1.0.18-bin.tar.xz
  http://downloads.sourceforge.net/mingw/mksh-40.0.0c-1-msys-1.0.17-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/termcap-0.20050421_1-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/libregex-1.20090805-2-msys-1.0.13-dll-1.tar.lzma
  http://downloads.sourceforge.net/mingw/crypt-1.1_1-3-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/m4-1.4.14-1-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/bison-2.4.2-1-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/flex-2.5.35-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/findutils-4.4.2-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/sed-4.2.1-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/gawk-3.1.7-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/grep-2.5.4-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/less-436-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/diffutils-2.8.7.20071206cvs-3-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/texinfo-4.13a-2-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/libmagic-5.04-1-msys-1.0.13-dll-1.tar.lzma
  http://downloads.sourceforge.net/mingw/file-5.04-1-msys-1.0.13-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/mintty-1.0.3-1-msys-1.0.17-bin.tar.lzma
  http://downloads.sourceforge.net/mingw/patch-2.6.1-1-msys-1.0.13-bin.tar.lzma
).each do |url|
  potentially_at_compile_time do
    msys_archive url do
      root_dir node['build-essential']['msys']['path']
    end
  end
end

%w(
  http://iweb.dl.sourceforge.net/project/tdm-gcc/TDM-GCC%205%20series/5.1.0-tdm64-1/gcc-5.1.0-tdm64-1-core.tar.lzma
  http://iweb.dl.sourceforge.net/project/tdm-gcc/MinGW-w64%20runtime/GCC%205%20series/mingw64runtime-v4-git20150618-gcc5-tdm64-1.tar.lzma
  http://sourceforge.net/projects/tdm-gcc/files/GNU%20binutils/binutils-2.25-tdm64-1.tar.lzma
  http://sourceforge.net/projects/tdm-gcc/files/TDM-GCC%205%20series/5.1.0-tdm64-1/gcc-5.1.0-tdm64-1-c++.tar.lzma
).each do |url|
  potentially_at_compile_time do
    msys_archive url do
      root_dir node['build-essential']['msys']['path']
      mingw true
    end
  end
end
