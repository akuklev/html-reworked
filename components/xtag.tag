<xtag style='line-height: calc(0.85em + 2px); --exg: {exg}; --exx: {exx}; --exy: {exy}; --exz: {exz}; --flip-height: {flipHeight}; --flap-height: {flapHeight}; --flo-height: {floHeight}; --coflo-height: {cofloHeight};'
><bra ref='bra' class={nonvoid: !isVoidTag, short: !!opts.short}><hide>&lt;</hide><virtual if={!opts.short}
  ><tag>{opts.type}</tag
  ><cls  each={class in classes}><wbr/>.{class}</cls
  ><id   if={opts.xid}><wbr/>&nbsp;{opts.xid}</id
  ><opts if={opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
></virtual><hide if={!isVoidTag}>&gt;</hide></bra
><yield><ket ref='ket' class={nonvoid: !isVoidTag, void: isVoidTag, short: !!opts.short}
  ><hide>{!isVoidTag ? '&lt;' : ''}/</hide
  ><tag class={hidden: isVoidTag}>{opts.type}</tag
  ><cls if={!!opts.short} each={class in classes}><wbr/>.{class}</cls
  ><id  if={!!opts.short && opts.xid}><virtual if={!!opts.type || (!!classes && !!classes.length)}><wbr/>&nbsp;</virtual>{opts.xid}</id
  ><opts if={!!opts.short && opts.xopts}><virtual if={!!opts.type || (!!classes && !!classes.length) || !!opts.xid}><wbr/>&nbsp;</virtual>{'{' + opts.xopts + '}'}</opts
  ><dirs if={!!opts.short && opts.xdirs}><virtual if={!!opts.type || (!!classes && !!classes.length) || !!opts.xid || !!opts.xopts}><wbr/>&nbsp;</virtual>{opts.xdirs}</dirs
><hide>&gt;</hide></ket
><style scoped>
hide, .hidden {
  font-size: 0;
  line-height: 0;
}

bra, ket {
  display: inline-block;
  color: var(--tag-text-color);
  text-shadow: -1px 0 1px var(--tag-back-color), 0 1px 1px var(--tag-back-color), 1px 0 1px var(--tag-back-color), 0 -1px 1px var(--tag-back-color);
}

bra {
  border-left: 1ex solid white;
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L4,0 L6,0 L10,5 L6,10 L4,10Z' fill='%23505050' stroke='%23404040' stroke-width='0.2'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
}

ket {
  border-right: 1ex solid white;
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L4,0 L6,0 L10,5 L6,10 L4,10Z' fill='%23505050' stroke='%23404040' stroke-width='0.2'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
}

bra.nonvoid {
  border-right: 1ex solid white;
}

ket.nonvoid {
  border-left: 1ex solid white; 
}

id, cls, opts, dirs {
  font-family: "Anka/Coder Narrow";
  line-height: 0;
}

cls {
  display: inline-block;
  font-size: small;
}

opts, dirs {
  display: inline-block;
  font-size: smaller;
}

tag {
  font-family: "Anka/Coder Condensed";
}
</style>

this.flapHeight = this.flipHeight = '0.65em';
this.floHeight = '4px';
this.cofloHeight = '10px';
this.exx = '-0.75ex';
this.exy = '-0.25ex';
this.exz = '0.25ex';
this.exg = '0.75ex';
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
    var exx = parseFloat(getComputedStyle(that.refs.bra, ":before").getPropertyValue('border-right-width'));
    var exz = parseFloat(getComputedStyle(that.refs.ket).getPropertyValue('margin-left'));
    var exy = parseFloat(getComputedStyle(that.refs.ket).getPropertyValue('padding-left')) + parseFloat(getComputedStyle(that.refs.ket, ":before").getPropertyValue('border-left-width'));
    var exg = parseFloat(getComputedStyle(that.refs.bra).getPropertyValue('padding-right'));

    that.update({
      flapHeight: 'calc(' + Math.ceil(height * d / 2) + 'px/'+ d +')',
      flipHeight: 'calc(' + Math.floor(height * d / 2) + 'px/'+ d +')',
      floHeight: 'calc(' + Math.round(height * d / 5) + 'px/'+ d +')',
      cofloHeight: 'calc(' + (height * d) + 'px/'+ d +')',
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
