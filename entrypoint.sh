#!/usr/bin/env bash

DDN_DIR=/opt/data/

mkdir -p ${DDN_DIR}

if test $# -eq 0; then
  [ ! -f "${DDN_DIR}/app.js" ] && {
    echo 'Copying DDN files...'
    mv -f /opt/coin/* ${DDN_DIR}
    # http://docs.ddn.link/zh-CN/guide/peer-install-mainnet#242-%E9%85%8D%E7%BD%AE%E5%8F%AF%E8%AE%BF%E9%97%AE%E7%9A%84%E8%8A%82%E7%82%B9
    sed -i 's/"list": \[/"list": \[{"ip":"peer.ddn.link","port":8000},{"ip":"101.132.34.62","port":8000},{"ip":"119.23.67.225","port":8000}/' ${DDN_DIR}/config.json
  }
  cd ${DDN_DIR}
  echo 'Started'
  exec node ${DDN_DIR}/app.js --base ${DDN_DIR}
else
  exec $@
fi
