<xtag style='line-height: 16px; --flo-height: {floHeight}; --coflo-height: {cofloHeight};'
><bra ref='bra' class={nonvoid: !isVoidTag, short: !!opts.short}><hide>&lt;</hide><virtual if={!opts.short}
  ><tag>{opts.type}</tag
  ><cls  each={class in classes}><wbr/>.{class}</cls
  ><id   if={opts.xid}><wbr/>&nbsp;{opts.xid}</id
  ><opts if={opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
></virtual><hide if={!isVoidTag}>&gt;</hide></bra
><yield><ket ref='ket' class={nonvoid: !isVoidTag, void: isVoidTag, short: !!opts.short}
  ><hide>{!isVoidTag ? '&lt;' : ''}/</hide
  ><tag if={!isVoidTag}>{opts.type}</tag
  ><cls if={!!opts.short} each={class in classes}><wbr/>.{class}</cls
  ><id  if={!!opts.short && opts.xid}><virtual if={!!opts.type || (!!classes && !!classes.length)}><wbr/>&nbsp;</virtual>{opts.xid}</id
  ><opts if={!!opts.short && opts.xopts}><virtual if={!!opts.type || (!!classes && !!classes.length) || !!opts.xid}><wbr/>&nbsp;</virtual>{'{' + opts.xopts + '}'}</opts
  ><dirs if={!!opts.short && opts.xdirs}><virtual if={!!opts.type || (!!classes && !!classes.length) || !!opts.xid || !!opts.xopts}><wbr/>&nbsp;</virtual>{opts.xdirs}</dirs
><hide>&gt;</hide></ket
><style scoped>
hide {
  font-size: 0;
}

bra, ket {
  display: inline-block;
  color: var(--tag-text-color);
  background: var(--tag-back-color);
  text-shadow: -1px 0 1px var(--tag-back-color), 0 1px 1px var(--tag-back-color), 1px 0 1px var(--tag-back-color), 0 -1px 1px var(--tag-back-color);
}

bra:before, ket:after, bra.nonvoid:after, ket.nonvoid:before {
  content: "";
  font-family: "Anka/Coder Condensed";
  font-weight: bold;
  width: 0;
  height: 0;
  z-index: -1;
  position: absolute;
}

bra {
  margin-left: 8px;
}

ket {
  padding-right: 2px;
  margin-right: 6px;
}

bra:before {
  margin-left: -6px;
  border-top: 8px solid transparent;
  border-right: 6px solid var(--tag-back-color);
  border-bottom: 8px solid transparent;
}

ket:after {
  border-top: 8px solid transparent;
  border-left: 6px solid var(--tag-back-color);
  border-bottom: 8px solid transparent;
}

ket.nonvoid:after {
  margin-left: 2px;
}

bra.nonvoid {
  padding-right: 6px;
  margin-right: 2px;
}

ket.nonvoid {
  padding-left: 6px;
  margin-left: 2px;
}

bra.nonvoid:after {
  margin-left: 6px;
  height: var(--coflo-height);
  border-top: var(--flo-height) solid var(--tag-back-color);
  border-right: 2px solid transparent;
  border-bottom: var(--flo-height) solid var(--tag-back-color);
}

ket.nonvoid:before {
  margin-left: -8px;
  height: var(--coflo-height);
  border-top: var(--flo-height) solid var(--tag-back-color);
  border-left: 2px solid transparent;
  border-bottom: var(--flo-height) solid var(--tag-back-color);
}

bra.nonvoid.short:after {
  margin-left: 0;
}

bra.nonvoid.short, ket.void {
  height: 18px;
  padding: 0;
}

bra.nonvoid.short {
  margin-left: 6px;
  margin-right: 2px;
}

id, cls, opts, dirs {
  font-family: "Anka/Coder Narrow";
}

id, cls, opts, dirs, hide {
  line-height: 0;
}

cls {
  display:inline-block;
  font-size: small;
}

opts, dirs {
  display:inline-block;
  font-size: smaller;
}

tag {
  font-family: "Anka/Coder Condensed";
}
</style>

this.flapHeight = this.flipHeight = '0.65em';
this.floHeight = '4px';
this.cofloHeight = '10px';
this.exx = '-6px';
this.exy = '-2px';
this.exz = '2px';
this.exg = '6px';
this.isVoidTag = false;
this.classes = !opts.xclass ? [] : opts.xclass.split(' ');

this.on('mount', function() {
  var that = this;
  var adjustSize = function() {
    var d = window.devicePixelRatio;
    var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
    //var rect = (!opts.short ? that.refs.bra : that.refs.ket).getBoundingClientRect();
    //var height = rect.bottom - rect.top + 1/d;
    var height = Math.round(parseFloat(getComputedStyle(!opts.short ? that.refs.bra : that.refs.ket).getPropertyValue('height')) * 64) / 64
    if (isChrome) height += 1/d;
    var exx = parseFloat(getComputedStyle(that.refs.bra, ":before").getPropertyValue('border-right-width'));
    var exz = parseFloat(getComputedStyle(that.refs.ket).getPropertyValue('margin-left'));
    var exy = parseFloat(getComputedStyle(that.refs.ket).getPropertyValue('padding-left')) + parseFloat(getComputedStyle(that.refs.ket, ":before").getPropertyValue('border-left-width'));
    var exg = parseFloat(getComputedStyle(that.refs.bra).getPropertyValue('padding-right'));

    that.update({
      flapHeight: 'calc(' + Math.ceil(height * d / 2) + 'px/'+ d +')',
      flipHeight: 'calc(' + Math.floor(height * d / 2) + 'px/'+ d +')',
      floHeight: 'calc(' + Math.round(height * d / 5) + 'px/'+ d +')',
      cofloHeight: 'calc(' + (height * d - 2 * Math.round(height * d / 5)) + 'px/'+ d +')',
      exx: 'calc(-' + exx * d + 'px/' + d + ')',
      exy: 'calc(-' + exy * d + 'px/' + d + ')',
      exz: 'calc(' + exz * d + 'px/' + d + ')',
      exg: 'calc(' + exg * d + 'px/' + d + ')',
      isVoidTag: !that._internal.innerHTML
    });
  };
  adjustSize();
  window.addEventListener('resize', adjustSize);
});

</xtag>
