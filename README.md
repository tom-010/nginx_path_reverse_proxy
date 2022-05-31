nginx_path_reverse_proxy
========================

This is a very minimal example, how to setup a nginx-reverse-proxy, 
that dispatches the traffic by a prefix path:

* `localhost` -> container `home`
* `localhost/site1` -> containter `site1`
* `localhost/site2` -> containter `site2`

For more options on configure the proxy, see, the [official docu](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/).

To run this example, run

```bash
./scripts/run.sh
```

and in a different terminal

```bash
curl http://localhost
curl http://localhost/site1/
curl http://localhost/site2/
```

## Do not use this (unless you have a very specific use-case)

While this works from the perspective from the reverse proxy quite well (and easy) it breaks the 
assumption, which many applications make. That is, that `/` is the root of the application. You 
can notice that for example when including css, it is common praxis to use `/style.css`, which 
would "break out" of the container (should be `/site1/style.css`). Also when the server requests 
redirect, we normally redirect away of the container to a 404, as the container on `/` does not 
know the path. 

In the area of wordpress & co, it was quite common to dispatch via the path, as apps were deployed
via FTP to the root of a static HTTP-Server. These apps did all the leg-work to prefix every url 
with a configurable absolute url. But we cannot expect that from modern application, which makes 
this kind of reverse-proxy-approach unusable. 

