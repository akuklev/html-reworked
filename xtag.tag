<xtag
><nobr><arrow-left-bottom
  name=lbt
  style="border-bottom-width: {flipHeight}; margin-right: calc(-{ltp.getBoundingClientRect().width * 4}px / 4)"
/><arrow-left-top
  name=ltp style="
    border-top-width: {flapHeight};
    margin-left: 0px"
/><arrow-left-invisible>&lt;</arrow-left-invisible
><inverted><b class="tagType">{opts.type}</b></inverted></nobr
><inverted class={pad-right: !isVoidTag && !!opts.type}
><span class='className' each={class in classes}><wbr/>.{class}</span
><span class='name' if={opts.xid}><wbr/> {opts.xid}</span
><span class='options' if={opts.xopts && !opts.short}><wbr/> {'{' + opts.xopts + '}'}</span
><span class='directives' if={opts.xdirs}><wbr/>┆{opts.xdirs}</span
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
    margin-left: calc(-{itp.getBoundingClientRect().width * 4}px / 4)"
/><arrow-right-invisible style="
    margin-left: calc(-{itp.getBoundingClientRect().width * 4}px / 4 - 0.5ex);
    width: calc({itp.offsetWidth * 4}px / 4 + 0.5ex);">&gt;</arrow-right-invisible
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
    margin-left: calc(-{itp.getBoundingClientRect().width * 4}px / 4)"
/><inverted style="padding-right: {(!opts.short || !!opts.xopts) ? itp.offsetWidth : 0}px"></inverted><arrow-left-invisible
  style="
    margin-left: calc(-{itp.getBoundingClientRect().width * 4}px / 4 - 0.5ex);
    width: calc({itp.getBoundingClientRect().width * 4}px / 4 + 0.5ex);
    ">&lt;</arrow-left-invisible
><inverted if={!opts.short || !!opts.xopts}><b class="tagType" if={!opts.short}>{opts.type}</b
><span class='options' if={opts.xopts && opts.short}>{'{' + opts.xopts + '}'}</span
></inverted></virtual><pad/><arrow-right-top
  name=rtp
  style="
    border-top-width: {flapHeight};
    margin-right: calc(-{ltp.getBoundingClientRect().width * 4}px / 4)"
/><arrow-right-bottom
  style="border-bottom-width: {flipHeight}"
/><arrow-right-invisible><virtual if={isVoidTag}>/</virtual>&gt;</arrow-right-invisible></nobr>


<style scoped>

xtag {
  line-height: 1.25em;
}

arrow-left-invisible {
  color: transparent;
  width: 1ex;
  margin-left: -1ex;
  display: inline-block;
  overflow: hidden;
  vertical-align: text-bottom;
}

arrow-left-bottom {
  width: 0;
  height: 0; 
  border-bottom: inset transparent; 
  border-right: 1ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-bottom;
}

arrow-left-top {
  width: 0;
  height: 0; 
  border-top: inset transparent;
  border-right: 1ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-top;
  margin-left: -1ex;
}

arrow-right-invisible {
  color: transparent;
  width: 1ex;
  margin-left: -1ex;
  display: inline-block;
  overflow: hidden;
  vertical-align: text-bottom;
}

arrow-right-bottom {
  width: 0;
  height: 0; 
  border-bottom: inset transparent; 
  border-left: 1ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-bottom;
}

arrow-right-top {
  width: 0;
  height: 0; 
  border-top: inset transparent;
  border-left: 1ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-top;
  margin-right: -1ex;
}

inarrow-left-top {
  width: 0;
  height: 0;
  border-bottom: 0.6ex inset transparent; 
  border-left: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-top;
}

inarrow-left-bottom {
  width: 0;
  height: 0; 
  border-top: 0.6ex inset transparent;
  border-left: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-bottom;
  margin-left: -0.5ex;
}

inarrow-right-top {
  width: 0;
  height: 0; 
  border-bottom: 0.6ex inset transparent; 
  border-right: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-top;
}

inarrow-right-bottom {
  width: 0;
  height: 0; 
  border-top: 0.6ex inset transparent;
  border-right: 0.5ex solid rgb(30%, 40%, 45%);
  display: inline-block;
  vertical-align: text-bottom;
  margin-left: -0.5ex;
}

inverted {
  display: inline;
  color: white;
  background: rgb(30%, 40%, 45%);
  display: inline;
  line-height: 1em;
}

inverted.pad-right {
  padding-right: 0.5ex;
}

pad {}

span.name, span.directives, span.className, span.options {
  font-family: "Anka/Coder Narrow";
}

span.className {
  font-size: small;
}

span.options {
  font-size: smaller;
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
