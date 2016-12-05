<xtag style='line-height: calc(0.85em + {window.devicePixelRatio}px);'
><nobr><triangle-left>&lt;</triangle-left><inverted class={pad-right: !isVoidTag && !!opts.type && (!classes || !classes.length) && !opts.xid && (!opts.xopts || !!opts.short) && !opts.xdirs}><b class="tagType">{opts.type}</b></inverted></nobr
><inverted class={pad-right: !isVoidTag && !!opts.type} if={!(!classes || !classes.length) || !!opts.xid || (!!opts.xopts && !opts.short) || !!opts.xdirs}
><span class='className' style='line-height: calc(0.85em + {window.devicePixelRatio}px);' each={class in classes}><wbr/>.{class}</span
><span class='name' style='line-height: calc(0.85em + {window.devicePixelRatio}px);' if={opts.xid}><wbr/>&nbsp;{opts.xid}</span
><span class='options' style='line-height: calc(0.85em + {window.devicePixelRatio}px);' if={opts.xopts && !opts.short}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</span
><span class='directives' style='line-height: calc(0.85em + {window.devicePixelRatio}px);' if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</span
></inverted
><virtual if={!isVoidTag}
><nobr><pad/><inarrow-left-top
  name=itp
  style="
    border-top-width: {hlop}px;
    border-left-width: {hlop}px;"
/><inarrow-left-bottom
style="
    border-bottom-width: {hlop}px;
    border-left-width: {hlop}px;
    margin-left: calc(-{itp.getBoundingClientRect().width * window.devicePixelRatio}px / {window.devicePixelRatio})"
/><arrow-right-invisible style="
    margin-left: calc(-{itp.getBoundingClientRect().width * window.devicePixelRatio}px / {window.devicePixelRatio} - 0.5ex);
    width: calc({itp.offsetWidth * window.devicePixelRatio}px / {window.devicePixelRatio} + 0.5ex);">&gt;</arrow-right-invisible
></nobr><wbr/><virtual name="content"><yield
/></virtual><wbr/
></virtual><nobr
><virtual if={!isVoidTag}><inarrow-right-top style="
  border-top-width: {hlop}px;
  border-right-width: {hlop}px;
  "
/><inarrow-right-bottom style="
    border-bottom-width: {hlop}px;
    border-right-width: {hlop}px;
    margin-left: calc(-{itp.getBoundingClientRect().width * window.devicePixelRatio}px / {window.devicePixelRatio})"
/><inverted style="padding-right: {(!opts.short || !!opts.xopts) ? itp.offsetWidth : 0}px"></inverted><arrow-left-invisible
  style="
    margin-left: calc(-{itp.getBoundingClientRect().width * window.devicePixelRatio}px / {window.devicePixelRatio} - 0.5ex);
    width: calc({itp.getBoundingClientRect().width * window.devicePixelRatio}px / {window.devicePixelRatio} + 0.5ex);
    ">&lt;</arrow-left-invisible
><inverted class="pad-left" if={!opts.short || !!opts.xopts}><b class="tagType" if={!opts.short}>{opts.type}</b
><span class='options' style='line-height: calc(0.85em + {window.devicePixelRatio}px);' if={opts.xopts && opts.short}>{'{' + opts.xopts + '}'}</span
></inverted></virtual><pad/><triangle-right>&lt;</triangle-right></nobr>


<style scoped>

triangle-left {
  display: inline;
  font-family: "Anka/Coder Condensed";
  font-weight: bold;
  color: transparent;
  width: 1ex;
}

triangle-left:before {
  content: "";
  font-family: "Anka/Coder Condensed";
  font-weight: bold;
  display: inline-block;
  position: absolute;
  width: 0;
  height: 0;
  z-index: -1;
  margin-top: 3px;
  border-top: 9px solid transparent;
  border-right: 1ex solid rgb(30%, 40%, 45%);
  border-bottom: 9px solid transparent;
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
  display: inline-block;
  position: absolute;
  width: 0;
  height: 0;
  z-index: -1;
  margin-top: 3px;
  border-top: 9px solid transparent;
  border-left: 1ex solid rgb(30%, 40%, 45%);
  border-bottom: 9px solid transparent;
}

inarrow-left-top {
  margin-top: 3px; /* TODO */
  width: 0;
  height: 0;
  border-bottom: 0.6ex inset transparent; 
  border-left: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-top;
}

inarrow-left-bottom {
  margin-bottom: 2px; /* TODO */
  width: 0;
  height: 0; 
  border-top: 0.6ex inset transparent;
  border-left: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-bottom;
  margin-left: -0.5ex;
}

inarrow-right-top {
  margin-top: 3px; /* TODO */
  width: 0;
  height: 0; 
  border-bottom: 0.6ex inset transparent; 
  border-right: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-top;
}

inarrow-right-bottom {
  margin-bottom: 2px; /* TODO */
  width: 0;
  height: 0; 
  border-top: 0.6ex inset transparent;
  border-right: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-bottom;
  margin-left: -0.5ex;
}

inverted {
  display: inline-block;
  color: white;
  background: rgb(30%, 40%, 45%);
  text-shadow: -1px 0 1px rgb(30%, 40%, 45%), 0 1px 1px rgb(30%, 40%, 45%), 1px 0 1px rgb(30%, 40%, 45%), 0 -1px 1px rgb(30%, 40%, 45%);
}

inverted.pad-right {
  padding-right: 0.5ex;
}

inverted.pad-left {
  padding-left: 0.5ex;
  margin-left: -0.5ex;
}

pad {}

span.name, span.directives, span.className, span.options {
  font-family: "Anka/Coder Narrow";
}

span.className {
  font-size: small;
  display:inline-block;
}

span.options,  span.directives{
  font-size: smaller;
  display:inline-block;
}

b.tagType {
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
    console.log(that);
    var height = that.lbt.getBoundingClientRect().bottom - that.ltp.getBoundingClientRect().top + 1/d;
    that.update({
      flapHeight: 'calc(' + Math.ceil(height * d / 2) + 'px/'+ d +')',
      flipHeight: 'calc(' + Math.floor(height * d / 2) + 'px/'+ d +')',
      hlop: Math.floor(Math.ceil(height/2)/2) + 'px',
      isVoidTag: !that.content.innerHTML
    });
  };
  adjustSize();
  window.addEventListener('resize', adjustSize);
});

</xtag>
