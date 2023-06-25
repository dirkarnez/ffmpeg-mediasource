ffmpeg-mediasource
==================
- https://developer.mozilla.org/en-US/docs/Web/API/MediaSource

### TODOs
```javascript
var video = document.querySelector('video');
var mediaSource = new MediaSource();
video.srcObject = mediaSource;

mediaSource.addEventListener('sourceopen', function() {
  var sourceBuffer = mediaSource.addSourceBuffer('video/mp4; codecs="avc1.42E01E, mp4a.40.2"');
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'first.mp4');
  xhr.responseType = 'arraybuffer';
  xhr.onload = function() {
    sourceBuffer.appendBuffer(xhr.response);
  };
  sourceBuffer.addEventListener('updateend', function() {
    var xhr2 = new XMLHttpRequest();
    xhr2.open('GET', 'second.mp4');
    xhr2.responseType = 'arraybuffer';
    xhr2.onload = function() {
      sourceBuffer.appendBuffer(xhr2.response);
    };
    xhr2.send();
  });
  xhr.send();
});
```
