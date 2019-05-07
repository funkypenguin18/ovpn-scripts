Инструкция:

тут есть скрипт ./new-openvpn-client.sh 
использовать ./new-openvpn-client.sh clientname
всё генерится и выкладывается тут же файл clientname.ovpn


----------Для меня:
Где брал:   https://hub.docker.com/r/kylemanna/openvpn

Проверить что работает: docker ps  -выведет что докер есть, он должен быть ОДИН!
если там что-то кроме строчки с 
fbab3685f432(рандомный хэш)        kylemanna/openvpn   "ovpn_run"  ....

то убить docker kill хэш_левой_херни 

если нет, то ./run.sh   там делов-то OVPN_DATA="ovpn-data" переменная для волюма и 
docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn

можно даже просто 
docker run -v ovpn-data:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn

------Усли генерить руками:
пароль penguin у сервера (как примерЮ он есть в скрипте), спрашивают при генерации

Сгенерить клиента с именем CLIENTNAME:
docker run -v ovpn-data:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME nopass

Выгрузить сертификат клиента CLIENTNAME:
docker run -v ovpn-data:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn


