<xtag style='line-height: calc(0.85em + 2px);'
><bra class={closed: closed, short: !!opts.short}><hide>&lt;</hide><virtual if={!opts.short}
  ><tag>{opts.type}</tag
  ><cls  each={class in classes}><wbr/>.{class}</cls
  ><id   if={opts.xid}><wbr/>&nbsp;{opts.xid}</id
  ><opts if={opts.xopts}><wbr/>&nbsp;{'{' + opts.xopts + '}'}</opts
  ><dirs if={opts.xdirs}><wbr/>&nbsp;{opts.xdirs}</dirs
></virtual><hide>{closed ? '/>' : '>'}</hide></bra
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
hide {
  font-size: 0;
  line-height: 0;
}

bra, ket {
  display: inline-block;
  color: var(--tag-text-color);
  text-shadow: -1px 0 1px var(--tag-back-color), 0 1px 1px var(--tag-back-color), 1px 0 1px var(--tag-back-color), 0 -1px 1px var(--tag-back-color);
  border-left: 1ex solid;
  border-right: 1ex solid;
}

bra {
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L3.9,0 L8.95,0 L7.5,5 L8.95,10 L3.9,10Z' fill='%23505050' stroke='%23404040' stroke-width='0.2'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
}

bra.short {
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L3.9,0 L3.95,0 L2.5,5 L3.95,10 L3.9,10Z' fill='%23505050' stroke='%23404040' stroke-width='0.2'/%3E%3C/svg%3E") 0 0 0 4 fill stretch;
  border-right: none;
}

bra.closed {
	border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,5 L3.9,0 L6.1,0 L10,5 L6.1,10 L3.9,10Z' fill='%23505050' stroke='%23404040' stroke-width='0.2'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
}

ket {  
  border-image: url("data:image/svg+xml,%3Csvg width='10' height='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M2.5,5 L1.05,0 L6.1,0 L10,5 L6.1,10 L1.05,10Z' fill='%23505050' stroke='%23404040' stroke-width='0.2'/%3E%3C/svg%3E") 0 4 0 4 fill stretch;
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

this.classes = !opts.xclass ? [] : opts.xclass.split(' ');

this.on('mount', function() {
  this.update({
    closed: !that._internal.innerHTML
  });
});

</xtag>
