function _e(name) {
    throw new Error(`[esm.sh] fs: '${name}' is not implemented`);
}
let F_OK = null;
let R_OK = null;
let W_OK = null;
let X_OK = null;
let access = ()=>_e("accessaccess")
;
let accessSync = ()=>_e("accessSyncaccessSync")
;
let appendFile = ()=>_e("appendFile")
;
let appendFileSync = ()=>_e("appendFileSync")
;
let chmod = ()=>_e("chmod")
;
let chmodSync = ()=>_e("chmodSync")
;
let chown = ()=>_e("chown")
;
let chownSync = ()=>_e("chownSync")
;
let close = ()=>_e("close")
;
let closeSync = ()=>_e("closeSync")
;
let constants = new Proxy({
}, {
    get: ()=>null
});
let copyFile = ()=>_e("copyFile")
;
let copyFileSync = ()=>_e("copyFileSync")
;
let Dir = ()=>_e("Dir")
;
let Dirent = ()=>_e("Dirent")
;
let exists = ()=>_e("exists")
;
let existsSync = ()=>_e("existsSync")
;
let fdatasync = ()=>_e("fdatasync")
;
let fdatasyncSync = ()=>_e("fdatasyncSync")
;
let fstat = ()=>_e("fstat")
;
let fstatSync = ()=>_e("fstatSync")
;
let fsync = ()=>_e("fsync")
;
let fsyncSync = ()=>_e("fsyncSync")
;
let ftruncate = ()=>_e("ftruncate")
;
let ftruncateSync = ()=>_e("ftruncateSync")
;
let futimes = ()=>_e("futimes")
;
let futimesSync = ()=>_e("futimesSync")
;
let link = ()=>_e("link")
;
let linkSync = ()=>_e("linkSync")
;
let lstat = ()=>_e("lstat")
;
let lstatSync = ()=>_e("lstatSync")
;
let mkdir = ()=>_e("mkdir")
;
let mkdirSync = ()=>_e("mkdirSync")
;
let mkdtemp = ()=>_e("mkdtemp")
;
let mkdtempSync = ()=>_e("mkdtempSync")
;
let open = ()=>_e("open")
;
let openSync = ()=>_e("openSync")
;
let read = ()=>_e("read")
;
let readSync = ()=>_e("readSync")
;
let promises = new Proxy({
}, {
    get: (name)=>_e(`promises/${name}`)
});
let readdir = ()=>_e("readdir")
;
let readdirSync = ()=>_e("readdirSync")
;
let readFile = ()=>_e("readFile")
;
let readFileSync = ()=>_e("readFileSync")
;
let readlink = ()=>_e("readlink")
;
let readlinkSync = ()=>_e("readlinkSync")
;
let realpath = ()=>_e("realpath")
;
let realpathSync = ()=>_e("realpathSync")
;
let rename = ()=>_e("rename")
;
let renameSync = ()=>_e("renameSync")
;
let rmdir = ()=>_e("rmdir")
;
let rmdirSync = ()=>_e("rmdirSync")
;
let rm = ()=>_e("rm")
;
let rmSync = ()=>_e("rmSync")
;
let stat = ()=>_e("stat")
;
let Stats = ()=>_e("Stats")
;
let statSync = ()=>_e("statSync")
;
let symlink = ()=>_e("symlink")
;
let symlinkSync = ()=>_e("symlinkSync")
;
let truncate = ()=>_e("truncate")
;
let truncateSync = ()=>_e("truncateSync")
;
let unlink = ()=>_e("unlink")
;
let unlinkSync = ()=>_e("unlinkSync")
;
let utimes = ()=>_e("utimes")
;
let utimesSync = ()=>_e("utimesSync")
;
let watch = ()=>_e("watch")
;
let watchFile = ()=>_e("watchFile")
;
let write = ()=>_e("write")
;
let writeSync = ()=>_e("writeSync")
;
let writeFile = ()=>_e("writeFile")
;
let writeFileSync = ()=>_e("writeFileSync")
;
const __default = {
    access,
    accessSync,
    appendFile,
    appendFileSync,
    chmod,
    chmodSync,
    chown,
    chownSync,
    close,
    closeSync,
    constants,
    copyFile,
    copyFileSync,
    Dir,
    Dirent,
    exists,
    existsSync,
    F_OK,
    fdatasync,
    fdatasyncSync,
    fstat,
    fstatSync,
    fsync,
    fsyncSync,
    ftruncate,
    ftruncateSync,
    futimes,
    futimesSync,
    link,
    linkSync,
    lstat,
    lstatSync,
    mkdir,
    mkdirSync,
    mkdtemp,
    mkdtempSync,
    open,
    openSync,
    promises,
    R_OK,
    read,
    readdir,
    readdirSync,
    readFile,
    readFileSync,
    readlink,
    readlinkSync,
    readSync,
    realpath,
    realpathSync,
    rename,
    renameSync,
    rm,
    rmdir,
    rmdirSync,
    rmSync,
    stat,
    Stats,
    statSync,
    symlink,
    symlinkSync,
    truncate,
    truncateSync,
    unlink,
    unlinkSync,
    utimes,
    utimesSync,
    W_OK,
    watch,
    watchFile,
    write,
    writeFile,
    writeFileSync,
    writeSync,
    X_OK
};
var ee = Object.create;
var b = Object.defineProperty;
var ne = Object.getOwnPropertyDescriptor;
var re = Object.getOwnPropertyNames;
var ae = Object.getPrototypeOf, te = Object.prototype.hasOwnProperty;
var ie = (l)=>b(l, "__esModule", {
        value: !0
    })
;
var z = ((l)=>typeof require != "undefined" ? require : typeof Proxy != "undefined" ? new Proxy(l, {
        get: (h, C)=>(typeof require != "undefined" ? require : h)[C]
    }) : l
)(function(l) {
    if (typeof require != "undefined") return require.apply(this, arguments);
    throw new Error('Dynamic require of "' + l + '" is not supported');
});
var W = (l, h)=>()=>(h || l((h = {
            exports: {
            }
        }).exports, h), h.exports)
;
var le = (l, h, C, O)=>{
    if (h && typeof h == "object" || typeof h == "function") for (let R of re(h))!te.call(l, R) && (C || R !== "default") && b(l, R, {
        get: ()=>h[R]
        ,
        enumerable: !(O = ne(h, R)) || O.enumerable
    });
    return l;
}, Z = (l, h)=>le(ie(b(l != null ? ee(ae(l)) : {
    }, "default", !h && l && l.__esModule ? {
        get: ()=>l.default
        ,
        enumerable: !0
    } : {
        value: l,
        enumerable: !0
    })), l)
;
var J = W((ce, q)=>{
    var m = q.exports.hljs = new function() {
        function l(n) {
            return n.replace(/&/gm, "&amp;").replace(/</gm, "&lt;");
        }
        function h(n, r, e) {
            return RegExp(r, "m" + (n.case_insensitive ? "i" : "") + (e ? "g" : ""));
        }
        function C(n) {
            for(var r = 0; r < n.childNodes.length; r++){
                var e = n.childNodes[r];
                if (e.nodeName == "CODE") return e;
                if (!(e.nodeType == 3 && e.nodeValue.match(/\s+/))) break;
            }
        }
        function O(n, r) {
            for(var e = "", a = 0; a < n.childNodes.length; a++)if (n.childNodes[a].nodeType == 3) {
                var o = n.childNodes[a].nodeValue;
                r && (o = o.replace(/\n/g, "")), e += o;
            } else n.childNodes[a].nodeName == "BR" ? e += `
` : e += O(n.childNodes[a]);
            return /MSIE [678]/.test(navigator.userAgent) && (e = e.replace(/\r/g, `
`)), e;
        }
        function R(n) {
            var r = n.className.split(/\s+/);
            r = r.concat(n.parentNode.className.split(/\s+/));
            for(var e = 0; e < r.length; e++){
                var a = r[e].replace(/^language-/, "");
                if (w[a] || a == "no-highlight") return a;
            }
        }
        function I(n) {
            var r = [];
            return (function(e, a) {
                for(var o = 0; o < e.childNodes.length; o++)e.childNodes[o].nodeType == 3 ? a += e.childNodes[o].nodeValue.length : e.childNodes[o].nodeName == "BR" ? a += 1 : (r.push({
                    event: "start",
                    offset: a,
                    node: e.childNodes[o]
                }), a = arguments.callee(e.childNodes[o], a), r.push({
                    event: "stop",
                    offset: a,
                    node: e.childNodes[o]
                }));
                return a;
            })(n, 0), r;
        }
        function H(n, r, e) {
            var a = 0, o = "", i = [];
            function c() {
                return n.length && r.length ? n[0].offset != r[0].offset ? n[0].offset < r[0].offset ? n : r : r[0].event == "start" ? n : r : n.length ? n : r;
            }
            function M(N) {
                for(var E = "<" + N.nodeName.toLowerCase(), g = 0; g < N.attributes.length; g++){
                    var L = N.attributes[g];
                    E += " " + L.nodeName.toLowerCase(), L.nodeValue != null && (E += '="' + l(L.nodeValue) + '"');
                }
                return E + ">";
            }
            for(; n.length || r.length;){
                var v = c().splice(0, 1)[0];
                if (o += l(e.substr(a, v.offset - a)), a = v.offset, v.event == "start") o += M(v.node), i.push(v.node);
                else if (v.event == "stop") {
                    var d = i.length;
                    do {
                        d--;
                        var _ = i[d];
                        o += "</" + _.nodeName.toLowerCase() + ">";
                    }while (_ != v.node)
                    for(i.splice(d, 1); d < i.length;)o += M(i[d]), d++;
                }
            }
            return o += e.substr(a), o;
        }
        function A(n, r) {
            function e(t, s) {
                for(var u = 0; u < s.contains.length; u++)if (s.contains[u].beginRe.test(t)) return s.contains[u];
            }
            function a(t, s) {
                if (g[t].end && g[t].endRe.test(s)) return 1;
                if (g[t].endsWithParent) {
                    var u = a(t - 1, s);
                    return u ? u + 1 : 0;
                }
                return 0;
            }
            function o(t, s) {
                return s.illegalRe && s.illegalRe.test(t);
            }
            function i(t, s) {
                for(var u = [], f = 0; f < t.contains.length; f++)u.push(t.contains[f].begin);
                var p = g.length - 1;
                do g[p].end && u.push(g[p].end), p--;
                while (g[p + 1].endsWithParent)
                return t.illegal && u.push(t.illegal), h(s, "(" + u.join("|") + ")", !0);
            }
            function c(t, s) {
                var u = g[g.length - 1];
                u.terminators || (u.terminators = i(u, E)), u.terminators.lastIndex = s;
                var f = u.terminators.exec(t);
                return f ? [
                    t.substr(s, f.index - s),
                    f[0],
                    !1
                ] : [
                    t.substr(s),
                    "",
                    !0
                ];
            }
            function M(t, s) {
                var u = E.case_insensitive ? s[0].toLowerCase() : s[0];
                for(var f in t.keywordGroups)if (!!t.keywordGroups.hasOwnProperty(f)) {
                    var p = t.keywordGroups[f].hasOwnProperty(u);
                    if (p) return [
                        f,
                        p
                    ];
                }
                return !1;
            }
            function v(t, s) {
                if (!s.keywords) return l(t);
                var u = "", f = 0;
                s.lexemsRe.lastIndex = 0;
                for(var p = s.lexemsRe.exec(t); p;){
                    u += l(t.substr(f, p.index - f));
                    var S = M(s, p);
                    S ? (x += S[1], u += '<span class="' + S[0] + '">' + l(p[0]) + "</span>") : u += l(p[0]), f = s.lexemsRe.lastIndex, p = s.lexemsRe.exec(t);
                }
                return u += l(t.substr(f, t.length - f)), u;
            }
            function d(t, s) {
                if (s.subLanguage && w[s.subLanguage]) {
                    var u = A(s.subLanguage, t);
                    return x += u.keyword_count, u.value;
                } else return v(t, s);
            }
            function _(t, s) {
                var u = t.className ? '<span class="' + t.className + '">' : "";
                t.returnBegin ? (y += u, t.buffer = "") : t.excludeBegin ? (y += l(s) + u, t.buffer = "") : (y += u, t.buffer = s), g.push(t), L += t.relevance;
            }
            function N(t, s, u) {
                var f = g[g.length - 1];
                if (u) return y += d(f.buffer + t, f), !1;
                var p = e(s, f);
                if (p) return y += d(f.buffer + t, f), _(p, s), p.returnBegin;
                var S = a(g.length - 1, s);
                if (S) {
                    var P = f.className ? "</span>" : "";
                    for(f.returnEnd ? y += d(f.buffer + t, f) + P : f.excludeEnd ? y += d(f.buffer + t, f) + P + l(s) : y += d(f.buffer + t + s, f) + P; S > 1;)P = g[g.length - 2].className ? "</span>" : "", y += P, S--, g.length--;
                    var V = g[g.length - 1];
                    return g.length--, g[g.length - 1].buffer = "", V.starts && _(V.starts, ""), f.returnEnd;
                }
                if (o(s, f)) throw "Illegal";
            }
            var E = w[n], g = [
                E.defaultMode
            ], L = 0, x = 0, y = "";
            try {
                var $ = 0;
                E.defaultMode.buffer = "";
                do {
                    var k = c(r, $), Y = N(k[0], k[1], k[2]);
                    $ += k[0].length, Y || ($ += k[1].length);
                }while (!k[2])
                if (g.length > 1) throw "Illegal";
                return {
                    language: n,
                    relevance: L,
                    keyword_count: x,
                    value: y
                };
            } catch (t) {
                if (t == "Illegal") return {
                    language: null,
                    relevance: 0,
                    keyword_count: 0,
                    value: l(r)
                };
                throw t;
            }
        }
        function G() {
            function n(e, a, o) {
                if (!e.compiled) {
                    o || (e.beginRe = h(a, e.begin ? e.begin : "\\B|\\b"), !e.end && !e.endsWithParent && (e.end = "\\B|\\b"), e.end && (e.endRe = h(a, e.end))), e.illegal && (e.illegalRe = h(a, e.illegal)), e.relevance == null && (e.relevance = 1), e.keywords && (e.lexemsRe = h(a, e.lexems || m.IDENT_RE, !0));
                    for(var i in e.keywords)if (!!e.keywords.hasOwnProperty(i)) {
                        e.keywords[i] instanceof Object ? e.keywordGroups = e.keywords : e.keywordGroups = {
                            keyword: e.keywords
                        };
                        break;
                    }
                    e.contains || (e.contains = []), e.compiled = !0;
                    for(var c = 0; c < e.contains.length; c++)n(e.contains[c], a, !1);
                    e.starts && n(e.starts, a, !1);
                }
            }
            for(var r in w)!w.hasOwnProperty(r) || n(w[r].defaultMode, w[r], !0);
        }
        function T() {
            T.called || (T.called = !0, G());
        }
        function D(n, r, e) {
            T();
            var a = O(n, e), o = R(n);
            if (o != "no-highlight") {
                if (o) var i = A(o, a);
                else {
                    var i = {
                        language: "",
                        keyword_count: 0,
                        relevance: 0,
                        value: l(a)
                    }, c = i;
                    for(var M in w)if (!!w.hasOwnProperty(M)) {
                        var v = A(M, a);
                        v.keyword_count + v.relevance > c.keyword_count + c.relevance && (c = v), v.keyword_count + v.relevance > i.keyword_count + i.relevance && (c = i, i = v);
                    }
                }
                var d = n.className;
                d.match(i.language) || (d = d ? d + " " + i.language : i.language);
                var _ = I(n);
                if (_.length) {
                    var N = document.createElement("pre");
                    N.innerHTML = i.value, i.value = H(_, I(N), a);
                }
                if (r && (i.value = i.value.replace(/^((<[^>]+>|\t)+)/gm, function(g, L, x, y) {
                    return L.replace(/\t/g, r);
                })), e && (i.value = i.value.replace(/\n/g, "<br>")), /MSIE [678]/.test(navigator.userAgent) && n.tagName == "CODE" && n.parentNode.tagName == "PRE") {
                    var N = n.parentNode, E = document.createElement("div");
                    E.innerHTML = "<pre><code>" + i.value + "</code></pre>", n = E.firstChild.firstChild, E.firstChild.className = N.className, N.parentNode.replaceChild(E.firstChild, N);
                } else n.innerHTML = i.value;
                n.className = d, n.dataset = {
                }, n.dataset.result = {
                    language: i.language,
                    kw: i.keyword_count,
                    re: i.relevance
                }, c && c.language && (n.dataset.second_best = {
                    language: c.language,
                    kw: c.keyword_count,
                    re: c.relevance
                });
            }
        }
        function U(n, r, e) {
            T();
            var a = n, i = {
                language: "",
                keyword_count: 0,
                relevance: 0,
                value: l(a)
            }, c = i;
            for(var M in w)if (!!w.hasOwnProperty(M)) {
                var v = A(M, a);
                v.keyword_count + v.relevance > c.keyword_count + c.relevance && (c = v), v.keyword_count + v.relevance > i.keyword_count + i.relevance && (c = i, i = v);
            }
            return r && (i.value = i.value.replace(/^((<[^>]+>|\t)+)/gm, function(d, _, N, E) {
                return _.replace(/\t/g, r);
            })), e && (i.value = i.value.replace(/\n/g, "<br>")), i.value;
        }
        function B() {
            if (!B.called) {
                B.called = !0, T();
                for(var n = document.getElementsByTagName("pre"), r = 0; r < n.length; r++){
                    var e = C(n[r]);
                    e && D(e, m.tabReplace);
                }
            }
        }
        function j() {
            var n = arguments, r = function() {
                B.apply(null, n);
            };
            window.addEventListener ? (window.addEventListener("DOMContentLoaded", r, !1), window.addEventListener("load", r, !1)) : window.attachEvent ? window.attachEvent("onload", r) : window.onload = r;
        }
        var w = {
        };
        this.LANGUAGES = w, this.initHighlightingOnLoad = j, this.highlightBlock = D, this.initHighlighting = B, this.highlightText = U, this.IDENT_RE = "[a-zA-Z][a-zA-Z0-9_]*", this.UNDERSCORE_IDENT_RE = "[a-zA-Z_][a-zA-Z0-9_]*", this.NUMBER_RE = "\\b\\d+(\\.\\d+)?", this.C_NUMBER_RE = "\\b(0x[A-Za-z0-9]+|\\d+(\\.\\d+)?)", this.RE_STARTERS_RE = "!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|\\.|-|-=|/|/=|:|;|<|<<|<<=|<=|=|==|===|>|>=|>>|>>=|>>>|>>>=|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~", this.BACKSLASH_ESCAPE = {
            begin: "\\\\.",
            relevance: 0
        }, this.APOS_STRING_MODE = {
            className: "string",
            begin: "'",
            end: "'",
            illegal: "\\n",
            contains: [
                this.BACKSLASH_ESCAPE
            ],
            relevance: 0
        }, this.QUOTE_STRING_MODE = {
            className: "string",
            begin: '"',
            end: '"',
            illegal: "\\n",
            contains: [
                this.BACKSLASH_ESCAPE
            ],
            relevance: 0
        }, this.C_LINE_COMMENT_MODE = {
            className: "comment",
            begin: "//",
            end: "$"
        }, this.C_BLOCK_COMMENT_MODE = {
            className: "comment",
            begin: "/\\*",
            end: "\\*/"
        }, this.HASH_COMMENT_MODE = {
            className: "comment",
            begin: "#",
            end: "$"
        }, this.NUMBER_MODE = {
            className: "number",
            begin: this.NUMBER_RE,
            relevance: 0
        }, this.C_NUMBER_MODE = {
            className: "number",
            begin: this.C_NUMBER_RE,
            relevance: 0
        }, this.inherit = function(n, r) {
            var e = {
            };
            for(var a in n)e[a] = n[a];
            if (r) for(var a in r)e[a] = r[a];
            return e;
        };
    };
});
var K = W((F, Q)=>{
    var se = F;
    (function() {
        "use strict";
        var l = Q.exports, h = __default, C = J().hljs, O = "vendor/highlight.js/languages/", R = "https://cdn.esm.sh/v65/highlight@0.2.4/es2021/" + O, I = /\.js$/i, H = {
        }, A = {
        };
        l.loadedLanguages = [];
        function G(n) {
            if (n.match(I)) return !0;
        }
        function T(n, r, e) {
            e[r] = n = n.replace(I, "");
            try {
                A[n] = z("./" + O + n);
            } catch (a) {
                console.error("[ERROR] could not preload language pack for '" + n + "'"), console.error(a.message), console.error(a.stack);
                return;
            }
        }
        function D(n, r) {
            if (n) {
                console.error("[ERROR] langPath '" + R + "'"), console.error(n.message), console.error(n.stack);
                return;
            }
            l.languages = r.filter(G).sort(function(e, a) {
                return e === "xml" ? -100000000 : e === "django.js" ? 1000000000 : e === a ? 0 : e < a ? -1 : e > a ? 1 : 0;
            }), l.languages.forEach(T);
        }
        function U(n, r) {
            var e;
            if (typeof r == "string" && (r = [
                r
            ]), !Array.isArray(r)) {
                n(new Error("no array of languages given"));
                return;
            }
            r.some(function(a) {
                var o;
                if (!H[a]) {
                    if (o = A[a], !o) return e = new Error("No language pack available for '" + a + "'"), !0;
                    try {
                        o(C);
                    } catch (i) {
                        console.warn("[WARN] failed to load", a), console.warn(i.message), console.warn(i.stack), l.languages = l.languages.filter(function(c) {
                            return c !== a;
                        });
                        return;
                    }
                    H[a] = !0, l.loadedLanguages.push(a);
                }
            }), n(e);
        }
        function B(n, r, e) {
            Array.isArray(r) || (r = l.languages.slice()), U(n, r);
        }
        function j(n, r, e) {
            return r = r || "    ", n = n.replace(/\r\n|\r|\n/g, `
`), e ? n.replace(/\n/g, "\uFFFF").replace(/<code([^>]*)>(.*?)<\/code>/gm, function(a, o, i) {
                return "<code" + o + ">" + C.highlightText(i.replace(/\uffff/g, `
`), r) + "</code>";
            }).replace(/&amp;(\w+;)/g, "&$1").replace(/\uffff/g, `
`) : C.highlightText(n, r);
        }
        D(null, h.readdirSync(R)), l.init = B, l.highlight = j;
        function w() {
            return l.init(function() {
            }, [
                "php"
            ]), l.highlight.apply(null, arguments);
        }
        l.Highlight = se.Highlight = w;
    })();
});
var X = Z(K()), ue = Z(K()), { default: oe , ...fe } = ue, he = (X.default ?? oe) ?? fe;
console.log("Hiiii from Blog.js");
highlightAll();

