# nginx RTMP streamer

This is the custom nginx server setup for pushing and pulling RTMP streams.

The `nginx.conf` should be modified with the endpoints you expect to stream to or pull from.

Using the default `nginx.conf` in this repo will expose a publically available RTMP endpoint at `/live/$OPTIONAL_STREAM_KEY`.

You can also set a [push](https://github.com/arut/nginx-rtmp-module/wiki/Directives#push) and [pull](https://github.com/arut/nginx-rtmp-module/wiki/Directives#pull) endpoint (or both), if desired.

## Resources

[Configuration Options for `nginx-rtmp-module`](https://github.com/arut/nginx-rtmp-module/wiki/Directives)

[Authentication can be added via HTTP Basic Auth]([The image is heavily based off of the tutorial here](https://obsproject.com/forum/resources/how-to-set-up-your-own-private-rtmp-server-using-nginx.50/))

[The image is heavily based off of the tutorial here](https://obsproject.com/forum/resources/how-to-set-up-your-own-private-rtmp-server-using-nginx.50/)
