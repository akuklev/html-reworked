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
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L3.45,0 L9.5,0 L8,3.5 L8,6.5 L9.5,10 L3.45,10Z' fill='%23505050'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
}

bra.short {
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L3.45,0 L3.5,0 L2,4 L2,6 L3.5,10 L3.45,10Z' fill='%23505050'/%3E%3C/svg%3E") 0 0 0 4 fill stretch;
  border-right: none;
}

bra.closed {
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L3.45,0 L6.55,0 L10,5 L6.55,10 L3.45,10Z' fill='%23505050'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
}

ket {  
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M2,3.5 L0.5,0 L6.55,0 L10,5 L6.55,10 L0.5,10 L2,6.5Z' fill='%23505050'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
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
