<xtag style='line-height: calc(0.85em + 2px); --ex: {ex}; --flip-height: {flipHeight}; --flap-height: {flapHeight};'
><bra ref='bra' class={nonvoid: !isVoidTag, short: !!opts.short}><hide>&lt;</hide><virtual if={!opts.short}
  ><tag>{opts.type}</tag
  ><cls  each={class in classes}><wbr/>.{class}</cls
  ><id   if={opts.xid}><wbr/>&nbsp;{opts.xid}</id
  ><opts if={opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
></virtual><hide if={!isVoidTag}>&gt;</hide></bra
><virtual name="content"><yield/></virtual
><ket class={nonvoid: !isVoidTag, void: isVoidTag, short: !!opts.short}><hide if={!isVoidTag}>&gt;</hide
  ><hide>/</hide
  ><tag if={!isVoidTag}>{opts.type}</tag
  ><cls if={!!opts.short} each={class in classes}><wbr/>.{class}</cls
  ><opts if={!!opts.short && opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={!!opts.short && opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
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
  margin-left: 1ex;
}

ket {
  margin-right: 1ex;
}

bra:before {
  margin-left: -1ex;
  border-top: var(--flip-height) solid transparent;
  border-right: 1ex solid var(--tag-back-color);
  border-bottom: var(--flap-height) solid transparent;
}

ket:after {
  border-top: 9px solid transparent;
  border-left: 1ex solid var(--tag-back-color);
  border-bottom: 9px solid transparent;
}

bra.nonvoid {
  padding-right: 0.5ex;
  margin-right: 0.5ex;
}

ket.nonvoid {
  padding-left: 0.5ex;
  margin-left: 0.5ex;
}

bra.nonvoid:after {
  margin-left: 0.5ex;
  height: 10px;
  border-top: 4px solid var(--tag-back-color);
  border-right: 0.5ex solid transparent;
  border-bottom: 4px solid var(--tag-back-color);
}

ket.nonvoid:before {
  margin-left: -1ex;
  height: 10px;
  border-top: 4px solid var(--tag-back-color);
  border-left: 0.5ex solid transparent;
  border-bottom: 4px solid var(--tag-back-color);
}

bra.nonvoid.short:after {
  margin-left: 0;
}

bra.nonvoid.short, ket.void {
  height: 15px;
  padding: 0;
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
this.ex = '1ex';
this.isVoidTag = false;
this.classes = !opts.xclass ? [] : opts.xclass.split(' ');

this.on('mount', function() {
  var that = this;
  var adjustSize = function() {
    var d = window.devicePixelRatio;
    var braRect = that.refs.bra.getBoundingClientRect();
    var height = braRect.bottom - braRect.top + 1/d;
    console.log(height);
    console.log(that.refs);
    console.log(window.getComputedStyle(that.refs.bra).getPropertyValue("line-height"));
    console.log(window.getComputedStyle(that.refs.bra, ':before').getPropertyValue("margin-left"));
    that.update({
      flapHeight: 'calc(' + Math.ceil(height * d / 2) + 'px/'+ d +')',
      flipHeight: 'calc(' + Math.floor(height * d / 2) + 'px/'+ d +')',
      ex: Math.floor(Math.ceil(height/2)/2) + 'px',
      clHeight: that.refs.bra.clientHeight,
      isVoidTag: !that._internal.innerHTML
    });
  };
  adjustSize();
  window.addEventListener('resize', adjustSize);
});

</xtag>
