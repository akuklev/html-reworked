import {html, css, LitElement, nothing} from 'https://cdn.jsdelivr.net/gh/lit/dist@3/core/lit-core.min.js';
function*join(t,s){const i="function"==typeof s;if(void 0!==t){let e=-1;for(const n of t)e>-1&&(yield i?s(e):s),e++,yield n}}
  
export class Tag extends LitElement {
  
  static properties = {
    type: {type: String},
    id: {type: String},
    cls: {type: String},
    dirs: {type: String},
    opts: {type: String},
    short: {type: Boolean},
  };

  static styles = css`
:host {
  line-height: calc(0.83em + 1px);
}

bra, ket, bracket {
  display: inline-block;
  color: white;
  text-shadow: -1px 0 1px #505050, 0 1px 1px #505050, 1px 0 1px #505050, 0 -1px 1px #505050;
  border-top: 0 none;
  border-left: 1ex solid;
  border-right: 1ex solid;
  border-bottom: 0 none;  
}

bra {
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,50 L34.5,0 L95,0 L80,35 L80,65 L95,100 L34.5,100Z' fill='%23505050'/%3E%3C/svg%3E") 0 40 0 40 fill stretch;
}

bra[short] {
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,50 L34.5,0 L35,0 L20,40 L20,60 L35,100 L34.5,100Z' fill='%23505050'/%3E%3C/svg%3E") 0 0 0 40 fill stretch;
  border-right: 0 none;
}

bra[short]::before {
  content: '\\200B';
  font-family: "Anka/Coder Condensed";
}

bracket {
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,50 L34.5,0 L65.5,0 L100,50 L65.5,100 L34.5,100Z' fill='%23505050'/%3E%3C/svg%3E") 0 40 0 40 fill stretch;
}

ket {  
  border-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20,35 L5,0 L65.5,0 L100,50 L65.5,100 L5,100 L20,65Z' fill='%23505050'/%3E%3C/svg%3E") 0 40 0 40 fill stretch;
}

tag {
  font-family: "Anka/Coder Condensed";
  font-stretch: condensed;
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
  font-family: "Anka/Coder Narrow" !important;
  line-height: 0;
}
`;

  render() {
    let hasChildren = (this.childNodes.length != 0);
    let el = this;

    let tag = el.type ?? nothing;

    let tagParts = (function*() {
      if (el.cls) yield html`${tag}${el.cls.split(' ').map((cls) => html`<cls><wbr/>.${cls}</cls>`)}`;
      else if (el.type) yield tag;
      if (el.id)   yield html`<id>${el.id}</id>`;
      if (el.opts) yield html`<opts>${'{' + el.opts + '}'}</opts>`;
      if (el.dirs) yield html`<dirs>${el.dirs}</dirs>`;
    })();
   
    let fulltag = join(tagParts, html`<wbr/>&ensp;`);

    let bra = this.short ? html`<bra short><hide>&lt;&gt;</hide></bra>`
      : html`<bra><hide>&lt;</hide><tag>${fulltag}</tag><hide>&gt;</hide></bra>`;

    let ket = html`<ket><hide>&lt;/</hide><tag>${this.short ? fulltag : tag}</tag><hide>&gt;</hide></ket>`
  
    return hasChildren ? html`${bra}<slot></slot>${ket}`
      : html`<bracket><hide>&lt;</hide><tag>${fulltag}</tag><hide>/&gt;</hide></bracket>`;
  }
}
customElements.define('x-tag', Tag);
