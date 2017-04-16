<xtag style='line-height: calc(0.83em + 1px);'
><bra class={closed: closed, short: !!opts.short}><hide>&lt;</hide><virtual if={!opts.short}
  ><tag>{opts.type}</tag
  ><cls  each={class in classes}><wbr/>.{class}</cls
  ><id   if={opts.xid}><wbr/>&nbsp;{opts.xid}</id
  ><opts if={opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
></virtual>&#8203;<hide>{closed ? '/>' : '>'}</hide></bra
><yield><ket if={!closed} class={short: !!opts.short}
  ><hide>&lt;/</hide
  ><tag>{opts.type}</tag
  ><virtual if={!!opts.short}
  ><cls each={class in classes}><wbr/>.{class}</cls
  ><id  if={opts.xid}><virtual if={!!opts.type || (!!classes && !!classes.length)}><wbr/>&nbsp;</virtual>{opts.xid}</id
  ><opts if={opts.xopts}><virtual if={!!opts.type || (!!classes && !!classes.length) || !!opts.xid}><wbr/>&nbsp;</virtual>{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><virtual if={!!opts.type || (!!classes && !!classes.length) || !!opts.xid || !!opts.xopts}><wbr/>&nbsp;</virtual>{opts.xdirs}</dirs
></virtual><hide>&gt;</hide></ket
><style scoped>
bra, ket {
  display: inline-block;
  color: white;
  text-shadow: -1px 0 1px #505050, 0 1px 1px #505050, 1px 0 1px #505050, 0 -1px 1px #505050;
  border-left: 1ex solid;
  border-right: 1ex solid;
}

bra {
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,50 L34.5,0 L95,0 L80,35 L80,65 L95,100 L34.5,100Z' fill='%23505050'/%3E%3C/svg%3E") 0 40 0 40 fill stretch;
}

bra.short {
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,50 L34.5,0 L35,0 L20,40 L20,60 L35,100 L34.5,100Z' fill='%23505050'/%3E%3C/svg%3E") 0 0 0 40 fill stretch;
  border-right: none;
}

bra.closed {
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,50 L34.5,0 L65.5,0 L100,50 L65.5,100 L34.5,100Z' fill='%23505050'/%3E%3C/svg%3E") 0 40 0 40 fill stretch;
}

ket {  
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20,35 L5,0 L65.5,0 L100,50 L65.5,100 L5,100 L20,65Z' fill='%23505050'/%3E%3C/svg%3E") 0 40 0 40 fill stretch;
}

tag {
  font-family: "Anka/Coder Condensed";
}

cls {
  font-size: small;
}

opts, dirs {
  font-size: smaller;
}

hide {
  font-size: 0;
}

id, cls, opts, dirs, hide {
  font-family: "Anka/Coder Narrow";
  line-height: 0;
}
</style>

this.classes = !opts.xclass ? [] : opts.xclass.split(' ');

this.on('mount', function() {
  this.update({
    closed: !this.__.innerHTML
  });
});

</xtag>
