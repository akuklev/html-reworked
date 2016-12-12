<xtag style='line-height: calc(0.85em + {window.devicePixelRatio}px);'
><bra class={nonvoid: !isVoidTag, short: !!opts.short}><hide>&lt;</hide><virtual if={!opts.short}
  ><tag>{opts.type}</tag
  ><class each={class in classes}><wbr/>.{class}</class
  ><id if={opts.xid}><wbr/>&nbsp;{opts.xid}</id
  ><opts if={opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
></virtual><hide if={!isVoidTag}>&gt;</hide></bra
><virtual name="content"><yield/></virtual
><nobr
><virtual if={!isVoidTag}><trapezoid-left class="eat-digraph">&lt;/</trapezoid-left><inverted class="pad-left" if={!opts.short || !!opts.xopts}><b class="tagType" if={!opts.short}>{opts.type}</b
><span class='options' style='line-height: calc(0.85em + {window.devicePixelRatio}px);' if={opts.xopts && opts.short}>{'{' + opts.xopts + '}'}</span
></inverted></virtual><triangle-right>&gt;</triangle-right></nobr>


<style scoped>
hide {
  display: none;
}

bra {
  margin-left: 1ex;
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

bra.nonvoid.short:after {
  margin-left: 0;
}

bra.nonvoid.short {
  margin-left: 0.5ex;
  padding: 0;
}


triangle-right {
  display: inline;
  font-family: "Anka/Coder Condensed";
  font-weight: bold;
  color: transparent;
  width: 1ex;
}

triangle-right:before {
  content: "";
  font-family: "Anka/Coder Condensed";
  font-weight: bold;
  position: absolute;
  width: 0;
  height: 0;
  z-index: -1;
  margin-top: 3px;
  border-top: 9px solid transparent;
  border-left: 1ex solid var(--tag-back-color);
  border-bottom: 9px solid transparent;
}

trapezoid-left {
  display: inline;
  font-family: "Anka/Coder Condensed";
  color: transparent;
}

trapezoid-left:before {
  content: "";
  font-family: "Anka/Coder Condensed";
  position: absolute;
  width: 0;
  margin-left: 0.2ex;
  height: 10px;
  z-index: -1;
  margin-top: 3px;
  border-top: 4px solid var(--tag-back-color);
  border-left: 0.5ex solid transparent;
  border-bottom: 4px solid var(--tag-back-color);
}

.eat-digraph {
  margin-right: -1ex;
}

bra, inverted {
  display: inline-block;
  color: var(--tag-text-color);
  background: var(--tag-back-color);
  text-shadow: -1px 0 1px var(--tag-back-color), 0 1px 1px var(--tag-back-color), 1px 0 1px var(--tag-back-color), 0 -1px 1px var(--tag-back-color);
}

inverted.pad-right {
  padding-right: 0.5ex;
  margin-right: -0.5ex;
}

inverted.pad-left {
  padding-left: 0.5ex;
  margin-left: -0.5ex;
}

pad {}

id, class, opts, dirs, span.name, span.directives, span.className, span.options {
  font-family: "Anka/Coder Narrow";
}

id, class, opts, dirs {
  line-height: 0;
}

class, span.className {
  display:inline-block;
  font-size: small;
}

opts, dirs, span.options, span.directives{
  display:inline-block;
  font-size: smaller;
}

tag, b.tagType {
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
