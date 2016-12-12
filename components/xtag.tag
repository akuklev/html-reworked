<xtag style='line-height: calc(0.85em + {window.devicePixelRatio}px);'
><bra class={nonvoid: !isVoidTag, short: !!opts.short}><hide>&lt;</hide><virtual if={!opts.short}
  ><tag>{opts.type}</tag
  ><cls  each={class in classes}><wbr/>.{class}</cls
  ><id   if={opts.xid}><wbr/>&nbsp;{opts.xid}</id
  ><opts if={opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
></virtual><hide if={!isVoidTag}>&gt;</hide></bra
><virtual name="content"><yield/></virtual
><ket class={nonvoid: !isVoidTag, short: !!opts.short}><hide if={!isVoidTag}>&gt;</hide
  <hide>/</hide
  ><tag if={!isVoidTag}>{opts.type}</tag
  ><cls if={!!opts.short} each={class in classes}><wbr/>.{class}</cls
  ><opts if={!!opts.short && opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={!!opts.short && opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
><hide>&gt;</hide></ket
><style scoped>
hide {
  display: none;
}

bra, ket {
  display: inline-block;
  color: var(--tag-text-color);
  background: var(--tag-back-color);
  text-shadow: -1px 0 1px var(--tag-back-color), 0 1px 1px var(--tag-back-color), 1px 0 1px var(--tag-back-color), 0 -1px 1px var(--tag-back-color);
}

bra {
  margin-left: 1ex;
}

ket {
  margin-right: 1ex;
}

bra:before {
  content: "";
  font-family: "Anka/Coder Condensed";
  font-weight: bold;
  width: 0;
  height: 0;
  z-index: -1;
  position: absolute;
  margin-left: -1ex;
  border-top: 9px solid transparent;
  border-right: 1ex solid var(--tag-back-color);
  border-bottom: 9px solid transparent;
}

ket:after {
  content: "";
  font-family: "Anka/Coder Condensed";
  font-weight: bold;
  position: absolute;
  width: 0;
  height: 0;
  z-index: -1;
  position: absolute;
  margin-left: 1ex;
  border-top: 9px solid transparent;
  border-left: 1ex solid var(--tag-back-color);
  border-bottom: 9px solid transparent;
}

bra.nonvoid {
  padding-right: 0.5ex;
  margin-right: 0.5ex;
}

bra.nonvoid:after {
  content: "";
  font-family: "Anka/Coder Condensed";
  position: absolute;
  width: 0;
  margin-left: 0.5ex;
  height: 10px;
  z-index: -1;
  border-top: 4px solid var(--tag-back-color);
  border-right: 0.5ex solid transparent;
  border-bottom: 4px solid var(--tag-back-color);
}

ket.nonvoid:before {
  content: "";
  font-family: "Anka/Coder Condensed";
  position: absolute;
  width: 0;
  margin-left: 0.2ex;
  height: 10px;
  z-index: -1;
  border-top: 4px solid var(--tag-back-color);
  border-left: 0.5ex solid transparent;
  border-bottom: 4px solid var(--tag-back-color);
}

bra.nonvoid.short:after {
  margin-left: 0;
}

bra.nonvoid.short {
  height: 15px;
  padding: 0;
}

id, cls, opts, dirs {
  font-family: "Anka/Coder Narrow";
}

id, cls, opts, dirs {
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
this.hlop = '0.5ex';
this.isVoidTag = false;
this.classes = !opts.xclass ? [] : opts.xclass.split(' ');

this.on('mount', function() {
  var that = this;
  var adjustSize = function() {
    var d = window.devicePixelRatio;
   
   // var height = that.lbt.getBoundingClientRect().bottom - that.ltp.getBoundingClientRect().top + 1/d;
    that.update({
   //   flapHeight: 'calc(' + Math.ceil(height * d / 2) + 'px/'+ d +')',
   //   flipHeight: 'calc(' + Math.floor(height * d / 2) + 'px/'+ d +')',
   //   hlop: Math.floor(Math.ceil(height/2)/2) + 'px',
      isVoidTag: !that.content.innerHTML
    });
  };
  adjustSize();
  window.addEventListener('resize', adjustSize);
});

</xtag>
