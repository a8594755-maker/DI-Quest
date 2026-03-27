function Ik(e,t){for(var n=0;n<t.length;n++){const r=t[n];if(typeof r!="string"&&!Array.isArray(r)){for(const i in r)if(i!=="default"&&!(i in e)){const s=Object.getOwnPropertyDescriptor(r,i);s&&Object.defineProperty(e,i,s.get?s:{enumerable:!0,get:()=>r[i]})}}}return Object.freeze(Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}))}(function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const i of document.querySelectorAll('link[rel="modulepreload"]'))r(i);new MutationObserver(i=>{for(const s of i)if(s.type==="childList")for(const o of s.addedNodes)o.tagName==="LINK"&&o.rel==="modulepreload"&&r(o)}).observe(document,{childList:!0,subtree:!0});function n(i){const s={};return i.integrity&&(s.integrity=i.integrity),i.referrerPolicy&&(s.referrerPolicy=i.referrerPolicy),i.crossOrigin==="use-credentials"?s.credentials="include":i.crossOrigin==="anonymous"?s.credentials="omit":s.credentials="same-origin",s}function r(i){if(i.ep)return;i.ep=!0;const s=n(i);fetch(i.href,s)}})();var Ia=typeof globalThis<"u"?globalThis:typeof window<"u"?window:typeof global<"u"?global:typeof self<"u"?self:{};function th(e){return e&&e.__esModule&&Object.prototype.hasOwnProperty.call(e,"default")?e.default:e}var Yy={exports:{}},Cl={},Zy={exports:{}},ne={};/**
 * @license React
 * react.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var bo=Symbol.for("react.element"),Dk=Symbol.for("react.portal"),Lk=Symbol.for("react.fragment"),Mk=Symbol.for("react.strict_mode"),Bk=Symbol.for("react.profiler"),Fk=Symbol.for("react.provider"),$k=Symbol.for("react.context"),Uk=Symbol.for("react.forward_ref"),Vk=Symbol.for("react.suspense"),zk=Symbol.for("react.memo"),qk=Symbol.for("react.lazy"),Zf=Symbol.iterator;function Hk(e){return e===null||typeof e!="object"?null:(e=Zf&&e[Zf]||e["@@iterator"],typeof e=="function"?e:null)}var e0={isMounted:function(){return!1},enqueueForceUpdate:function(){},enqueueReplaceState:function(){},enqueueSetState:function(){}},t0=Object.assign,n0={};function zi(e,t,n){this.props=e,this.context=t,this.refs=n0,this.updater=n||e0}zi.prototype.isReactComponent={};zi.prototype.setState=function(e,t){if(typeof e!="object"&&typeof e!="function"&&e!=null)throw Error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");this.updater.enqueueSetState(this,e,t,"setState")};zi.prototype.forceUpdate=function(e){this.updater.enqueueForceUpdate(this,e,"forceUpdate")};function r0(){}r0.prototype=zi.prototype;function nh(e,t,n){this.props=e,this.context=t,this.refs=n0,this.updater=n||e0}var rh=nh.prototype=new r0;rh.constructor=nh;t0(rh,zi.prototype);rh.isPureReactComponent=!0;var ep=Array.isArray,i0=Object.prototype.hasOwnProperty,ih={current:null},s0={key:!0,ref:!0,__self:!0,__source:!0};function o0(e,t,n){var r,i={},s=null,o=null;if(t!=null)for(r in t.ref!==void 0&&(o=t.ref),t.key!==void 0&&(s=""+t.key),t)i0.call(t,r)&&!s0.hasOwnProperty(r)&&(i[r]=t[r]);var a=arguments.length-2;if(a===1)i.children=n;else if(1<a){for(var l=Array(a),u=0;u<a;u++)l[u]=arguments[u+2];i.children=l}if(e&&e.defaultProps)for(r in a=e.defaultProps,a)i[r]===void 0&&(i[r]=a[r]);return{$$typeof:bo,type:e,key:s,ref:o,props:i,_owner:ih.current}}function Wk(e,t){return{$$typeof:bo,type:e.type,key:t,ref:e.ref,props:e.props,_owner:e._owner}}function sh(e){return typeof e=="object"&&e!==null&&e.$$typeof===bo}function Gk(e){var t={"=":"=0",":":"=2"};return"$"+e.replace(/[=:]/g,function(n){return t[n]})}var tp=/\/+/g;function uu(e,t){return typeof e=="object"&&e!==null&&e.key!=null?Gk(""+e.key):t.toString(36)}function ya(e,t,n,r,i){var s=typeof e;(s==="undefined"||s==="boolean")&&(e=null);var o=!1;if(e===null)o=!0;else switch(s){case"string":case"number":o=!0;break;case"object":switch(e.$$typeof){case bo:case Dk:o=!0}}if(o)return o=e,i=i(o),e=r===""?"."+uu(o,0):r,ep(i)?(n="",e!=null&&(n=e.replace(tp,"$&/")+"/"),ya(i,t,n,"",function(u){return u})):i!=null&&(sh(i)&&(i=Wk(i,n+(!i.key||o&&o.key===i.key?"":(""+i.key).replace(tp,"$&/")+"/")+e)),t.push(i)),1;if(o=0,r=r===""?".":r+":",ep(e))for(var a=0;a<e.length;a++){s=e[a];var l=r+uu(s,a);o+=ya(s,t,n,l,i)}else if(l=Hk(e),typeof l=="function")for(e=l.call(e),a=0;!(s=e.next()).done;)s=s.value,l=r+uu(s,a++),o+=ya(s,t,n,l,i);else if(s==="object")throw t=String(e),Error("Objects are not valid as a React child (found: "+(t==="[object Object]"?"object with keys {"+Object.keys(e).join(", ")+"}":t)+"). If you meant to render a collection of children, use an array instead.");return o}function Lo(e,t,n){if(e==null)return e;var r=[],i=0;return ya(e,r,"","",function(s){return t.call(n,s,i++)}),r}function Kk(e){if(e._status===-1){var t=e._result;t=t(),t.then(function(n){(e._status===0||e._status===-1)&&(e._status=1,e._result=n)},function(n){(e._status===0||e._status===-1)&&(e._status=2,e._result=n)}),e._status===-1&&(e._status=0,e._result=t)}if(e._status===1)return e._result.default;throw e._result}var tt={current:null},va={transition:null},Jk={ReactCurrentDispatcher:tt,ReactCurrentBatchConfig:va,ReactCurrentOwner:ih};function a0(){throw Error("act(...) is not supported in production builds of React.")}ne.Children={map:Lo,forEach:function(e,t,n){Lo(e,function(){t.apply(this,arguments)},n)},count:function(e){var t=0;return Lo(e,function(){t++}),t},toArray:function(e){return Lo(e,function(t){return t})||[]},only:function(e){if(!sh(e))throw Error("React.Children.only expected to receive a single React element child.");return e}};ne.Component=zi;ne.Fragment=Lk;ne.Profiler=Bk;ne.PureComponent=nh;ne.StrictMode=Mk;ne.Suspense=Vk;ne.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED=Jk;ne.act=a0;ne.cloneElement=function(e,t,n){if(e==null)throw Error("React.cloneElement(...): The argument must be a React element, but you passed "+e+".");var r=t0({},e.props),i=e.key,s=e.ref,o=e._owner;if(t!=null){if(t.ref!==void 0&&(s=t.ref,o=ih.current),t.key!==void 0&&(i=""+t.key),e.type&&e.type.defaultProps)var a=e.type.defaultProps;for(l in t)i0.call(t,l)&&!s0.hasOwnProperty(l)&&(r[l]=t[l]===void 0&&a!==void 0?a[l]:t[l])}var l=arguments.length-2;if(l===1)r.children=n;else if(1<l){a=Array(l);for(var u=0;u<l;u++)a[u]=arguments[u+2];r.children=a}return{$$typeof:bo,type:e.type,key:i,ref:s,props:r,_owner:o}};ne.createContext=function(e){return e={$$typeof:$k,_currentValue:e,_currentValue2:e,_threadCount:0,Provider:null,Consumer:null,_defaultValue:null,_globalName:null},e.Provider={$$typeof:Fk,_context:e},e.Consumer=e};ne.createElement=o0;ne.createFactory=function(e){var t=o0.bind(null,e);return t.type=e,t};ne.createRef=function(){return{current:null}};ne.forwardRef=function(e){return{$$typeof:Uk,render:e}};ne.isValidElement=sh;ne.lazy=function(e){return{$$typeof:qk,_payload:{_status:-1,_result:e},_init:Kk}};ne.memo=function(e,t){return{$$typeof:zk,type:e,compare:t===void 0?null:t}};ne.startTransition=function(e){var t=va.transition;va.transition={};try{e()}finally{va.transition=t}};ne.unstable_act=a0;ne.useCallback=function(e,t){return tt.current.useCallback(e,t)};ne.useContext=function(e){return tt.current.useContext(e)};ne.useDebugValue=function(){};ne.useDeferredValue=function(e){return tt.current.useDeferredValue(e)};ne.useEffect=function(e,t){return tt.current.useEffect(e,t)};ne.useId=function(){return tt.current.useId()};ne.useImperativeHandle=function(e,t,n){return tt.current.useImperativeHandle(e,t,n)};ne.useInsertionEffect=function(e,t){return tt.current.useInsertionEffect(e,t)};ne.useLayoutEffect=function(e,t){return tt.current.useLayoutEffect(e,t)};ne.useMemo=function(e,t){return tt.current.useMemo(e,t)};ne.useReducer=function(e,t,n){return tt.current.useReducer(e,t,n)};ne.useRef=function(e){return tt.current.useRef(e)};ne.useState=function(e){return tt.current.useState(e)};ne.useSyncExternalStore=function(e,t,n){return tt.current.useSyncExternalStore(e,t,n)};ne.useTransition=function(){return tt.current.useTransition()};ne.version="18.3.1";Zy.exports=ne;var C=Zy.exports;const rn=th(C),Qk=Ik({__proto__:null,default:rn},[C]);/**
 * @license React
 * react-jsx-runtime.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var Xk=C,Yk=Symbol.for("react.element"),Zk=Symbol.for("react.fragment"),eb=Object.prototype.hasOwnProperty,tb=Xk.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,nb={key:!0,ref:!0,__self:!0,__source:!0};function l0(e,t,n){var r,i={},s=null,o=null;n!==void 0&&(s=""+n),t.key!==void 0&&(s=""+t.key),t.ref!==void 0&&(o=t.ref);for(r in t)eb.call(t,r)&&!nb.hasOwnProperty(r)&&(i[r]=t[r]);if(e&&e.defaultProps)for(r in t=e.defaultProps,t)i[r]===void 0&&(i[r]=t[r]);return{$$typeof:Yk,type:e,key:s,ref:o,props:i,_owner:tb.current}}Cl.Fragment=Zk;Cl.jsx=l0;Cl.jsxs=l0;Yy.exports=Cl;var x=Yy.exports,vc={},u0={exports:{}},St={},c0={exports:{}},d0={};/**
 * @license React
 * scheduler.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */(function(e){function t(I,$){var _=I.length;I.push($);e:for(;0<_;){var N=_-1>>>1,q=I[N];if(0<i(q,$))I[N]=$,I[_]=q,_=N;else break e}}function n(I){return I.length===0?null:I[0]}function r(I){if(I.length===0)return null;var $=I[0],_=I.pop();if(_!==$){I[0]=_;e:for(var N=0,q=I.length,b=q>>>1;N<b;){var ee=2*(N+1)-1,de=I[ee],re=ee+1,Qe=I[re];if(0>i(de,_))re<q&&0>i(Qe,de)?(I[N]=Qe,I[re]=_,N=re):(I[N]=de,I[ee]=_,N=ee);else if(re<q&&0>i(Qe,_))I[N]=Qe,I[re]=_,N=re;else break e}}return $}function i(I,$){var _=I.sortIndex-$.sortIndex;return _!==0?_:I.id-$.id}if(typeof performance=="object"&&typeof performance.now=="function"){var s=performance;e.unstable_now=function(){return s.now()}}else{var o=Date,a=o.now();e.unstable_now=function(){return o.now()-a}}var l=[],u=[],c=1,d=null,h=3,f=!1,p=!1,v=!1,w=typeof setTimeout=="function"?setTimeout:null,m=typeof clearTimeout=="function"?clearTimeout:null,g=typeof setImmediate<"u"?setImmediate:null;typeof navigator<"u"&&navigator.scheduling!==void 0&&navigator.scheduling.isInputPending!==void 0&&navigator.scheduling.isInputPending.bind(navigator.scheduling);function y(I){for(var $=n(u);$!==null;){if($.callback===null)r(u);else if($.startTime<=I)r(u),$.sortIndex=$.expirationTime,t(l,$);else break;$=n(u)}}function k(I){if(v=!1,y(I),!p)if(n(l)!==null)p=!0,U(T);else{var $=n(u);$!==null&&X(k,$.startTime-I)}}function T(I,$){p=!1,v&&(v=!1,m(A),A=-1),f=!0;var _=h;try{for(y($),d=n(l);d!==null&&(!(d.expirationTime>$)||I&&!L());){var N=d.callback;if(typeof N=="function"){d.callback=null,h=d.priorityLevel;var q=N(d.expirationTime<=$);$=e.unstable_now(),typeof q=="function"?d.callback=q:d===n(l)&&r(l),y($)}else r(l);d=n(l)}if(d!==null)var b=!0;else{var ee=n(u);ee!==null&&X(k,ee.startTime-$),b=!1}return b}finally{d=null,h=_,f=!1}}var S=!1,P=null,A=-1,O=5,E=-1;function L(){return!(e.unstable_now()-E<O)}function B(){if(P!==null){var I=e.unstable_now();E=I;var $=!0;try{$=P(!0,I)}finally{$?K():(S=!1,P=null)}}else S=!1}var K;if(typeof g=="function")K=function(){g(B)};else if(typeof MessageChannel<"u"){var J=new MessageChannel,M=J.port2;J.port1.onmessage=B,K=function(){M.postMessage(null)}}else K=function(){w(B,0)};function U(I){P=I,S||(S=!0,K())}function X(I,$){A=w(function(){I(e.unstable_now())},$)}e.unstable_IdlePriority=5,e.unstable_ImmediatePriority=1,e.unstable_LowPriority=4,e.unstable_NormalPriority=3,e.unstable_Profiling=null,e.unstable_UserBlockingPriority=2,e.unstable_cancelCallback=function(I){I.callback=null},e.unstable_continueExecution=function(){p||f||(p=!0,U(T))},e.unstable_forceFrameRate=function(I){0>I||125<I?console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"):O=0<I?Math.floor(1e3/I):5},e.unstable_getCurrentPriorityLevel=function(){return h},e.unstable_getFirstCallbackNode=function(){return n(l)},e.unstable_next=function(I){switch(h){case 1:case 2:case 3:var $=3;break;default:$=h}var _=h;h=$;try{return I()}finally{h=_}},e.unstable_pauseExecution=function(){},e.unstable_requestPaint=function(){},e.unstable_runWithPriority=function(I,$){switch(I){case 1:case 2:case 3:case 4:case 5:break;default:I=3}var _=h;h=I;try{return $()}finally{h=_}},e.unstable_scheduleCallback=function(I,$,_){var N=e.unstable_now();switch(typeof _=="object"&&_!==null?(_=_.delay,_=typeof _=="number"&&0<_?N+_:N):_=N,I){case 1:var q=-1;break;case 2:q=250;break;case 5:q=1073741823;break;case 4:q=1e4;break;default:q=5e3}return q=_+q,I={id:c++,callback:$,priorityLevel:I,startTime:_,expirationTime:q,sortIndex:-1},_>N?(I.sortIndex=_,t(u,I),n(l)===null&&I===n(u)&&(v?(m(A),A=-1):v=!0,X(k,_-N))):(I.sortIndex=q,t(l,I),p||f||(p=!0,U(T))),I},e.unstable_shouldYield=L,e.unstable_wrapCallback=function(I){var $=h;return function(){var _=h;h=$;try{return I.apply(this,arguments)}finally{h=_}}}})(d0);c0.exports=d0;var rb=c0.exports;/**
 * @license React
 * react-dom.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var ib=C,kt=rb;function j(e){for(var t="https://reactjs.org/docs/error-decoder.html?invariant="+e,n=1;n<arguments.length;n++)t+="&args[]="+encodeURIComponent(arguments[n]);return"Minified React error #"+e+"; visit "+t+" for the full message or use the non-minified dev environment for full errors and additional helpful warnings."}var h0=new Set,zs={};function Ur(e,t){Ni(e,t),Ni(e+"Capture",t)}function Ni(e,t){for(zs[e]=t,e=0;e<t.length;e++)h0.add(t[e])}var Sn=!(typeof window>"u"||typeof window.document>"u"||typeof window.document.createElement>"u"),xc=Object.prototype.hasOwnProperty,sb=/^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,np={},rp={};function ob(e){return xc.call(rp,e)?!0:xc.call(np,e)?!1:sb.test(e)?rp[e]=!0:(np[e]=!0,!1)}function ab(e,t,n,r){if(n!==null&&n.type===0)return!1;switch(typeof t){case"function":case"symbol":return!0;case"boolean":return r?!1:n!==null?!n.acceptsBooleans:(e=e.toLowerCase().slice(0,5),e!=="data-"&&e!=="aria-");default:return!1}}function lb(e,t,n,r){if(t===null||typeof t>"u"||ab(e,t,n,r))return!0;if(r)return!1;if(n!==null)switch(n.type){case 3:return!t;case 4:return t===!1;case 5:return isNaN(t);case 6:return isNaN(t)||1>t}return!1}function nt(e,t,n,r,i,s,o){this.acceptsBooleans=t===2||t===3||t===4,this.attributeName=r,this.attributeNamespace=i,this.mustUseProperty=n,this.propertyName=e,this.type=t,this.sanitizeURL=s,this.removeEmptyString=o}var Ue={};"children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style".split(" ").forEach(function(e){Ue[e]=new nt(e,0,!1,e,null,!1,!1)});[["acceptCharset","accept-charset"],["className","class"],["htmlFor","for"],["httpEquiv","http-equiv"]].forEach(function(e){var t=e[0];Ue[t]=new nt(t,1,!1,e[1],null,!1,!1)});["contentEditable","draggable","spellCheck","value"].forEach(function(e){Ue[e]=new nt(e,2,!1,e.toLowerCase(),null,!1,!1)});["autoReverse","externalResourcesRequired","focusable","preserveAlpha"].forEach(function(e){Ue[e]=new nt(e,2,!1,e,null,!1,!1)});"allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope".split(" ").forEach(function(e){Ue[e]=new nt(e,3,!1,e.toLowerCase(),null,!1,!1)});["checked","multiple","muted","selected"].forEach(function(e){Ue[e]=new nt(e,3,!0,e,null,!1,!1)});["capture","download"].forEach(function(e){Ue[e]=new nt(e,4,!1,e,null,!1,!1)});["cols","rows","size","span"].forEach(function(e){Ue[e]=new nt(e,6,!1,e,null,!1,!1)});["rowSpan","start"].forEach(function(e){Ue[e]=new nt(e,5,!1,e.toLowerCase(),null,!1,!1)});var oh=/[\-:]([a-z])/g;function ah(e){return e[1].toUpperCase()}"accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height".split(" ").forEach(function(e){var t=e.replace(oh,ah);Ue[t]=new nt(t,1,!1,e,null,!1,!1)});"xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type".split(" ").forEach(function(e){var t=e.replace(oh,ah);Ue[t]=new nt(t,1,!1,e,"http://www.w3.org/1999/xlink",!1,!1)});["xml:base","xml:lang","xml:space"].forEach(function(e){var t=e.replace(oh,ah);Ue[t]=new nt(t,1,!1,e,"http://www.w3.org/XML/1998/namespace",!1,!1)});["tabIndex","crossOrigin"].forEach(function(e){Ue[e]=new nt(e,1,!1,e.toLowerCase(),null,!1,!1)});Ue.xlinkHref=new nt("xlinkHref",1,!1,"xlink:href","http://www.w3.org/1999/xlink",!0,!1);["src","href","action","formAction"].forEach(function(e){Ue[e]=new nt(e,1,!1,e.toLowerCase(),null,!0,!0)});function lh(e,t,n,r){var i=Ue.hasOwnProperty(t)?Ue[t]:null;(i!==null?i.type!==0:r||!(2<t.length)||t[0]!=="o"&&t[0]!=="O"||t[1]!=="n"&&t[1]!=="N")&&(lb(t,n,i,r)&&(n=null),r||i===null?ob(t)&&(n===null?e.removeAttribute(t):e.setAttribute(t,""+n)):i.mustUseProperty?e[i.propertyName]=n===null?i.type===3?!1:"":n:(t=i.attributeName,r=i.attributeNamespace,n===null?e.removeAttribute(t):(i=i.type,n=i===3||i===4&&n===!0?"":""+n,r?e.setAttributeNS(r,t,n):e.setAttribute(t,n))))}var Pn=ib.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,Mo=Symbol.for("react.element"),ai=Symbol.for("react.portal"),li=Symbol.for("react.fragment"),uh=Symbol.for("react.strict_mode"),wc=Symbol.for("react.profiler"),f0=Symbol.for("react.provider"),p0=Symbol.for("react.context"),ch=Symbol.for("react.forward_ref"),kc=Symbol.for("react.suspense"),bc=Symbol.for("react.suspense_list"),dh=Symbol.for("react.memo"),Dn=Symbol.for("react.lazy"),m0=Symbol.for("react.offscreen"),ip=Symbol.iterator;function es(e){return e===null||typeof e!="object"?null:(e=ip&&e[ip]||e["@@iterator"],typeof e=="function"?e:null)}var Se=Object.assign,cu;function ps(e){if(cu===void 0)try{throw Error()}catch(n){var t=n.stack.trim().match(/\n( *(at )?)/);cu=t&&t[1]||""}return`
`+cu+e}var du=!1;function hu(e,t){if(!e||du)return"";du=!0;var n=Error.prepareStackTrace;Error.prepareStackTrace=void 0;try{if(t)if(t=function(){throw Error()},Object.defineProperty(t.prototype,"props",{set:function(){throw Error()}}),typeof Reflect=="object"&&Reflect.construct){try{Reflect.construct(t,[])}catch(u){var r=u}Reflect.construct(e,[],t)}else{try{t.call()}catch(u){r=u}e.call(t.prototype)}else{try{throw Error()}catch(u){r=u}e()}}catch(u){if(u&&r&&typeof u.stack=="string"){for(var i=u.stack.split(`
`),s=r.stack.split(`
`),o=i.length-1,a=s.length-1;1<=o&&0<=a&&i[o]!==s[a];)a--;for(;1<=o&&0<=a;o--,a--)if(i[o]!==s[a]){if(o!==1||a!==1)do if(o--,a--,0>a||i[o]!==s[a]){var l=`
`+i[o].replace(" at new "," at ");return e.displayName&&l.includes("<anonymous>")&&(l=l.replace("<anonymous>",e.displayName)),l}while(1<=o&&0<=a);break}}}finally{du=!1,Error.prepareStackTrace=n}return(e=e?e.displayName||e.name:"")?ps(e):""}function ub(e){switch(e.tag){case 5:return ps(e.type);case 16:return ps("Lazy");case 13:return ps("Suspense");case 19:return ps("SuspenseList");case 0:case 2:case 15:return e=hu(e.type,!1),e;case 11:return e=hu(e.type.render,!1),e;case 1:return e=hu(e.type,!0),e;default:return""}}function Sc(e){if(e==null)return null;if(typeof e=="function")return e.displayName||e.name||null;if(typeof e=="string")return e;switch(e){case li:return"Fragment";case ai:return"Portal";case wc:return"Profiler";case uh:return"StrictMode";case kc:return"Suspense";case bc:return"SuspenseList"}if(typeof e=="object")switch(e.$$typeof){case p0:return(e.displayName||"Context")+".Consumer";case f0:return(e._context.displayName||"Context")+".Provider";case ch:var t=e.render;return e=e.displayName,e||(e=t.displayName||t.name||"",e=e!==""?"ForwardRef("+e+")":"ForwardRef"),e;case dh:return t=e.displayName||null,t!==null?t:Sc(e.type)||"Memo";case Dn:t=e._payload,e=e._init;try{return Sc(e(t))}catch{}}return null}function cb(e){var t=e.type;switch(e.tag){case 24:return"Cache";case 9:return(t.displayName||"Context")+".Consumer";case 10:return(t._context.displayName||"Context")+".Provider";case 18:return"DehydratedFragment";case 11:return e=t.render,e=e.displayName||e.name||"",t.displayName||(e!==""?"ForwardRef("+e+")":"ForwardRef");case 7:return"Fragment";case 5:return t;case 4:return"Portal";case 3:return"Root";case 6:return"Text";case 16:return Sc(t);case 8:return t===uh?"StrictMode":"Mode";case 22:return"Offscreen";case 12:return"Profiler";case 21:return"Scope";case 13:return"Suspense";case 19:return"SuspenseList";case 25:return"TracingMarker";case 1:case 0:case 17:case 2:case 14:case 15:if(typeof t=="function")return t.displayName||t.name||null;if(typeof t=="string")return t}return null}function nr(e){switch(typeof e){case"boolean":case"number":case"string":case"undefined":return e;case"object":return e;default:return""}}function g0(e){var t=e.type;return(e=e.nodeName)&&e.toLowerCase()==="input"&&(t==="checkbox"||t==="radio")}function db(e){var t=g0(e)?"checked":"value",n=Object.getOwnPropertyDescriptor(e.constructor.prototype,t),r=""+e[t];if(!e.hasOwnProperty(t)&&typeof n<"u"&&typeof n.get=="function"&&typeof n.set=="function"){var i=n.get,s=n.set;return Object.defineProperty(e,t,{configurable:!0,get:function(){return i.call(this)},set:function(o){r=""+o,s.call(this,o)}}),Object.defineProperty(e,t,{enumerable:n.enumerable}),{getValue:function(){return r},setValue:function(o){r=""+o},stopTracking:function(){e._valueTracker=null,delete e[t]}}}}function Bo(e){e._valueTracker||(e._valueTracker=db(e))}function y0(e){if(!e)return!1;var t=e._valueTracker;if(!t)return!0;var n=t.getValue(),r="";return e&&(r=g0(e)?e.checked?"true":"false":e.value),e=r,e!==n?(t.setValue(e),!0):!1}function Da(e){if(e=e||(typeof document<"u"?document:void 0),typeof e>"u")return null;try{return e.activeElement||e.body}catch{return e.body}}function _c(e,t){var n=t.checked;return Se({},t,{defaultChecked:void 0,defaultValue:void 0,value:void 0,checked:n??e._wrapperState.initialChecked})}function sp(e,t){var n=t.defaultValue==null?"":t.defaultValue,r=t.checked!=null?t.checked:t.defaultChecked;n=nr(t.value!=null?t.value:n),e._wrapperState={initialChecked:r,initialValue:n,controlled:t.type==="checkbox"||t.type==="radio"?t.checked!=null:t.value!=null}}function v0(e,t){t=t.checked,t!=null&&lh(e,"checked",t,!1)}function Cc(e,t){v0(e,t);var n=nr(t.value),r=t.type;if(n!=null)r==="number"?(n===0&&e.value===""||e.value!=n)&&(e.value=""+n):e.value!==""+n&&(e.value=""+n);else if(r==="submit"||r==="reset"){e.removeAttribute("value");return}t.hasOwnProperty("value")?Ec(e,t.type,n):t.hasOwnProperty("defaultValue")&&Ec(e,t.type,nr(t.defaultValue)),t.checked==null&&t.defaultChecked!=null&&(e.defaultChecked=!!t.defaultChecked)}function op(e,t,n){if(t.hasOwnProperty("value")||t.hasOwnProperty("defaultValue")){var r=t.type;if(!(r!=="submit"&&r!=="reset"||t.value!==void 0&&t.value!==null))return;t=""+e._wrapperState.initialValue,n||t===e.value||(e.value=t),e.defaultValue=t}n=e.name,n!==""&&(e.name=""),e.defaultChecked=!!e._wrapperState.initialChecked,n!==""&&(e.name=n)}function Ec(e,t,n){(t!=="number"||Da(e.ownerDocument)!==e)&&(n==null?e.defaultValue=""+e._wrapperState.initialValue:e.defaultValue!==""+n&&(e.defaultValue=""+n))}var ms=Array.isArray;function _i(e,t,n,r){if(e=e.options,t){t={};for(var i=0;i<n.length;i++)t["$"+n[i]]=!0;for(n=0;n<e.length;n++)i=t.hasOwnProperty("$"+e[n].value),e[n].selected!==i&&(e[n].selected=i),i&&r&&(e[n].defaultSelected=!0)}else{for(n=""+nr(n),t=null,i=0;i<e.length;i++){if(e[i].value===n){e[i].selected=!0,r&&(e[i].defaultSelected=!0);return}t!==null||e[i].disabled||(t=e[i])}t!==null&&(t.selected=!0)}}function Tc(e,t){if(t.dangerouslySetInnerHTML!=null)throw Error(j(91));return Se({},t,{value:void 0,defaultValue:void 0,children:""+e._wrapperState.initialValue})}function ap(e,t){var n=t.value;if(n==null){if(n=t.children,t=t.defaultValue,n!=null){if(t!=null)throw Error(j(92));if(ms(n)){if(1<n.length)throw Error(j(93));n=n[0]}t=n}t==null&&(t=""),n=t}e._wrapperState={initialValue:nr(n)}}function x0(e,t){var n=nr(t.value),r=nr(t.defaultValue);n!=null&&(n=""+n,n!==e.value&&(e.value=n),t.defaultValue==null&&e.defaultValue!==n&&(e.defaultValue=n)),r!=null&&(e.defaultValue=""+r)}function lp(e){var t=e.textContent;t===e._wrapperState.initialValue&&t!==""&&t!==null&&(e.value=t)}function w0(e){switch(e){case"svg":return"http://www.w3.org/2000/svg";case"math":return"http://www.w3.org/1998/Math/MathML";default:return"http://www.w3.org/1999/xhtml"}}function Pc(e,t){return e==null||e==="http://www.w3.org/1999/xhtml"?w0(t):e==="http://www.w3.org/2000/svg"&&t==="foreignObject"?"http://www.w3.org/1999/xhtml":e}var Fo,k0=function(e){return typeof MSApp<"u"&&MSApp.execUnsafeLocalFunction?function(t,n,r,i){MSApp.execUnsafeLocalFunction(function(){return e(t,n,r,i)})}:e}(function(e,t){if(e.namespaceURI!=="http://www.w3.org/2000/svg"||"innerHTML"in e)e.innerHTML=t;else{for(Fo=Fo||document.createElement("div"),Fo.innerHTML="<svg>"+t.valueOf().toString()+"</svg>",t=Fo.firstChild;e.firstChild;)e.removeChild(e.firstChild);for(;t.firstChild;)e.appendChild(t.firstChild)}});function qs(e,t){if(t){var n=e.firstChild;if(n&&n===e.lastChild&&n.nodeType===3){n.nodeValue=t;return}}e.textContent=t}var bs={animationIterationCount:!0,aspectRatio:!0,borderImageOutset:!0,borderImageSlice:!0,borderImageWidth:!0,boxFlex:!0,boxFlexGroup:!0,boxOrdinalGroup:!0,columnCount:!0,columns:!0,flex:!0,flexGrow:!0,flexPositive:!0,flexShrink:!0,flexNegative:!0,flexOrder:!0,gridArea:!0,gridRow:!0,gridRowEnd:!0,gridRowSpan:!0,gridRowStart:!0,gridColumn:!0,gridColumnEnd:!0,gridColumnSpan:!0,gridColumnStart:!0,fontWeight:!0,lineClamp:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,tabSize:!0,widows:!0,zIndex:!0,zoom:!0,fillOpacity:!0,floodOpacity:!0,stopOpacity:!0,strokeDasharray:!0,strokeDashoffset:!0,strokeMiterlimit:!0,strokeOpacity:!0,strokeWidth:!0},hb=["Webkit","ms","Moz","O"];Object.keys(bs).forEach(function(e){hb.forEach(function(t){t=t+e.charAt(0).toUpperCase()+e.substring(1),bs[t]=bs[e]})});function b0(e,t,n){return t==null||typeof t=="boolean"||t===""?"":n||typeof t!="number"||t===0||bs.hasOwnProperty(e)&&bs[e]?(""+t).trim():t+"px"}function S0(e,t){e=e.style;for(var n in t)if(t.hasOwnProperty(n)){var r=n.indexOf("--")===0,i=b0(n,t[n],r);n==="float"&&(n="cssFloat"),r?e.setProperty(n,i):e[n]=i}}var fb=Se({menuitem:!0},{area:!0,base:!0,br:!0,col:!0,embed:!0,hr:!0,img:!0,input:!0,keygen:!0,link:!0,meta:!0,param:!0,source:!0,track:!0,wbr:!0});function Ac(e,t){if(t){if(fb[e]&&(t.children!=null||t.dangerouslySetInnerHTML!=null))throw Error(j(137,e));if(t.dangerouslySetInnerHTML!=null){if(t.children!=null)throw Error(j(60));if(typeof t.dangerouslySetInnerHTML!="object"||!("__html"in t.dangerouslySetInnerHTML))throw Error(j(61))}if(t.style!=null&&typeof t.style!="object")throw Error(j(62))}}function Rc(e,t){if(e.indexOf("-")===-1)return typeof t.is=="string";switch(e){case"annotation-xml":case"color-profile":case"font-face":case"font-face-src":case"font-face-uri":case"font-face-format":case"font-face-name":case"missing-glyph":return!1;default:return!0}}var Oc=null;function hh(e){return e=e.target||e.srcElement||window,e.correspondingUseElement&&(e=e.correspondingUseElement),e.nodeType===3?e.parentNode:e}var Nc=null,Ci=null,Ei=null;function up(e){if(e=Co(e)){if(typeof Nc!="function")throw Error(j(280));var t=e.stateNode;t&&(t=Rl(t),Nc(e.stateNode,e.type,t))}}function _0(e){Ci?Ei?Ei.push(e):Ei=[e]:Ci=e}function C0(){if(Ci){var e=Ci,t=Ei;if(Ei=Ci=null,up(e),t)for(e=0;e<t.length;e++)up(t[e])}}function E0(e,t){return e(t)}function T0(){}var fu=!1;function P0(e,t,n){if(fu)return e(t,n);fu=!0;try{return E0(e,t,n)}finally{fu=!1,(Ci!==null||Ei!==null)&&(T0(),C0())}}function Hs(e,t){var n=e.stateNode;if(n===null)return null;var r=Rl(n);if(r===null)return null;n=r[t];e:switch(t){case"onClick":case"onClickCapture":case"onDoubleClick":case"onDoubleClickCapture":case"onMouseDown":case"onMouseDownCapture":case"onMouseMove":case"onMouseMoveCapture":case"onMouseUp":case"onMouseUpCapture":case"onMouseEnter":(r=!r.disabled)||(e=e.type,r=!(e==="button"||e==="input"||e==="select"||e==="textarea")),e=!r;break e;default:e=!1}if(e)return null;if(n&&typeof n!="function")throw Error(j(231,t,typeof n));return n}var jc=!1;if(Sn)try{var ts={};Object.defineProperty(ts,"passive",{get:function(){jc=!0}}),window.addEventListener("test",ts,ts),window.removeEventListener("test",ts,ts)}catch{jc=!1}function pb(e,t,n,r,i,s,o,a,l){var u=Array.prototype.slice.call(arguments,3);try{t.apply(n,u)}catch(c){this.onError(c)}}var Ss=!1,La=null,Ma=!1,Ic=null,mb={onError:function(e){Ss=!0,La=e}};function gb(e,t,n,r,i,s,o,a,l){Ss=!1,La=null,pb.apply(mb,arguments)}function yb(e,t,n,r,i,s,o,a,l){if(gb.apply(this,arguments),Ss){if(Ss){var u=La;Ss=!1,La=null}else throw Error(j(198));Ma||(Ma=!0,Ic=u)}}function Vr(e){var t=e,n=e;if(e.alternate)for(;t.return;)t=t.return;else{e=t;do t=e,t.flags&4098&&(n=t.return),e=t.return;while(e)}return t.tag===3?n:null}function A0(e){if(e.tag===13){var t=e.memoizedState;if(t===null&&(e=e.alternate,e!==null&&(t=e.memoizedState)),t!==null)return t.dehydrated}return null}function cp(e){if(Vr(e)!==e)throw Error(j(188))}function vb(e){var t=e.alternate;if(!t){if(t=Vr(e),t===null)throw Error(j(188));return t!==e?null:e}for(var n=e,r=t;;){var i=n.return;if(i===null)break;var s=i.alternate;if(s===null){if(r=i.return,r!==null){n=r;continue}break}if(i.child===s.child){for(s=i.child;s;){if(s===n)return cp(i),e;if(s===r)return cp(i),t;s=s.sibling}throw Error(j(188))}if(n.return!==r.return)n=i,r=s;else{for(var o=!1,a=i.child;a;){if(a===n){o=!0,n=i,r=s;break}if(a===r){o=!0,r=i,n=s;break}a=a.sibling}if(!o){for(a=s.child;a;){if(a===n){o=!0,n=s,r=i;break}if(a===r){o=!0,r=s,n=i;break}a=a.sibling}if(!o)throw Error(j(189))}}if(n.alternate!==r)throw Error(j(190))}if(n.tag!==3)throw Error(j(188));return n.stateNode.current===n?e:t}function R0(e){return e=vb(e),e!==null?O0(e):null}function O0(e){if(e.tag===5||e.tag===6)return e;for(e=e.child;e!==null;){var t=O0(e);if(t!==null)return t;e=e.sibling}return null}var N0=kt.unstable_scheduleCallback,dp=kt.unstable_cancelCallback,xb=kt.unstable_shouldYield,wb=kt.unstable_requestPaint,Ee=kt.unstable_now,kb=kt.unstable_getCurrentPriorityLevel,fh=kt.unstable_ImmediatePriority,j0=kt.unstable_UserBlockingPriority,Ba=kt.unstable_NormalPriority,bb=kt.unstable_LowPriority,I0=kt.unstable_IdlePriority,El=null,sn=null;function Sb(e){if(sn&&typeof sn.onCommitFiberRoot=="function")try{sn.onCommitFiberRoot(El,e,void 0,(e.current.flags&128)===128)}catch{}}var Ht=Math.clz32?Math.clz32:Eb,_b=Math.log,Cb=Math.LN2;function Eb(e){return e>>>=0,e===0?32:31-(_b(e)/Cb|0)|0}var $o=64,Uo=4194304;function gs(e){switch(e&-e){case 1:return 1;case 2:return 2;case 4:return 4;case 8:return 8;case 16:return 16;case 32:return 32;case 64:case 128:case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:return e&4194240;case 4194304:case 8388608:case 16777216:case 33554432:case 67108864:return e&130023424;case 134217728:return 134217728;case 268435456:return 268435456;case 536870912:return 536870912;case 1073741824:return 1073741824;default:return e}}function Fa(e,t){var n=e.pendingLanes;if(n===0)return 0;var r=0,i=e.suspendedLanes,s=e.pingedLanes,o=n&268435455;if(o!==0){var a=o&~i;a!==0?r=gs(a):(s&=o,s!==0&&(r=gs(s)))}else o=n&~i,o!==0?r=gs(o):s!==0&&(r=gs(s));if(r===0)return 0;if(t!==0&&t!==r&&!(t&i)&&(i=r&-r,s=t&-t,i>=s||i===16&&(s&4194240)!==0))return t;if(r&4&&(r|=n&16),t=e.entangledLanes,t!==0)for(e=e.entanglements,t&=r;0<t;)n=31-Ht(t),i=1<<n,r|=e[n],t&=~i;return r}function Tb(e,t){switch(e){case 1:case 2:case 4:return t+250;case 8:case 16:case 32:case 64:case 128:case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:return t+5e3;case 4194304:case 8388608:case 16777216:case 33554432:case 67108864:return-1;case 134217728:case 268435456:case 536870912:case 1073741824:return-1;default:return-1}}function Pb(e,t){for(var n=e.suspendedLanes,r=e.pingedLanes,i=e.expirationTimes,s=e.pendingLanes;0<s;){var o=31-Ht(s),a=1<<o,l=i[o];l===-1?(!(a&n)||a&r)&&(i[o]=Tb(a,t)):l<=t&&(e.expiredLanes|=a),s&=~a}}function Dc(e){return e=e.pendingLanes&-1073741825,e!==0?e:e&1073741824?1073741824:0}function D0(){var e=$o;return $o<<=1,!($o&4194240)&&($o=64),e}function pu(e){for(var t=[],n=0;31>n;n++)t.push(e);return t}function So(e,t,n){e.pendingLanes|=t,t!==536870912&&(e.suspendedLanes=0,e.pingedLanes=0),e=e.eventTimes,t=31-Ht(t),e[t]=n}function Ab(e,t){var n=e.pendingLanes&~t;e.pendingLanes=t,e.suspendedLanes=0,e.pingedLanes=0,e.expiredLanes&=t,e.mutableReadLanes&=t,e.entangledLanes&=t,t=e.entanglements;var r=e.eventTimes;for(e=e.expirationTimes;0<n;){var i=31-Ht(n),s=1<<i;t[i]=0,r[i]=-1,e[i]=-1,n&=~s}}function ph(e,t){var n=e.entangledLanes|=t;for(e=e.entanglements;n;){var r=31-Ht(n),i=1<<r;i&t|e[r]&t&&(e[r]|=t),n&=~i}}var le=0;function L0(e){return e&=-e,1<e?4<e?e&268435455?16:536870912:4:1}var M0,mh,B0,F0,$0,Lc=!1,Vo=[],Hn=null,Wn=null,Gn=null,Ws=new Map,Gs=new Map,Bn=[],Rb="mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(" ");function hp(e,t){switch(e){case"focusin":case"focusout":Hn=null;break;case"dragenter":case"dragleave":Wn=null;break;case"mouseover":case"mouseout":Gn=null;break;case"pointerover":case"pointerout":Ws.delete(t.pointerId);break;case"gotpointercapture":case"lostpointercapture":Gs.delete(t.pointerId)}}function ns(e,t,n,r,i,s){return e===null||e.nativeEvent!==s?(e={blockedOn:t,domEventName:n,eventSystemFlags:r,nativeEvent:s,targetContainers:[i]},t!==null&&(t=Co(t),t!==null&&mh(t)),e):(e.eventSystemFlags|=r,t=e.targetContainers,i!==null&&t.indexOf(i)===-1&&t.push(i),e)}function Ob(e,t,n,r,i){switch(t){case"focusin":return Hn=ns(Hn,e,t,n,r,i),!0;case"dragenter":return Wn=ns(Wn,e,t,n,r,i),!0;case"mouseover":return Gn=ns(Gn,e,t,n,r,i),!0;case"pointerover":var s=i.pointerId;return Ws.set(s,ns(Ws.get(s)||null,e,t,n,r,i)),!0;case"gotpointercapture":return s=i.pointerId,Gs.set(s,ns(Gs.get(s)||null,e,t,n,r,i)),!0}return!1}function U0(e){var t=Er(e.target);if(t!==null){var n=Vr(t);if(n!==null){if(t=n.tag,t===13){if(t=A0(n),t!==null){e.blockedOn=t,$0(e.priority,function(){B0(n)});return}}else if(t===3&&n.stateNode.current.memoizedState.isDehydrated){e.blockedOn=n.tag===3?n.stateNode.containerInfo:null;return}}}e.blockedOn=null}function xa(e){if(e.blockedOn!==null)return!1;for(var t=e.targetContainers;0<t.length;){var n=Mc(e.domEventName,e.eventSystemFlags,t[0],e.nativeEvent);if(n===null){n=e.nativeEvent;var r=new n.constructor(n.type,n);Oc=r,n.target.dispatchEvent(r),Oc=null}else return t=Co(n),t!==null&&mh(t),e.blockedOn=n,!1;t.shift()}return!0}function fp(e,t,n){xa(e)&&n.delete(t)}function Nb(){Lc=!1,Hn!==null&&xa(Hn)&&(Hn=null),Wn!==null&&xa(Wn)&&(Wn=null),Gn!==null&&xa(Gn)&&(Gn=null),Ws.forEach(fp),Gs.forEach(fp)}function rs(e,t){e.blockedOn===t&&(e.blockedOn=null,Lc||(Lc=!0,kt.unstable_scheduleCallback(kt.unstable_NormalPriority,Nb)))}function Ks(e){function t(i){return rs(i,e)}if(0<Vo.length){rs(Vo[0],e);for(var n=1;n<Vo.length;n++){var r=Vo[n];r.blockedOn===e&&(r.blockedOn=null)}}for(Hn!==null&&rs(Hn,e),Wn!==null&&rs(Wn,e),Gn!==null&&rs(Gn,e),Ws.forEach(t),Gs.forEach(t),n=0;n<Bn.length;n++)r=Bn[n],r.blockedOn===e&&(r.blockedOn=null);for(;0<Bn.length&&(n=Bn[0],n.blockedOn===null);)U0(n),n.blockedOn===null&&Bn.shift()}var Ti=Pn.ReactCurrentBatchConfig,$a=!0;function jb(e,t,n,r){var i=le,s=Ti.transition;Ti.transition=null;try{le=1,gh(e,t,n,r)}finally{le=i,Ti.transition=s}}function Ib(e,t,n,r){var i=le,s=Ti.transition;Ti.transition=null;try{le=4,gh(e,t,n,r)}finally{le=i,Ti.transition=s}}function gh(e,t,n,r){if($a){var i=Mc(e,t,n,r);if(i===null)_u(e,t,r,Ua,n),hp(e,r);else if(Ob(i,e,t,n,r))r.stopPropagation();else if(hp(e,r),t&4&&-1<Rb.indexOf(e)){for(;i!==null;){var s=Co(i);if(s!==null&&M0(s),s=Mc(e,t,n,r),s===null&&_u(e,t,r,Ua,n),s===i)break;i=s}i!==null&&r.stopPropagation()}else _u(e,t,r,null,n)}}var Ua=null;function Mc(e,t,n,r){if(Ua=null,e=hh(r),e=Er(e),e!==null)if(t=Vr(e),t===null)e=null;else if(n=t.tag,n===13){if(e=A0(t),e!==null)return e;e=null}else if(n===3){if(t.stateNode.current.memoizedState.isDehydrated)return t.tag===3?t.stateNode.containerInfo:null;e=null}else t!==e&&(e=null);return Ua=e,null}function V0(e){switch(e){case"cancel":case"click":case"close":case"contextmenu":case"copy":case"cut":case"auxclick":case"dblclick":case"dragend":case"dragstart":case"drop":case"focusin":case"focusout":case"input":case"invalid":case"keydown":case"keypress":case"keyup":case"mousedown":case"mouseup":case"paste":case"pause":case"play":case"pointercancel":case"pointerdown":case"pointerup":case"ratechange":case"reset":case"resize":case"seeked":case"submit":case"touchcancel":case"touchend":case"touchstart":case"volumechange":case"change":case"selectionchange":case"textInput":case"compositionstart":case"compositionend":case"compositionupdate":case"beforeblur":case"afterblur":case"beforeinput":case"blur":case"fullscreenchange":case"focus":case"hashchange":case"popstate":case"select":case"selectstart":return 1;case"drag":case"dragenter":case"dragexit":case"dragleave":case"dragover":case"mousemove":case"mouseout":case"mouseover":case"pointermove":case"pointerout":case"pointerover":case"scroll":case"toggle":case"touchmove":case"wheel":case"mouseenter":case"mouseleave":case"pointerenter":case"pointerleave":return 4;case"message":switch(kb()){case fh:return 1;case j0:return 4;case Ba:case bb:return 16;case I0:return 536870912;default:return 16}default:return 16}}var Vn=null,yh=null,wa=null;function z0(){if(wa)return wa;var e,t=yh,n=t.length,r,i="value"in Vn?Vn.value:Vn.textContent,s=i.length;for(e=0;e<n&&t[e]===i[e];e++);var o=n-e;for(r=1;r<=o&&t[n-r]===i[s-r];r++);return wa=i.slice(e,1<r?1-r:void 0)}function ka(e){var t=e.keyCode;return"charCode"in e?(e=e.charCode,e===0&&t===13&&(e=13)):e=t,e===10&&(e=13),32<=e||e===13?e:0}function zo(){return!0}function pp(){return!1}function _t(e){function t(n,r,i,s,o){this._reactName=n,this._targetInst=i,this.type=r,this.nativeEvent=s,this.target=o,this.currentTarget=null;for(var a in e)e.hasOwnProperty(a)&&(n=e[a],this[a]=n?n(s):s[a]);return this.isDefaultPrevented=(s.defaultPrevented!=null?s.defaultPrevented:s.returnValue===!1)?zo:pp,this.isPropagationStopped=pp,this}return Se(t.prototype,{preventDefault:function(){this.defaultPrevented=!0;var n=this.nativeEvent;n&&(n.preventDefault?n.preventDefault():typeof n.returnValue!="unknown"&&(n.returnValue=!1),this.isDefaultPrevented=zo)},stopPropagation:function(){var n=this.nativeEvent;n&&(n.stopPropagation?n.stopPropagation():typeof n.cancelBubble!="unknown"&&(n.cancelBubble=!0),this.isPropagationStopped=zo)},persist:function(){},isPersistent:zo}),t}var qi={eventPhase:0,bubbles:0,cancelable:0,timeStamp:function(e){return e.timeStamp||Date.now()},defaultPrevented:0,isTrusted:0},vh=_t(qi),_o=Se({},qi,{view:0,detail:0}),Db=_t(_o),mu,gu,is,Tl=Se({},_o,{screenX:0,screenY:0,clientX:0,clientY:0,pageX:0,pageY:0,ctrlKey:0,shiftKey:0,altKey:0,metaKey:0,getModifierState:xh,button:0,buttons:0,relatedTarget:function(e){return e.relatedTarget===void 0?e.fromElement===e.srcElement?e.toElement:e.fromElement:e.relatedTarget},movementX:function(e){return"movementX"in e?e.movementX:(e!==is&&(is&&e.type==="mousemove"?(mu=e.screenX-is.screenX,gu=e.screenY-is.screenY):gu=mu=0,is=e),mu)},movementY:function(e){return"movementY"in e?e.movementY:gu}}),mp=_t(Tl),Lb=Se({},Tl,{dataTransfer:0}),Mb=_t(Lb),Bb=Se({},_o,{relatedTarget:0}),yu=_t(Bb),Fb=Se({},qi,{animationName:0,elapsedTime:0,pseudoElement:0}),$b=_t(Fb),Ub=Se({},qi,{clipboardData:function(e){return"clipboardData"in e?e.clipboardData:window.clipboardData}}),Vb=_t(Ub),zb=Se({},qi,{data:0}),gp=_t(zb),qb={Esc:"Escape",Spacebar:" ",Left:"ArrowLeft",Up:"ArrowUp",Right:"ArrowRight",Down:"ArrowDown",Del:"Delete",Win:"OS",Menu:"ContextMenu",Apps:"ContextMenu",Scroll:"ScrollLock",MozPrintableKey:"Unidentified"},Hb={8:"Backspace",9:"Tab",12:"Clear",13:"Enter",16:"Shift",17:"Control",18:"Alt",19:"Pause",20:"CapsLock",27:"Escape",32:" ",33:"PageUp",34:"PageDown",35:"End",36:"Home",37:"ArrowLeft",38:"ArrowUp",39:"ArrowRight",40:"ArrowDown",45:"Insert",46:"Delete",112:"F1",113:"F2",114:"F3",115:"F4",116:"F5",117:"F6",118:"F7",119:"F8",120:"F9",121:"F10",122:"F11",123:"F12",144:"NumLock",145:"ScrollLock",224:"Meta"},Wb={Alt:"altKey",Control:"ctrlKey",Meta:"metaKey",Shift:"shiftKey"};function Gb(e){var t=this.nativeEvent;return t.getModifierState?t.getModifierState(e):(e=Wb[e])?!!t[e]:!1}function xh(){return Gb}var Kb=Se({},_o,{key:function(e){if(e.key){var t=qb[e.key]||e.key;if(t!=="Unidentified")return t}return e.type==="keypress"?(e=ka(e),e===13?"Enter":String.fromCharCode(e)):e.type==="keydown"||e.type==="keyup"?Hb[e.keyCode]||"Unidentified":""},code:0,location:0,ctrlKey:0,shiftKey:0,altKey:0,metaKey:0,repeat:0,locale:0,getModifierState:xh,charCode:function(e){return e.type==="keypress"?ka(e):0},keyCode:function(e){return e.type==="keydown"||e.type==="keyup"?e.keyCode:0},which:function(e){return e.type==="keypress"?ka(e):e.type==="keydown"||e.type==="keyup"?e.keyCode:0}}),Jb=_t(Kb),Qb=Se({},Tl,{pointerId:0,width:0,height:0,pressure:0,tangentialPressure:0,tiltX:0,tiltY:0,twist:0,pointerType:0,isPrimary:0}),yp=_t(Qb),Xb=Se({},_o,{touches:0,targetTouches:0,changedTouches:0,altKey:0,metaKey:0,ctrlKey:0,shiftKey:0,getModifierState:xh}),Yb=_t(Xb),Zb=Se({},qi,{propertyName:0,elapsedTime:0,pseudoElement:0}),eS=_t(Zb),tS=Se({},Tl,{deltaX:function(e){return"deltaX"in e?e.deltaX:"wheelDeltaX"in e?-e.wheelDeltaX:0},deltaY:function(e){return"deltaY"in e?e.deltaY:"wheelDeltaY"in e?-e.wheelDeltaY:"wheelDelta"in e?-e.wheelDelta:0},deltaZ:0,deltaMode:0}),nS=_t(tS),rS=[9,13,27,32],wh=Sn&&"CompositionEvent"in window,_s=null;Sn&&"documentMode"in document&&(_s=document.documentMode);var iS=Sn&&"TextEvent"in window&&!_s,q0=Sn&&(!wh||_s&&8<_s&&11>=_s),vp=" ",xp=!1;function H0(e,t){switch(e){case"keyup":return rS.indexOf(t.keyCode)!==-1;case"keydown":return t.keyCode!==229;case"keypress":case"mousedown":case"focusout":return!0;default:return!1}}function W0(e){return e=e.detail,typeof e=="object"&&"data"in e?e.data:null}var ui=!1;function sS(e,t){switch(e){case"compositionend":return W0(t);case"keypress":return t.which!==32?null:(xp=!0,vp);case"textInput":return e=t.data,e===vp&&xp?null:e;default:return null}}function oS(e,t){if(ui)return e==="compositionend"||!wh&&H0(e,t)?(e=z0(),wa=yh=Vn=null,ui=!1,e):null;switch(e){case"paste":return null;case"keypress":if(!(t.ctrlKey||t.altKey||t.metaKey)||t.ctrlKey&&t.altKey){if(t.char&&1<t.char.length)return t.char;if(t.which)return String.fromCharCode(t.which)}return null;case"compositionend":return q0&&t.locale!=="ko"?null:t.data;default:return null}}var aS={color:!0,date:!0,datetime:!0,"datetime-local":!0,email:!0,month:!0,number:!0,password:!0,range:!0,search:!0,tel:!0,text:!0,time:!0,url:!0,week:!0};function wp(e){var t=e&&e.nodeName&&e.nodeName.toLowerCase();return t==="input"?!!aS[e.type]:t==="textarea"}function G0(e,t,n,r){_0(r),t=Va(t,"onChange"),0<t.length&&(n=new vh("onChange","change",null,n,r),e.push({event:n,listeners:t}))}var Cs=null,Js=null;function lS(e){iv(e,0)}function Pl(e){var t=hi(e);if(y0(t))return e}function uS(e,t){if(e==="change")return t}var K0=!1;if(Sn){var vu;if(Sn){var xu="oninput"in document;if(!xu){var kp=document.createElement("div");kp.setAttribute("oninput","return;"),xu=typeof kp.oninput=="function"}vu=xu}else vu=!1;K0=vu&&(!document.documentMode||9<document.documentMode)}function bp(){Cs&&(Cs.detachEvent("onpropertychange",J0),Js=Cs=null)}function J0(e){if(e.propertyName==="value"&&Pl(Js)){var t=[];G0(t,Js,e,hh(e)),P0(lS,t)}}function cS(e,t,n){e==="focusin"?(bp(),Cs=t,Js=n,Cs.attachEvent("onpropertychange",J0)):e==="focusout"&&bp()}function dS(e){if(e==="selectionchange"||e==="keyup"||e==="keydown")return Pl(Js)}function hS(e,t){if(e==="click")return Pl(t)}function fS(e,t){if(e==="input"||e==="change")return Pl(t)}function pS(e,t){return e===t&&(e!==0||1/e===1/t)||e!==e&&t!==t}var Kt=typeof Object.is=="function"?Object.is:pS;function Qs(e,t){if(Kt(e,t))return!0;if(typeof e!="object"||e===null||typeof t!="object"||t===null)return!1;var n=Object.keys(e),r=Object.keys(t);if(n.length!==r.length)return!1;for(r=0;r<n.length;r++){var i=n[r];if(!xc.call(t,i)||!Kt(e[i],t[i]))return!1}return!0}function Sp(e){for(;e&&e.firstChild;)e=e.firstChild;return e}function _p(e,t){var n=Sp(e);e=0;for(var r;n;){if(n.nodeType===3){if(r=e+n.textContent.length,e<=t&&r>=t)return{node:n,offset:t-e};e=r}e:{for(;n;){if(n.nextSibling){n=n.nextSibling;break e}n=n.parentNode}n=void 0}n=Sp(n)}}function Q0(e,t){return e&&t?e===t?!0:e&&e.nodeType===3?!1:t&&t.nodeType===3?Q0(e,t.parentNode):"contains"in e?e.contains(t):e.compareDocumentPosition?!!(e.compareDocumentPosition(t)&16):!1:!1}function X0(){for(var e=window,t=Da();t instanceof e.HTMLIFrameElement;){try{var n=typeof t.contentWindow.location.href=="string"}catch{n=!1}if(n)e=t.contentWindow;else break;t=Da(e.document)}return t}function kh(e){var t=e&&e.nodeName&&e.nodeName.toLowerCase();return t&&(t==="input"&&(e.type==="text"||e.type==="search"||e.type==="tel"||e.type==="url"||e.type==="password")||t==="textarea"||e.contentEditable==="true")}function mS(e){var t=X0(),n=e.focusedElem,r=e.selectionRange;if(t!==n&&n&&n.ownerDocument&&Q0(n.ownerDocument.documentElement,n)){if(r!==null&&kh(n)){if(t=r.start,e=r.end,e===void 0&&(e=t),"selectionStart"in n)n.selectionStart=t,n.selectionEnd=Math.min(e,n.value.length);else if(e=(t=n.ownerDocument||document)&&t.defaultView||window,e.getSelection){e=e.getSelection();var i=n.textContent.length,s=Math.min(r.start,i);r=r.end===void 0?s:Math.min(r.end,i),!e.extend&&s>r&&(i=r,r=s,s=i),i=_p(n,s);var o=_p(n,r);i&&o&&(e.rangeCount!==1||e.anchorNode!==i.node||e.anchorOffset!==i.offset||e.focusNode!==o.node||e.focusOffset!==o.offset)&&(t=t.createRange(),t.setStart(i.node,i.offset),e.removeAllRanges(),s>r?(e.addRange(t),e.extend(o.node,o.offset)):(t.setEnd(o.node,o.offset),e.addRange(t)))}}for(t=[],e=n;e=e.parentNode;)e.nodeType===1&&t.push({element:e,left:e.scrollLeft,top:e.scrollTop});for(typeof n.focus=="function"&&n.focus(),n=0;n<t.length;n++)e=t[n],e.element.scrollLeft=e.left,e.element.scrollTop=e.top}}var gS=Sn&&"documentMode"in document&&11>=document.documentMode,ci=null,Bc=null,Es=null,Fc=!1;function Cp(e,t,n){var r=n.window===n?n.document:n.nodeType===9?n:n.ownerDocument;Fc||ci==null||ci!==Da(r)||(r=ci,"selectionStart"in r&&kh(r)?r={start:r.selectionStart,end:r.selectionEnd}:(r=(r.ownerDocument&&r.ownerDocument.defaultView||window).getSelection(),r={anchorNode:r.anchorNode,anchorOffset:r.anchorOffset,focusNode:r.focusNode,focusOffset:r.focusOffset}),Es&&Qs(Es,r)||(Es=r,r=Va(Bc,"onSelect"),0<r.length&&(t=new vh("onSelect","select",null,t,n),e.push({event:t,listeners:r}),t.target=ci)))}function qo(e,t){var n={};return n[e.toLowerCase()]=t.toLowerCase(),n["Webkit"+e]="webkit"+t,n["Moz"+e]="moz"+t,n}var di={animationend:qo("Animation","AnimationEnd"),animationiteration:qo("Animation","AnimationIteration"),animationstart:qo("Animation","AnimationStart"),transitionend:qo("Transition","TransitionEnd")},wu={},Y0={};Sn&&(Y0=document.createElement("div").style,"AnimationEvent"in window||(delete di.animationend.animation,delete di.animationiteration.animation,delete di.animationstart.animation),"TransitionEvent"in window||delete di.transitionend.transition);function Al(e){if(wu[e])return wu[e];if(!di[e])return e;var t=di[e],n;for(n in t)if(t.hasOwnProperty(n)&&n in Y0)return wu[e]=t[n];return e}var Z0=Al("animationend"),ev=Al("animationiteration"),tv=Al("animationstart"),nv=Al("transitionend"),rv=new Map,Ep="abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");function or(e,t){rv.set(e,t),Ur(t,[e])}for(var ku=0;ku<Ep.length;ku++){var bu=Ep[ku],yS=bu.toLowerCase(),vS=bu[0].toUpperCase()+bu.slice(1);or(yS,"on"+vS)}or(Z0,"onAnimationEnd");or(ev,"onAnimationIteration");or(tv,"onAnimationStart");or("dblclick","onDoubleClick");or("focusin","onFocus");or("focusout","onBlur");or(nv,"onTransitionEnd");Ni("onMouseEnter",["mouseout","mouseover"]);Ni("onMouseLeave",["mouseout","mouseover"]);Ni("onPointerEnter",["pointerout","pointerover"]);Ni("onPointerLeave",["pointerout","pointerover"]);Ur("onChange","change click focusin focusout input keydown keyup selectionchange".split(" "));Ur("onSelect","focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" "));Ur("onBeforeInput",["compositionend","keypress","textInput","paste"]);Ur("onCompositionEnd","compositionend focusout keydown keypress keyup mousedown".split(" "));Ur("onCompositionStart","compositionstart focusout keydown keypress keyup mousedown".split(" "));Ur("onCompositionUpdate","compositionupdate focusout keydown keypress keyup mousedown".split(" "));var ys="abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),xS=new Set("cancel close invalid load scroll toggle".split(" ").concat(ys));function Tp(e,t,n){var r=e.type||"unknown-event";e.currentTarget=n,yb(r,t,void 0,e),e.currentTarget=null}function iv(e,t){t=(t&4)!==0;for(var n=0;n<e.length;n++){var r=e[n],i=r.event;r=r.listeners;e:{var s=void 0;if(t)for(var o=r.length-1;0<=o;o--){var a=r[o],l=a.instance,u=a.currentTarget;if(a=a.listener,l!==s&&i.isPropagationStopped())break e;Tp(i,a,u),s=l}else for(o=0;o<r.length;o++){if(a=r[o],l=a.instance,u=a.currentTarget,a=a.listener,l!==s&&i.isPropagationStopped())break e;Tp(i,a,u),s=l}}}if(Ma)throw e=Ic,Ma=!1,Ic=null,e}function ge(e,t){var n=t[qc];n===void 0&&(n=t[qc]=new Set);var r=e+"__bubble";n.has(r)||(sv(t,e,2,!1),n.add(r))}function Su(e,t,n){var r=0;t&&(r|=4),sv(n,e,r,t)}var Ho="_reactListening"+Math.random().toString(36).slice(2);function Xs(e){if(!e[Ho]){e[Ho]=!0,h0.forEach(function(n){n!=="selectionchange"&&(xS.has(n)||Su(n,!1,e),Su(n,!0,e))});var t=e.nodeType===9?e:e.ownerDocument;t===null||t[Ho]||(t[Ho]=!0,Su("selectionchange",!1,t))}}function sv(e,t,n,r){switch(V0(t)){case 1:var i=jb;break;case 4:i=Ib;break;default:i=gh}n=i.bind(null,t,n,e),i=void 0,!jc||t!=="touchstart"&&t!=="touchmove"&&t!=="wheel"||(i=!0),r?i!==void 0?e.addEventListener(t,n,{capture:!0,passive:i}):e.addEventListener(t,n,!0):i!==void 0?e.addEventListener(t,n,{passive:i}):e.addEventListener(t,n,!1)}function _u(e,t,n,r,i){var s=r;if(!(t&1)&&!(t&2)&&r!==null)e:for(;;){if(r===null)return;var o=r.tag;if(o===3||o===4){var a=r.stateNode.containerInfo;if(a===i||a.nodeType===8&&a.parentNode===i)break;if(o===4)for(o=r.return;o!==null;){var l=o.tag;if((l===3||l===4)&&(l=o.stateNode.containerInfo,l===i||l.nodeType===8&&l.parentNode===i))return;o=o.return}for(;a!==null;){if(o=Er(a),o===null)return;if(l=o.tag,l===5||l===6){r=s=o;continue e}a=a.parentNode}}r=r.return}P0(function(){var u=s,c=hh(n),d=[];e:{var h=rv.get(e);if(h!==void 0){var f=vh,p=e;switch(e){case"keypress":if(ka(n)===0)break e;case"keydown":case"keyup":f=Jb;break;case"focusin":p="focus",f=yu;break;case"focusout":p="blur",f=yu;break;case"beforeblur":case"afterblur":f=yu;break;case"click":if(n.button===2)break e;case"auxclick":case"dblclick":case"mousedown":case"mousemove":case"mouseup":case"mouseout":case"mouseover":case"contextmenu":f=mp;break;case"drag":case"dragend":case"dragenter":case"dragexit":case"dragleave":case"dragover":case"dragstart":case"drop":f=Mb;break;case"touchcancel":case"touchend":case"touchmove":case"touchstart":f=Yb;break;case Z0:case ev:case tv:f=$b;break;case nv:f=eS;break;case"scroll":f=Db;break;case"wheel":f=nS;break;case"copy":case"cut":case"paste":f=Vb;break;case"gotpointercapture":case"lostpointercapture":case"pointercancel":case"pointerdown":case"pointermove":case"pointerout":case"pointerover":case"pointerup":f=yp}var v=(t&4)!==0,w=!v&&e==="scroll",m=v?h!==null?h+"Capture":null:h;v=[];for(var g=u,y;g!==null;){y=g;var k=y.stateNode;if(y.tag===5&&k!==null&&(y=k,m!==null&&(k=Hs(g,m),k!=null&&v.push(Ys(g,k,y)))),w)break;g=g.return}0<v.length&&(h=new f(h,p,null,n,c),d.push({event:h,listeners:v}))}}if(!(t&7)){e:{if(h=e==="mouseover"||e==="pointerover",f=e==="mouseout"||e==="pointerout",h&&n!==Oc&&(p=n.relatedTarget||n.fromElement)&&(Er(p)||p[_n]))break e;if((f||h)&&(h=c.window===c?c:(h=c.ownerDocument)?h.defaultView||h.parentWindow:window,f?(p=n.relatedTarget||n.toElement,f=u,p=p?Er(p):null,p!==null&&(w=Vr(p),p!==w||p.tag!==5&&p.tag!==6)&&(p=null)):(f=null,p=u),f!==p)){if(v=mp,k="onMouseLeave",m="onMouseEnter",g="mouse",(e==="pointerout"||e==="pointerover")&&(v=yp,k="onPointerLeave",m="onPointerEnter",g="pointer"),w=f==null?h:hi(f),y=p==null?h:hi(p),h=new v(k,g+"leave",f,n,c),h.target=w,h.relatedTarget=y,k=null,Er(c)===u&&(v=new v(m,g+"enter",p,n,c),v.target=y,v.relatedTarget=w,k=v),w=k,f&&p)t:{for(v=f,m=p,g=0,y=v;y;y=Gr(y))g++;for(y=0,k=m;k;k=Gr(k))y++;for(;0<g-y;)v=Gr(v),g--;for(;0<y-g;)m=Gr(m),y--;for(;g--;){if(v===m||m!==null&&v===m.alternate)break t;v=Gr(v),m=Gr(m)}v=null}else v=null;f!==null&&Pp(d,h,f,v,!1),p!==null&&w!==null&&Pp(d,w,p,v,!0)}}e:{if(h=u?hi(u):window,f=h.nodeName&&h.nodeName.toLowerCase(),f==="select"||f==="input"&&h.type==="file")var T=uS;else if(wp(h))if(K0)T=fS;else{T=dS;var S=cS}else(f=h.nodeName)&&f.toLowerCase()==="input"&&(h.type==="checkbox"||h.type==="radio")&&(T=hS);if(T&&(T=T(e,u))){G0(d,T,n,c);break e}S&&S(e,h,u),e==="focusout"&&(S=h._wrapperState)&&S.controlled&&h.type==="number"&&Ec(h,"number",h.value)}switch(S=u?hi(u):window,e){case"focusin":(wp(S)||S.contentEditable==="true")&&(ci=S,Bc=u,Es=null);break;case"focusout":Es=Bc=ci=null;break;case"mousedown":Fc=!0;break;case"contextmenu":case"mouseup":case"dragend":Fc=!1,Cp(d,n,c);break;case"selectionchange":if(gS)break;case"keydown":case"keyup":Cp(d,n,c)}var P;if(wh)e:{switch(e){case"compositionstart":var A="onCompositionStart";break e;case"compositionend":A="onCompositionEnd";break e;case"compositionupdate":A="onCompositionUpdate";break e}A=void 0}else ui?H0(e,n)&&(A="onCompositionEnd"):e==="keydown"&&n.keyCode===229&&(A="onCompositionStart");A&&(q0&&n.locale!=="ko"&&(ui||A!=="onCompositionStart"?A==="onCompositionEnd"&&ui&&(P=z0()):(Vn=c,yh="value"in Vn?Vn.value:Vn.textContent,ui=!0)),S=Va(u,A),0<S.length&&(A=new gp(A,e,null,n,c),d.push({event:A,listeners:S}),P?A.data=P:(P=W0(n),P!==null&&(A.data=P)))),(P=iS?sS(e,n):oS(e,n))&&(u=Va(u,"onBeforeInput"),0<u.length&&(c=new gp("onBeforeInput","beforeinput",null,n,c),d.push({event:c,listeners:u}),c.data=P))}iv(d,t)})}function Ys(e,t,n){return{instance:e,listener:t,currentTarget:n}}function Va(e,t){for(var n=t+"Capture",r=[];e!==null;){var i=e,s=i.stateNode;i.tag===5&&s!==null&&(i=s,s=Hs(e,n),s!=null&&r.unshift(Ys(e,s,i)),s=Hs(e,t),s!=null&&r.push(Ys(e,s,i))),e=e.return}return r}function Gr(e){if(e===null)return null;do e=e.return;while(e&&e.tag!==5);return e||null}function Pp(e,t,n,r,i){for(var s=t._reactName,o=[];n!==null&&n!==r;){var a=n,l=a.alternate,u=a.stateNode;if(l!==null&&l===r)break;a.tag===5&&u!==null&&(a=u,i?(l=Hs(n,s),l!=null&&o.unshift(Ys(n,l,a))):i||(l=Hs(n,s),l!=null&&o.push(Ys(n,l,a)))),n=n.return}o.length!==0&&e.push({event:t,listeners:o})}var wS=/\r\n?/g,kS=/\u0000|\uFFFD/g;function Ap(e){return(typeof e=="string"?e:""+e).replace(wS,`
`).replace(kS,"")}function Wo(e,t,n){if(t=Ap(t),Ap(e)!==t&&n)throw Error(j(425))}function za(){}var $c=null,Uc=null;function Vc(e,t){return e==="textarea"||e==="noscript"||typeof t.children=="string"||typeof t.children=="number"||typeof t.dangerouslySetInnerHTML=="object"&&t.dangerouslySetInnerHTML!==null&&t.dangerouslySetInnerHTML.__html!=null}var zc=typeof setTimeout=="function"?setTimeout:void 0,bS=typeof clearTimeout=="function"?clearTimeout:void 0,Rp=typeof Promise=="function"?Promise:void 0,SS=typeof queueMicrotask=="function"?queueMicrotask:typeof Rp<"u"?function(e){return Rp.resolve(null).then(e).catch(_S)}:zc;function _S(e){setTimeout(function(){throw e})}function Cu(e,t){var n=t,r=0;do{var i=n.nextSibling;if(e.removeChild(n),i&&i.nodeType===8)if(n=i.data,n==="/$"){if(r===0){e.removeChild(i),Ks(t);return}r--}else n!=="$"&&n!=="$?"&&n!=="$!"||r++;n=i}while(n);Ks(t)}function Kn(e){for(;e!=null;e=e.nextSibling){var t=e.nodeType;if(t===1||t===3)break;if(t===8){if(t=e.data,t==="$"||t==="$!"||t==="$?")break;if(t==="/$")return null}}return e}function Op(e){e=e.previousSibling;for(var t=0;e;){if(e.nodeType===8){var n=e.data;if(n==="$"||n==="$!"||n==="$?"){if(t===0)return e;t--}else n==="/$"&&t++}e=e.previousSibling}return null}var Hi=Math.random().toString(36).slice(2),nn="__reactFiber$"+Hi,Zs="__reactProps$"+Hi,_n="__reactContainer$"+Hi,qc="__reactEvents$"+Hi,CS="__reactListeners$"+Hi,ES="__reactHandles$"+Hi;function Er(e){var t=e[nn];if(t)return t;for(var n=e.parentNode;n;){if(t=n[_n]||n[nn]){if(n=t.alternate,t.child!==null||n!==null&&n.child!==null)for(e=Op(e);e!==null;){if(n=e[nn])return n;e=Op(e)}return t}e=n,n=e.parentNode}return null}function Co(e){return e=e[nn]||e[_n],!e||e.tag!==5&&e.tag!==6&&e.tag!==13&&e.tag!==3?null:e}function hi(e){if(e.tag===5||e.tag===6)return e.stateNode;throw Error(j(33))}function Rl(e){return e[Zs]||null}var Hc=[],fi=-1;function ar(e){return{current:e}}function ye(e){0>fi||(e.current=Hc[fi],Hc[fi]=null,fi--)}function pe(e,t){fi++,Hc[fi]=e.current,e.current=t}var rr={},Ke=ar(rr),at=ar(!1),Dr=rr;function ji(e,t){var n=e.type.contextTypes;if(!n)return rr;var r=e.stateNode;if(r&&r.__reactInternalMemoizedUnmaskedChildContext===t)return r.__reactInternalMemoizedMaskedChildContext;var i={},s;for(s in n)i[s]=t[s];return r&&(e=e.stateNode,e.__reactInternalMemoizedUnmaskedChildContext=t,e.__reactInternalMemoizedMaskedChildContext=i),i}function lt(e){return e=e.childContextTypes,e!=null}function qa(){ye(at),ye(Ke)}function Np(e,t,n){if(Ke.current!==rr)throw Error(j(168));pe(Ke,t),pe(at,n)}function ov(e,t,n){var r=e.stateNode;if(t=t.childContextTypes,typeof r.getChildContext!="function")return n;r=r.getChildContext();for(var i in r)if(!(i in t))throw Error(j(108,cb(e)||"Unknown",i));return Se({},n,r)}function Ha(e){return e=(e=e.stateNode)&&e.__reactInternalMemoizedMergedChildContext||rr,Dr=Ke.current,pe(Ke,e),pe(at,at.current),!0}function jp(e,t,n){var r=e.stateNode;if(!r)throw Error(j(169));n?(e=ov(e,t,Dr),r.__reactInternalMemoizedMergedChildContext=e,ye(at),ye(Ke),pe(Ke,e)):ye(at),pe(at,n)}var gn=null,Ol=!1,Eu=!1;function av(e){gn===null?gn=[e]:gn.push(e)}function TS(e){Ol=!0,av(e)}function lr(){if(!Eu&&gn!==null){Eu=!0;var e=0,t=le;try{var n=gn;for(le=1;e<n.length;e++){var r=n[e];do r=r(!0);while(r!==null)}gn=null,Ol=!1}catch(i){throw gn!==null&&(gn=gn.slice(e+1)),N0(fh,lr),i}finally{le=t,Eu=!1}}return null}var pi=[],mi=0,Wa=null,Ga=0,At=[],Rt=0,Lr=null,yn=1,vn="";function yr(e,t){pi[mi++]=Ga,pi[mi++]=Wa,Wa=e,Ga=t}function lv(e,t,n){At[Rt++]=yn,At[Rt++]=vn,At[Rt++]=Lr,Lr=e;var r=yn;e=vn;var i=32-Ht(r)-1;r&=~(1<<i),n+=1;var s=32-Ht(t)+i;if(30<s){var o=i-i%5;s=(r&(1<<o)-1).toString(32),r>>=o,i-=o,yn=1<<32-Ht(t)+i|n<<i|r,vn=s+e}else yn=1<<s|n<<i|r,vn=e}function bh(e){e.return!==null&&(yr(e,1),lv(e,1,0))}function Sh(e){for(;e===Wa;)Wa=pi[--mi],pi[mi]=null,Ga=pi[--mi],pi[mi]=null;for(;e===Lr;)Lr=At[--Rt],At[Rt]=null,vn=At[--Rt],At[Rt]=null,yn=At[--Rt],At[Rt]=null}var xt=null,vt=null,ve=!1,qt=null;function uv(e,t){var n=Nt(5,null,null,0);n.elementType="DELETED",n.stateNode=t,n.return=e,t=e.deletions,t===null?(e.deletions=[n],e.flags|=16):t.push(n)}function Ip(e,t){switch(e.tag){case 5:var n=e.type;return t=t.nodeType!==1||n.toLowerCase()!==t.nodeName.toLowerCase()?null:t,t!==null?(e.stateNode=t,xt=e,vt=Kn(t.firstChild),!0):!1;case 6:return t=e.pendingProps===""||t.nodeType!==3?null:t,t!==null?(e.stateNode=t,xt=e,vt=null,!0):!1;case 13:return t=t.nodeType!==8?null:t,t!==null?(n=Lr!==null?{id:yn,overflow:vn}:null,e.memoizedState={dehydrated:t,treeContext:n,retryLane:1073741824},n=Nt(18,null,null,0),n.stateNode=t,n.return=e,e.child=n,xt=e,vt=null,!0):!1;default:return!1}}function Wc(e){return(e.mode&1)!==0&&(e.flags&128)===0}function Gc(e){if(ve){var t=vt;if(t){var n=t;if(!Ip(e,t)){if(Wc(e))throw Error(j(418));t=Kn(n.nextSibling);var r=xt;t&&Ip(e,t)?uv(r,n):(e.flags=e.flags&-4097|2,ve=!1,xt=e)}}else{if(Wc(e))throw Error(j(418));e.flags=e.flags&-4097|2,ve=!1,xt=e}}}function Dp(e){for(e=e.return;e!==null&&e.tag!==5&&e.tag!==3&&e.tag!==13;)e=e.return;xt=e}function Go(e){if(e!==xt)return!1;if(!ve)return Dp(e),ve=!0,!1;var t;if((t=e.tag!==3)&&!(t=e.tag!==5)&&(t=e.type,t=t!=="head"&&t!=="body"&&!Vc(e.type,e.memoizedProps)),t&&(t=vt)){if(Wc(e))throw cv(),Error(j(418));for(;t;)uv(e,t),t=Kn(t.nextSibling)}if(Dp(e),e.tag===13){if(e=e.memoizedState,e=e!==null?e.dehydrated:null,!e)throw Error(j(317));e:{for(e=e.nextSibling,t=0;e;){if(e.nodeType===8){var n=e.data;if(n==="/$"){if(t===0){vt=Kn(e.nextSibling);break e}t--}else n!=="$"&&n!=="$!"&&n!=="$?"||t++}e=e.nextSibling}vt=null}}else vt=xt?Kn(e.stateNode.nextSibling):null;return!0}function cv(){for(var e=vt;e;)e=Kn(e.nextSibling)}function Ii(){vt=xt=null,ve=!1}function _h(e){qt===null?qt=[e]:qt.push(e)}var PS=Pn.ReactCurrentBatchConfig;function ss(e,t,n){if(e=n.ref,e!==null&&typeof e!="function"&&typeof e!="object"){if(n._owner){if(n=n._owner,n){if(n.tag!==1)throw Error(j(309));var r=n.stateNode}if(!r)throw Error(j(147,e));var i=r,s=""+e;return t!==null&&t.ref!==null&&typeof t.ref=="function"&&t.ref._stringRef===s?t.ref:(t=function(o){var a=i.refs;o===null?delete a[s]:a[s]=o},t._stringRef=s,t)}if(typeof e!="string")throw Error(j(284));if(!n._owner)throw Error(j(290,e))}return e}function Ko(e,t){throw e=Object.prototype.toString.call(t),Error(j(31,e==="[object Object]"?"object with keys {"+Object.keys(t).join(", ")+"}":e))}function Lp(e){var t=e._init;return t(e._payload)}function dv(e){function t(m,g){if(e){var y=m.deletions;y===null?(m.deletions=[g],m.flags|=16):y.push(g)}}function n(m,g){if(!e)return null;for(;g!==null;)t(m,g),g=g.sibling;return null}function r(m,g){for(m=new Map;g!==null;)g.key!==null?m.set(g.key,g):m.set(g.index,g),g=g.sibling;return m}function i(m,g){return m=Yn(m,g),m.index=0,m.sibling=null,m}function s(m,g,y){return m.index=y,e?(y=m.alternate,y!==null?(y=y.index,y<g?(m.flags|=2,g):y):(m.flags|=2,g)):(m.flags|=1048576,g)}function o(m){return e&&m.alternate===null&&(m.flags|=2),m}function a(m,g,y,k){return g===null||g.tag!==6?(g=ju(y,m.mode,k),g.return=m,g):(g=i(g,y),g.return=m,g)}function l(m,g,y,k){var T=y.type;return T===li?c(m,g,y.props.children,k,y.key):g!==null&&(g.elementType===T||typeof T=="object"&&T!==null&&T.$$typeof===Dn&&Lp(T)===g.type)?(k=i(g,y.props),k.ref=ss(m,g,y),k.return=m,k):(k=Pa(y.type,y.key,y.props,null,m.mode,k),k.ref=ss(m,g,y),k.return=m,k)}function u(m,g,y,k){return g===null||g.tag!==4||g.stateNode.containerInfo!==y.containerInfo||g.stateNode.implementation!==y.implementation?(g=Iu(y,m.mode,k),g.return=m,g):(g=i(g,y.children||[]),g.return=m,g)}function c(m,g,y,k,T){return g===null||g.tag!==7?(g=Nr(y,m.mode,k,T),g.return=m,g):(g=i(g,y),g.return=m,g)}function d(m,g,y){if(typeof g=="string"&&g!==""||typeof g=="number")return g=ju(""+g,m.mode,y),g.return=m,g;if(typeof g=="object"&&g!==null){switch(g.$$typeof){case Mo:return y=Pa(g.type,g.key,g.props,null,m.mode,y),y.ref=ss(m,null,g),y.return=m,y;case ai:return g=Iu(g,m.mode,y),g.return=m,g;case Dn:var k=g._init;return d(m,k(g._payload),y)}if(ms(g)||es(g))return g=Nr(g,m.mode,y,null),g.return=m,g;Ko(m,g)}return null}function h(m,g,y,k){var T=g!==null?g.key:null;if(typeof y=="string"&&y!==""||typeof y=="number")return T!==null?null:a(m,g,""+y,k);if(typeof y=="object"&&y!==null){switch(y.$$typeof){case Mo:return y.key===T?l(m,g,y,k):null;case ai:return y.key===T?u(m,g,y,k):null;case Dn:return T=y._init,h(m,g,T(y._payload),k)}if(ms(y)||es(y))return T!==null?null:c(m,g,y,k,null);Ko(m,y)}return null}function f(m,g,y,k,T){if(typeof k=="string"&&k!==""||typeof k=="number")return m=m.get(y)||null,a(g,m,""+k,T);if(typeof k=="object"&&k!==null){switch(k.$$typeof){case Mo:return m=m.get(k.key===null?y:k.key)||null,l(g,m,k,T);case ai:return m=m.get(k.key===null?y:k.key)||null,u(g,m,k,T);case Dn:var S=k._init;return f(m,g,y,S(k._payload),T)}if(ms(k)||es(k))return m=m.get(y)||null,c(g,m,k,T,null);Ko(g,k)}return null}function p(m,g,y,k){for(var T=null,S=null,P=g,A=g=0,O=null;P!==null&&A<y.length;A++){P.index>A?(O=P,P=null):O=P.sibling;var E=h(m,P,y[A],k);if(E===null){P===null&&(P=O);break}e&&P&&E.alternate===null&&t(m,P),g=s(E,g,A),S===null?T=E:S.sibling=E,S=E,P=O}if(A===y.length)return n(m,P),ve&&yr(m,A),T;if(P===null){for(;A<y.length;A++)P=d(m,y[A],k),P!==null&&(g=s(P,g,A),S===null?T=P:S.sibling=P,S=P);return ve&&yr(m,A),T}for(P=r(m,P);A<y.length;A++)O=f(P,m,A,y[A],k),O!==null&&(e&&O.alternate!==null&&P.delete(O.key===null?A:O.key),g=s(O,g,A),S===null?T=O:S.sibling=O,S=O);return e&&P.forEach(function(L){return t(m,L)}),ve&&yr(m,A),T}function v(m,g,y,k){var T=es(y);if(typeof T!="function")throw Error(j(150));if(y=T.call(y),y==null)throw Error(j(151));for(var S=T=null,P=g,A=g=0,O=null,E=y.next();P!==null&&!E.done;A++,E=y.next()){P.index>A?(O=P,P=null):O=P.sibling;var L=h(m,P,E.value,k);if(L===null){P===null&&(P=O);break}e&&P&&L.alternate===null&&t(m,P),g=s(L,g,A),S===null?T=L:S.sibling=L,S=L,P=O}if(E.done)return n(m,P),ve&&yr(m,A),T;if(P===null){for(;!E.done;A++,E=y.next())E=d(m,E.value,k),E!==null&&(g=s(E,g,A),S===null?T=E:S.sibling=E,S=E);return ve&&yr(m,A),T}for(P=r(m,P);!E.done;A++,E=y.next())E=f(P,m,A,E.value,k),E!==null&&(e&&E.alternate!==null&&P.delete(E.key===null?A:E.key),g=s(E,g,A),S===null?T=E:S.sibling=E,S=E);return e&&P.forEach(function(B){return t(m,B)}),ve&&yr(m,A),T}function w(m,g,y,k){if(typeof y=="object"&&y!==null&&y.type===li&&y.key===null&&(y=y.props.children),typeof y=="object"&&y!==null){switch(y.$$typeof){case Mo:e:{for(var T=y.key,S=g;S!==null;){if(S.key===T){if(T=y.type,T===li){if(S.tag===7){n(m,S.sibling),g=i(S,y.props.children),g.return=m,m=g;break e}}else if(S.elementType===T||typeof T=="object"&&T!==null&&T.$$typeof===Dn&&Lp(T)===S.type){n(m,S.sibling),g=i(S,y.props),g.ref=ss(m,S,y),g.return=m,m=g;break e}n(m,S);break}else t(m,S);S=S.sibling}y.type===li?(g=Nr(y.props.children,m.mode,k,y.key),g.return=m,m=g):(k=Pa(y.type,y.key,y.props,null,m.mode,k),k.ref=ss(m,g,y),k.return=m,m=k)}return o(m);case ai:e:{for(S=y.key;g!==null;){if(g.key===S)if(g.tag===4&&g.stateNode.containerInfo===y.containerInfo&&g.stateNode.implementation===y.implementation){n(m,g.sibling),g=i(g,y.children||[]),g.return=m,m=g;break e}else{n(m,g);break}else t(m,g);g=g.sibling}g=Iu(y,m.mode,k),g.return=m,m=g}return o(m);case Dn:return S=y._init,w(m,g,S(y._payload),k)}if(ms(y))return p(m,g,y,k);if(es(y))return v(m,g,y,k);Ko(m,y)}return typeof y=="string"&&y!==""||typeof y=="number"?(y=""+y,g!==null&&g.tag===6?(n(m,g.sibling),g=i(g,y),g.return=m,m=g):(n(m,g),g=ju(y,m.mode,k),g.return=m,m=g),o(m)):n(m,g)}return w}var Di=dv(!0),hv=dv(!1),Ka=ar(null),Ja=null,gi=null,Ch=null;function Eh(){Ch=gi=Ja=null}function Th(e){var t=Ka.current;ye(Ka),e._currentValue=t}function Kc(e,t,n){for(;e!==null;){var r=e.alternate;if((e.childLanes&t)!==t?(e.childLanes|=t,r!==null&&(r.childLanes|=t)):r!==null&&(r.childLanes&t)!==t&&(r.childLanes|=t),e===n)break;e=e.return}}function Pi(e,t){Ja=e,Ch=gi=null,e=e.dependencies,e!==null&&e.firstContext!==null&&(e.lanes&t&&(ot=!0),e.firstContext=null)}function It(e){var t=e._currentValue;if(Ch!==e)if(e={context:e,memoizedValue:t,next:null},gi===null){if(Ja===null)throw Error(j(308));gi=e,Ja.dependencies={lanes:0,firstContext:e}}else gi=gi.next=e;return t}var Tr=null;function Ph(e){Tr===null?Tr=[e]:Tr.push(e)}function fv(e,t,n,r){var i=t.interleaved;return i===null?(n.next=n,Ph(t)):(n.next=i.next,i.next=n),t.interleaved=n,Cn(e,r)}function Cn(e,t){e.lanes|=t;var n=e.alternate;for(n!==null&&(n.lanes|=t),n=e,e=e.return;e!==null;)e.childLanes|=t,n=e.alternate,n!==null&&(n.childLanes|=t),n=e,e=e.return;return n.tag===3?n.stateNode:null}var Ln=!1;function Ah(e){e.updateQueue={baseState:e.memoizedState,firstBaseUpdate:null,lastBaseUpdate:null,shared:{pending:null,interleaved:null,lanes:0},effects:null}}function pv(e,t){e=e.updateQueue,t.updateQueue===e&&(t.updateQueue={baseState:e.baseState,firstBaseUpdate:e.firstBaseUpdate,lastBaseUpdate:e.lastBaseUpdate,shared:e.shared,effects:e.effects})}function wn(e,t){return{eventTime:e,lane:t,tag:0,payload:null,callback:null,next:null}}function Jn(e,t,n){var r=e.updateQueue;if(r===null)return null;if(r=r.shared,oe&2){var i=r.pending;return i===null?t.next=t:(t.next=i.next,i.next=t),r.pending=t,Cn(e,n)}return i=r.interleaved,i===null?(t.next=t,Ph(r)):(t.next=i.next,i.next=t),r.interleaved=t,Cn(e,n)}function ba(e,t,n){if(t=t.updateQueue,t!==null&&(t=t.shared,(n&4194240)!==0)){var r=t.lanes;r&=e.pendingLanes,n|=r,t.lanes=n,ph(e,n)}}function Mp(e,t){var n=e.updateQueue,r=e.alternate;if(r!==null&&(r=r.updateQueue,n===r)){var i=null,s=null;if(n=n.firstBaseUpdate,n!==null){do{var o={eventTime:n.eventTime,lane:n.lane,tag:n.tag,payload:n.payload,callback:n.callback,next:null};s===null?i=s=o:s=s.next=o,n=n.next}while(n!==null);s===null?i=s=t:s=s.next=t}else i=s=t;n={baseState:r.baseState,firstBaseUpdate:i,lastBaseUpdate:s,shared:r.shared,effects:r.effects},e.updateQueue=n;return}e=n.lastBaseUpdate,e===null?n.firstBaseUpdate=t:e.next=t,n.lastBaseUpdate=t}function Qa(e,t,n,r){var i=e.updateQueue;Ln=!1;var s=i.firstBaseUpdate,o=i.lastBaseUpdate,a=i.shared.pending;if(a!==null){i.shared.pending=null;var l=a,u=l.next;l.next=null,o===null?s=u:o.next=u,o=l;var c=e.alternate;c!==null&&(c=c.updateQueue,a=c.lastBaseUpdate,a!==o&&(a===null?c.firstBaseUpdate=u:a.next=u,c.lastBaseUpdate=l))}if(s!==null){var d=i.baseState;o=0,c=u=l=null,a=s;do{var h=a.lane,f=a.eventTime;if((r&h)===h){c!==null&&(c=c.next={eventTime:f,lane:0,tag:a.tag,payload:a.payload,callback:a.callback,next:null});e:{var p=e,v=a;switch(h=t,f=n,v.tag){case 1:if(p=v.payload,typeof p=="function"){d=p.call(f,d,h);break e}d=p;break e;case 3:p.flags=p.flags&-65537|128;case 0:if(p=v.payload,h=typeof p=="function"?p.call(f,d,h):p,h==null)break e;d=Se({},d,h);break e;case 2:Ln=!0}}a.callback!==null&&a.lane!==0&&(e.flags|=64,h=i.effects,h===null?i.effects=[a]:h.push(a))}else f={eventTime:f,lane:h,tag:a.tag,payload:a.payload,callback:a.callback,next:null},c===null?(u=c=f,l=d):c=c.next=f,o|=h;if(a=a.next,a===null){if(a=i.shared.pending,a===null)break;h=a,a=h.next,h.next=null,i.lastBaseUpdate=h,i.shared.pending=null}}while(!0);if(c===null&&(l=d),i.baseState=l,i.firstBaseUpdate=u,i.lastBaseUpdate=c,t=i.shared.interleaved,t!==null){i=t;do o|=i.lane,i=i.next;while(i!==t)}else s===null&&(i.shared.lanes=0);Br|=o,e.lanes=o,e.memoizedState=d}}function Bp(e,t,n){if(e=t.effects,t.effects=null,e!==null)for(t=0;t<e.length;t++){var r=e[t],i=r.callback;if(i!==null){if(r.callback=null,r=n,typeof i!="function")throw Error(j(191,i));i.call(r)}}}var Eo={},on=ar(Eo),eo=ar(Eo),to=ar(Eo);function Pr(e){if(e===Eo)throw Error(j(174));return e}function Rh(e,t){switch(pe(to,t),pe(eo,e),pe(on,Eo),e=t.nodeType,e){case 9:case 11:t=(t=t.documentElement)?t.namespaceURI:Pc(null,"");break;default:e=e===8?t.parentNode:t,t=e.namespaceURI||null,e=e.tagName,t=Pc(t,e)}ye(on),pe(on,t)}function Li(){ye(on),ye(eo),ye(to)}function mv(e){Pr(to.current);var t=Pr(on.current),n=Pc(t,e.type);t!==n&&(pe(eo,e),pe(on,n))}function Oh(e){eo.current===e&&(ye(on),ye(eo))}var xe=ar(0);function Xa(e){for(var t=e;t!==null;){if(t.tag===13){var n=t.memoizedState;if(n!==null&&(n=n.dehydrated,n===null||n.data==="$?"||n.data==="$!"))return t}else if(t.tag===19&&t.memoizedProps.revealOrder!==void 0){if(t.flags&128)return t}else if(t.child!==null){t.child.return=t,t=t.child;continue}if(t===e)break;for(;t.sibling===null;){if(t.return===null||t.return===e)return null;t=t.return}t.sibling.return=t.return,t=t.sibling}return null}var Tu=[];function Nh(){for(var e=0;e<Tu.length;e++)Tu[e]._workInProgressVersionPrimary=null;Tu.length=0}var Sa=Pn.ReactCurrentDispatcher,Pu=Pn.ReactCurrentBatchConfig,Mr=0,ke=null,Ne=null,Ie=null,Ya=!1,Ts=!1,no=0,AS=0;function Ve(){throw Error(j(321))}function jh(e,t){if(t===null)return!1;for(var n=0;n<t.length&&n<e.length;n++)if(!Kt(e[n],t[n]))return!1;return!0}function Ih(e,t,n,r,i,s){if(Mr=s,ke=t,t.memoizedState=null,t.updateQueue=null,t.lanes=0,Sa.current=e===null||e.memoizedState===null?jS:IS,e=n(r,i),Ts){s=0;do{if(Ts=!1,no=0,25<=s)throw Error(j(301));s+=1,Ie=Ne=null,t.updateQueue=null,Sa.current=DS,e=n(r,i)}while(Ts)}if(Sa.current=Za,t=Ne!==null&&Ne.next!==null,Mr=0,Ie=Ne=ke=null,Ya=!1,t)throw Error(j(300));return e}function Dh(){var e=no!==0;return no=0,e}function Yt(){var e={memoizedState:null,baseState:null,baseQueue:null,queue:null,next:null};return Ie===null?ke.memoizedState=Ie=e:Ie=Ie.next=e,Ie}function Dt(){if(Ne===null){var e=ke.alternate;e=e!==null?e.memoizedState:null}else e=Ne.next;var t=Ie===null?ke.memoizedState:Ie.next;if(t!==null)Ie=t,Ne=e;else{if(e===null)throw Error(j(310));Ne=e,e={memoizedState:Ne.memoizedState,baseState:Ne.baseState,baseQueue:Ne.baseQueue,queue:Ne.queue,next:null},Ie===null?ke.memoizedState=Ie=e:Ie=Ie.next=e}return Ie}function ro(e,t){return typeof t=="function"?t(e):t}function Au(e){var t=Dt(),n=t.queue;if(n===null)throw Error(j(311));n.lastRenderedReducer=e;var r=Ne,i=r.baseQueue,s=n.pending;if(s!==null){if(i!==null){var o=i.next;i.next=s.next,s.next=o}r.baseQueue=i=s,n.pending=null}if(i!==null){s=i.next,r=r.baseState;var a=o=null,l=null,u=s;do{var c=u.lane;if((Mr&c)===c)l!==null&&(l=l.next={lane:0,action:u.action,hasEagerState:u.hasEagerState,eagerState:u.eagerState,next:null}),r=u.hasEagerState?u.eagerState:e(r,u.action);else{var d={lane:c,action:u.action,hasEagerState:u.hasEagerState,eagerState:u.eagerState,next:null};l===null?(a=l=d,o=r):l=l.next=d,ke.lanes|=c,Br|=c}u=u.next}while(u!==null&&u!==s);l===null?o=r:l.next=a,Kt(r,t.memoizedState)||(ot=!0),t.memoizedState=r,t.baseState=o,t.baseQueue=l,n.lastRenderedState=r}if(e=n.interleaved,e!==null){i=e;do s=i.lane,ke.lanes|=s,Br|=s,i=i.next;while(i!==e)}else i===null&&(n.lanes=0);return[t.memoizedState,n.dispatch]}function Ru(e){var t=Dt(),n=t.queue;if(n===null)throw Error(j(311));n.lastRenderedReducer=e;var r=n.dispatch,i=n.pending,s=t.memoizedState;if(i!==null){n.pending=null;var o=i=i.next;do s=e(s,o.action),o=o.next;while(o!==i);Kt(s,t.memoizedState)||(ot=!0),t.memoizedState=s,t.baseQueue===null&&(t.baseState=s),n.lastRenderedState=s}return[s,r]}function gv(){}function yv(e,t){var n=ke,r=Dt(),i=t(),s=!Kt(r.memoizedState,i);if(s&&(r.memoizedState=i,ot=!0),r=r.queue,Lh(wv.bind(null,n,r,e),[e]),r.getSnapshot!==t||s||Ie!==null&&Ie.memoizedState.tag&1){if(n.flags|=2048,io(9,xv.bind(null,n,r,i,t),void 0,null),De===null)throw Error(j(349));Mr&30||vv(n,t,i)}return i}function vv(e,t,n){e.flags|=16384,e={getSnapshot:t,value:n},t=ke.updateQueue,t===null?(t={lastEffect:null,stores:null},ke.updateQueue=t,t.stores=[e]):(n=t.stores,n===null?t.stores=[e]:n.push(e))}function xv(e,t,n,r){t.value=n,t.getSnapshot=r,kv(t)&&bv(e)}function wv(e,t,n){return n(function(){kv(t)&&bv(e)})}function kv(e){var t=e.getSnapshot;e=e.value;try{var n=t();return!Kt(e,n)}catch{return!0}}function bv(e){var t=Cn(e,1);t!==null&&Wt(t,e,1,-1)}function Fp(e){var t=Yt();return typeof e=="function"&&(e=e()),t.memoizedState=t.baseState=e,e={pending:null,interleaved:null,lanes:0,dispatch:null,lastRenderedReducer:ro,lastRenderedState:e},t.queue=e,e=e.dispatch=NS.bind(null,ke,e),[t.memoizedState,e]}function io(e,t,n,r){return e={tag:e,create:t,destroy:n,deps:r,next:null},t=ke.updateQueue,t===null?(t={lastEffect:null,stores:null},ke.updateQueue=t,t.lastEffect=e.next=e):(n=t.lastEffect,n===null?t.lastEffect=e.next=e:(r=n.next,n.next=e,e.next=r,t.lastEffect=e)),e}function Sv(){return Dt().memoizedState}function _a(e,t,n,r){var i=Yt();ke.flags|=e,i.memoizedState=io(1|t,n,void 0,r===void 0?null:r)}function Nl(e,t,n,r){var i=Dt();r=r===void 0?null:r;var s=void 0;if(Ne!==null){var o=Ne.memoizedState;if(s=o.destroy,r!==null&&jh(r,o.deps)){i.memoizedState=io(t,n,s,r);return}}ke.flags|=e,i.memoizedState=io(1|t,n,s,r)}function $p(e,t){return _a(8390656,8,e,t)}function Lh(e,t){return Nl(2048,8,e,t)}function _v(e,t){return Nl(4,2,e,t)}function Cv(e,t){return Nl(4,4,e,t)}function Ev(e,t){if(typeof t=="function")return e=e(),t(e),function(){t(null)};if(t!=null)return e=e(),t.current=e,function(){t.current=null}}function Tv(e,t,n){return n=n!=null?n.concat([e]):null,Nl(4,4,Ev.bind(null,t,e),n)}function Mh(){}function Pv(e,t){var n=Dt();t=t===void 0?null:t;var r=n.memoizedState;return r!==null&&t!==null&&jh(t,r[1])?r[0]:(n.memoizedState=[e,t],e)}function Av(e,t){var n=Dt();t=t===void 0?null:t;var r=n.memoizedState;return r!==null&&t!==null&&jh(t,r[1])?r[0]:(e=e(),n.memoizedState=[e,t],e)}function Rv(e,t,n){return Mr&21?(Kt(n,t)||(n=D0(),ke.lanes|=n,Br|=n,e.baseState=!0),t):(e.baseState&&(e.baseState=!1,ot=!0),e.memoizedState=n)}function RS(e,t){var n=le;le=n!==0&&4>n?n:4,e(!0);var r=Pu.transition;Pu.transition={};try{e(!1),t()}finally{le=n,Pu.transition=r}}function Ov(){return Dt().memoizedState}function OS(e,t,n){var r=Xn(e);if(n={lane:r,action:n,hasEagerState:!1,eagerState:null,next:null},Nv(e))jv(t,n);else if(n=fv(e,t,n,r),n!==null){var i=et();Wt(n,e,r,i),Iv(n,t,r)}}function NS(e,t,n){var r=Xn(e),i={lane:r,action:n,hasEagerState:!1,eagerState:null,next:null};if(Nv(e))jv(t,i);else{var s=e.alternate;if(e.lanes===0&&(s===null||s.lanes===0)&&(s=t.lastRenderedReducer,s!==null))try{var o=t.lastRenderedState,a=s(o,n);if(i.hasEagerState=!0,i.eagerState=a,Kt(a,o)){var l=t.interleaved;l===null?(i.next=i,Ph(t)):(i.next=l.next,l.next=i),t.interleaved=i;return}}catch{}finally{}n=fv(e,t,i,r),n!==null&&(i=et(),Wt(n,e,r,i),Iv(n,t,r))}}function Nv(e){var t=e.alternate;return e===ke||t!==null&&t===ke}function jv(e,t){Ts=Ya=!0;var n=e.pending;n===null?t.next=t:(t.next=n.next,n.next=t),e.pending=t}function Iv(e,t,n){if(n&4194240){var r=t.lanes;r&=e.pendingLanes,n|=r,t.lanes=n,ph(e,n)}}var Za={readContext:It,useCallback:Ve,useContext:Ve,useEffect:Ve,useImperativeHandle:Ve,useInsertionEffect:Ve,useLayoutEffect:Ve,useMemo:Ve,useReducer:Ve,useRef:Ve,useState:Ve,useDebugValue:Ve,useDeferredValue:Ve,useTransition:Ve,useMutableSource:Ve,useSyncExternalStore:Ve,useId:Ve,unstable_isNewReconciler:!1},jS={readContext:It,useCallback:function(e,t){return Yt().memoizedState=[e,t===void 0?null:t],e},useContext:It,useEffect:$p,useImperativeHandle:function(e,t,n){return n=n!=null?n.concat([e]):null,_a(4194308,4,Ev.bind(null,t,e),n)},useLayoutEffect:function(e,t){return _a(4194308,4,e,t)},useInsertionEffect:function(e,t){return _a(4,2,e,t)},useMemo:function(e,t){var n=Yt();return t=t===void 0?null:t,e=e(),n.memoizedState=[e,t],e},useReducer:function(e,t,n){var r=Yt();return t=n!==void 0?n(t):t,r.memoizedState=r.baseState=t,e={pending:null,interleaved:null,lanes:0,dispatch:null,lastRenderedReducer:e,lastRenderedState:t},r.queue=e,e=e.dispatch=OS.bind(null,ke,e),[r.memoizedState,e]},useRef:function(e){var t=Yt();return e={current:e},t.memoizedState=e},useState:Fp,useDebugValue:Mh,useDeferredValue:function(e){return Yt().memoizedState=e},useTransition:function(){var e=Fp(!1),t=e[0];return e=RS.bind(null,e[1]),Yt().memoizedState=e,[t,e]},useMutableSource:function(){},useSyncExternalStore:function(e,t,n){var r=ke,i=Yt();if(ve){if(n===void 0)throw Error(j(407));n=n()}else{if(n=t(),De===null)throw Error(j(349));Mr&30||vv(r,t,n)}i.memoizedState=n;var s={value:n,getSnapshot:t};return i.queue=s,$p(wv.bind(null,r,s,e),[e]),r.flags|=2048,io(9,xv.bind(null,r,s,n,t),void 0,null),n},useId:function(){var e=Yt(),t=De.identifierPrefix;if(ve){var n=vn,r=yn;n=(r&~(1<<32-Ht(r)-1)).toString(32)+n,t=":"+t+"R"+n,n=no++,0<n&&(t+="H"+n.toString(32)),t+=":"}else n=AS++,t=":"+t+"r"+n.toString(32)+":";return e.memoizedState=t},unstable_isNewReconciler:!1},IS={readContext:It,useCallback:Pv,useContext:It,useEffect:Lh,useImperativeHandle:Tv,useInsertionEffect:_v,useLayoutEffect:Cv,useMemo:Av,useReducer:Au,useRef:Sv,useState:function(){return Au(ro)},useDebugValue:Mh,useDeferredValue:function(e){var t=Dt();return Rv(t,Ne.memoizedState,e)},useTransition:function(){var e=Au(ro)[0],t=Dt().memoizedState;return[e,t]},useMutableSource:gv,useSyncExternalStore:yv,useId:Ov,unstable_isNewReconciler:!1},DS={readContext:It,useCallback:Pv,useContext:It,useEffect:Lh,useImperativeHandle:Tv,useInsertionEffect:_v,useLayoutEffect:Cv,useMemo:Av,useReducer:Ru,useRef:Sv,useState:function(){return Ru(ro)},useDebugValue:Mh,useDeferredValue:function(e){var t=Dt();return Ne===null?t.memoizedState=e:Rv(t,Ne.memoizedState,e)},useTransition:function(){var e=Ru(ro)[0],t=Dt().memoizedState;return[e,t]},useMutableSource:gv,useSyncExternalStore:yv,useId:Ov,unstable_isNewReconciler:!1};function Ut(e,t){if(e&&e.defaultProps){t=Se({},t),e=e.defaultProps;for(var n in e)t[n]===void 0&&(t[n]=e[n]);return t}return t}function Jc(e,t,n,r){t=e.memoizedState,n=n(r,t),n=n==null?t:Se({},t,n),e.memoizedState=n,e.lanes===0&&(e.updateQueue.baseState=n)}var jl={isMounted:function(e){return(e=e._reactInternals)?Vr(e)===e:!1},enqueueSetState:function(e,t,n){e=e._reactInternals;var r=et(),i=Xn(e),s=wn(r,i);s.payload=t,n!=null&&(s.callback=n),t=Jn(e,s,i),t!==null&&(Wt(t,e,i,r),ba(t,e,i))},enqueueReplaceState:function(e,t,n){e=e._reactInternals;var r=et(),i=Xn(e),s=wn(r,i);s.tag=1,s.payload=t,n!=null&&(s.callback=n),t=Jn(e,s,i),t!==null&&(Wt(t,e,i,r),ba(t,e,i))},enqueueForceUpdate:function(e,t){e=e._reactInternals;var n=et(),r=Xn(e),i=wn(n,r);i.tag=2,t!=null&&(i.callback=t),t=Jn(e,i,r),t!==null&&(Wt(t,e,r,n),ba(t,e,r))}};function Up(e,t,n,r,i,s,o){return e=e.stateNode,typeof e.shouldComponentUpdate=="function"?e.shouldComponentUpdate(r,s,o):t.prototype&&t.prototype.isPureReactComponent?!Qs(n,r)||!Qs(i,s):!0}function Dv(e,t,n){var r=!1,i=rr,s=t.contextType;return typeof s=="object"&&s!==null?s=It(s):(i=lt(t)?Dr:Ke.current,r=t.contextTypes,s=(r=r!=null)?ji(e,i):rr),t=new t(n,s),e.memoizedState=t.state!==null&&t.state!==void 0?t.state:null,t.updater=jl,e.stateNode=t,t._reactInternals=e,r&&(e=e.stateNode,e.__reactInternalMemoizedUnmaskedChildContext=i,e.__reactInternalMemoizedMaskedChildContext=s),t}function Vp(e,t,n,r){e=t.state,typeof t.componentWillReceiveProps=="function"&&t.componentWillReceiveProps(n,r),typeof t.UNSAFE_componentWillReceiveProps=="function"&&t.UNSAFE_componentWillReceiveProps(n,r),t.state!==e&&jl.enqueueReplaceState(t,t.state,null)}function Qc(e,t,n,r){var i=e.stateNode;i.props=n,i.state=e.memoizedState,i.refs={},Ah(e);var s=t.contextType;typeof s=="object"&&s!==null?i.context=It(s):(s=lt(t)?Dr:Ke.current,i.context=ji(e,s)),i.state=e.memoizedState,s=t.getDerivedStateFromProps,typeof s=="function"&&(Jc(e,t,s,n),i.state=e.memoizedState),typeof t.getDerivedStateFromProps=="function"||typeof i.getSnapshotBeforeUpdate=="function"||typeof i.UNSAFE_componentWillMount!="function"&&typeof i.componentWillMount!="function"||(t=i.state,typeof i.componentWillMount=="function"&&i.componentWillMount(),typeof i.UNSAFE_componentWillMount=="function"&&i.UNSAFE_componentWillMount(),t!==i.state&&jl.enqueueReplaceState(i,i.state,null),Qa(e,n,i,r),i.state=e.memoizedState),typeof i.componentDidMount=="function"&&(e.flags|=4194308)}function Mi(e,t){try{var n="",r=t;do n+=ub(r),r=r.return;while(r);var i=n}catch(s){i=`
Error generating stack: `+s.message+`
`+s.stack}return{value:e,source:t,stack:i,digest:null}}function Ou(e,t,n){return{value:e,source:null,stack:n??null,digest:t??null}}function Xc(e,t){try{console.error(t.value)}catch(n){setTimeout(function(){throw n})}}var LS=typeof WeakMap=="function"?WeakMap:Map;function Lv(e,t,n){n=wn(-1,n),n.tag=3,n.payload={element:null};var r=t.value;return n.callback=function(){tl||(tl=!0,ad=r),Xc(e,t)},n}function Mv(e,t,n){n=wn(-1,n),n.tag=3;var r=e.type.getDerivedStateFromError;if(typeof r=="function"){var i=t.value;n.payload=function(){return r(i)},n.callback=function(){Xc(e,t)}}var s=e.stateNode;return s!==null&&typeof s.componentDidCatch=="function"&&(n.callback=function(){Xc(e,t),typeof r!="function"&&(Qn===null?Qn=new Set([this]):Qn.add(this));var o=t.stack;this.componentDidCatch(t.value,{componentStack:o!==null?o:""})}),n}function zp(e,t,n){var r=e.pingCache;if(r===null){r=e.pingCache=new LS;var i=new Set;r.set(t,i)}else i=r.get(t),i===void 0&&(i=new Set,r.set(t,i));i.has(n)||(i.add(n),e=QS.bind(null,e,t,n),t.then(e,e))}function qp(e){do{var t;if((t=e.tag===13)&&(t=e.memoizedState,t=t!==null?t.dehydrated!==null:!0),t)return e;e=e.return}while(e!==null);return null}function Hp(e,t,n,r,i){return e.mode&1?(e.flags|=65536,e.lanes=i,e):(e===t?e.flags|=65536:(e.flags|=128,n.flags|=131072,n.flags&=-52805,n.tag===1&&(n.alternate===null?n.tag=17:(t=wn(-1,1),t.tag=2,Jn(n,t,1))),n.lanes|=1),e)}var MS=Pn.ReactCurrentOwner,ot=!1;function Ye(e,t,n,r){t.child=e===null?hv(t,null,n,r):Di(t,e.child,n,r)}function Wp(e,t,n,r,i){n=n.render;var s=t.ref;return Pi(t,i),r=Ih(e,t,n,r,s,i),n=Dh(),e!==null&&!ot?(t.updateQueue=e.updateQueue,t.flags&=-2053,e.lanes&=~i,En(e,t,i)):(ve&&n&&bh(t),t.flags|=1,Ye(e,t,r,i),t.child)}function Gp(e,t,n,r,i){if(e===null){var s=n.type;return typeof s=="function"&&!Hh(s)&&s.defaultProps===void 0&&n.compare===null&&n.defaultProps===void 0?(t.tag=15,t.type=s,Bv(e,t,s,r,i)):(e=Pa(n.type,null,r,t,t.mode,i),e.ref=t.ref,e.return=t,t.child=e)}if(s=e.child,!(e.lanes&i)){var o=s.memoizedProps;if(n=n.compare,n=n!==null?n:Qs,n(o,r)&&e.ref===t.ref)return En(e,t,i)}return t.flags|=1,e=Yn(s,r),e.ref=t.ref,e.return=t,t.child=e}function Bv(e,t,n,r,i){if(e!==null){var s=e.memoizedProps;if(Qs(s,r)&&e.ref===t.ref)if(ot=!1,t.pendingProps=r=s,(e.lanes&i)!==0)e.flags&131072&&(ot=!0);else return t.lanes=e.lanes,En(e,t,i)}return Yc(e,t,n,r,i)}function Fv(e,t,n){var r=t.pendingProps,i=r.children,s=e!==null?e.memoizedState:null;if(r.mode==="hidden")if(!(t.mode&1))t.memoizedState={baseLanes:0,cachePool:null,transitions:null},pe(vi,mt),mt|=n;else{if(!(n&1073741824))return e=s!==null?s.baseLanes|n:n,t.lanes=t.childLanes=1073741824,t.memoizedState={baseLanes:e,cachePool:null,transitions:null},t.updateQueue=null,pe(vi,mt),mt|=e,null;t.memoizedState={baseLanes:0,cachePool:null,transitions:null},r=s!==null?s.baseLanes:n,pe(vi,mt),mt|=r}else s!==null?(r=s.baseLanes|n,t.memoizedState=null):r=n,pe(vi,mt),mt|=r;return Ye(e,t,i,n),t.child}function $v(e,t){var n=t.ref;(e===null&&n!==null||e!==null&&e.ref!==n)&&(t.flags|=512,t.flags|=2097152)}function Yc(e,t,n,r,i){var s=lt(n)?Dr:Ke.current;return s=ji(t,s),Pi(t,i),n=Ih(e,t,n,r,s,i),r=Dh(),e!==null&&!ot?(t.updateQueue=e.updateQueue,t.flags&=-2053,e.lanes&=~i,En(e,t,i)):(ve&&r&&bh(t),t.flags|=1,Ye(e,t,n,i),t.child)}function Kp(e,t,n,r,i){if(lt(n)){var s=!0;Ha(t)}else s=!1;if(Pi(t,i),t.stateNode===null)Ca(e,t),Dv(t,n,r),Qc(t,n,r,i),r=!0;else if(e===null){var o=t.stateNode,a=t.memoizedProps;o.props=a;var l=o.context,u=n.contextType;typeof u=="object"&&u!==null?u=It(u):(u=lt(n)?Dr:Ke.current,u=ji(t,u));var c=n.getDerivedStateFromProps,d=typeof c=="function"||typeof o.getSnapshotBeforeUpdate=="function";d||typeof o.UNSAFE_componentWillReceiveProps!="function"&&typeof o.componentWillReceiveProps!="function"||(a!==r||l!==u)&&Vp(t,o,r,u),Ln=!1;var h=t.memoizedState;o.state=h,Qa(t,r,o,i),l=t.memoizedState,a!==r||h!==l||at.current||Ln?(typeof c=="function"&&(Jc(t,n,c,r),l=t.memoizedState),(a=Ln||Up(t,n,a,r,h,l,u))?(d||typeof o.UNSAFE_componentWillMount!="function"&&typeof o.componentWillMount!="function"||(typeof o.componentWillMount=="function"&&o.componentWillMount(),typeof o.UNSAFE_componentWillMount=="function"&&o.UNSAFE_componentWillMount()),typeof o.componentDidMount=="function"&&(t.flags|=4194308)):(typeof o.componentDidMount=="function"&&(t.flags|=4194308),t.memoizedProps=r,t.memoizedState=l),o.props=r,o.state=l,o.context=u,r=a):(typeof o.componentDidMount=="function"&&(t.flags|=4194308),r=!1)}else{o=t.stateNode,pv(e,t),a=t.memoizedProps,u=t.type===t.elementType?a:Ut(t.type,a),o.props=u,d=t.pendingProps,h=o.context,l=n.contextType,typeof l=="object"&&l!==null?l=It(l):(l=lt(n)?Dr:Ke.current,l=ji(t,l));var f=n.getDerivedStateFromProps;(c=typeof f=="function"||typeof o.getSnapshotBeforeUpdate=="function")||typeof o.UNSAFE_componentWillReceiveProps!="function"&&typeof o.componentWillReceiveProps!="function"||(a!==d||h!==l)&&Vp(t,o,r,l),Ln=!1,h=t.memoizedState,o.state=h,Qa(t,r,o,i);var p=t.memoizedState;a!==d||h!==p||at.current||Ln?(typeof f=="function"&&(Jc(t,n,f,r),p=t.memoizedState),(u=Ln||Up(t,n,u,r,h,p,l)||!1)?(c||typeof o.UNSAFE_componentWillUpdate!="function"&&typeof o.componentWillUpdate!="function"||(typeof o.componentWillUpdate=="function"&&o.componentWillUpdate(r,p,l),typeof o.UNSAFE_componentWillUpdate=="function"&&o.UNSAFE_componentWillUpdate(r,p,l)),typeof o.componentDidUpdate=="function"&&(t.flags|=4),typeof o.getSnapshotBeforeUpdate=="function"&&(t.flags|=1024)):(typeof o.componentDidUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=4),typeof o.getSnapshotBeforeUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=1024),t.memoizedProps=r,t.memoizedState=p),o.props=r,o.state=p,o.context=l,r=u):(typeof o.componentDidUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=4),typeof o.getSnapshotBeforeUpdate!="function"||a===e.memoizedProps&&h===e.memoizedState||(t.flags|=1024),r=!1)}return Zc(e,t,n,r,s,i)}function Zc(e,t,n,r,i,s){$v(e,t);var o=(t.flags&128)!==0;if(!r&&!o)return i&&jp(t,n,!1),En(e,t,s);r=t.stateNode,MS.current=t;var a=o&&typeof n.getDerivedStateFromError!="function"?null:r.render();return t.flags|=1,e!==null&&o?(t.child=Di(t,e.child,null,s),t.child=Di(t,null,a,s)):Ye(e,t,a,s),t.memoizedState=r.state,i&&jp(t,n,!0),t.child}function Uv(e){var t=e.stateNode;t.pendingContext?Np(e,t.pendingContext,t.pendingContext!==t.context):t.context&&Np(e,t.context,!1),Rh(e,t.containerInfo)}function Jp(e,t,n,r,i){return Ii(),_h(i),t.flags|=256,Ye(e,t,n,r),t.child}var ed={dehydrated:null,treeContext:null,retryLane:0};function td(e){return{baseLanes:e,cachePool:null,transitions:null}}function Vv(e,t,n){var r=t.pendingProps,i=xe.current,s=!1,o=(t.flags&128)!==0,a;if((a=o)||(a=e!==null&&e.memoizedState===null?!1:(i&2)!==0),a?(s=!0,t.flags&=-129):(e===null||e.memoizedState!==null)&&(i|=1),pe(xe,i&1),e===null)return Gc(t),e=t.memoizedState,e!==null&&(e=e.dehydrated,e!==null)?(t.mode&1?e.data==="$!"?t.lanes=8:t.lanes=1073741824:t.lanes=1,null):(o=r.children,e=r.fallback,s?(r=t.mode,s=t.child,o={mode:"hidden",children:o},!(r&1)&&s!==null?(s.childLanes=0,s.pendingProps=o):s=Ll(o,r,0,null),e=Nr(e,r,n,null),s.return=t,e.return=t,s.sibling=e,t.child=s,t.child.memoizedState=td(n),t.memoizedState=ed,e):Bh(t,o));if(i=e.memoizedState,i!==null&&(a=i.dehydrated,a!==null))return BS(e,t,o,r,a,i,n);if(s){s=r.fallback,o=t.mode,i=e.child,a=i.sibling;var l={mode:"hidden",children:r.children};return!(o&1)&&t.child!==i?(r=t.child,r.childLanes=0,r.pendingProps=l,t.deletions=null):(r=Yn(i,l),r.subtreeFlags=i.subtreeFlags&14680064),a!==null?s=Yn(a,s):(s=Nr(s,o,n,null),s.flags|=2),s.return=t,r.return=t,r.sibling=s,t.child=r,r=s,s=t.child,o=e.child.memoizedState,o=o===null?td(n):{baseLanes:o.baseLanes|n,cachePool:null,transitions:o.transitions},s.memoizedState=o,s.childLanes=e.childLanes&~n,t.memoizedState=ed,r}return s=e.child,e=s.sibling,r=Yn(s,{mode:"visible",children:r.children}),!(t.mode&1)&&(r.lanes=n),r.return=t,r.sibling=null,e!==null&&(n=t.deletions,n===null?(t.deletions=[e],t.flags|=16):n.push(e)),t.child=r,t.memoizedState=null,r}function Bh(e,t){return t=Ll({mode:"visible",children:t},e.mode,0,null),t.return=e,e.child=t}function Jo(e,t,n,r){return r!==null&&_h(r),Di(t,e.child,null,n),e=Bh(t,t.pendingProps.children),e.flags|=2,t.memoizedState=null,e}function BS(e,t,n,r,i,s,o){if(n)return t.flags&256?(t.flags&=-257,r=Ou(Error(j(422))),Jo(e,t,o,r)):t.memoizedState!==null?(t.child=e.child,t.flags|=128,null):(s=r.fallback,i=t.mode,r=Ll({mode:"visible",children:r.children},i,0,null),s=Nr(s,i,o,null),s.flags|=2,r.return=t,s.return=t,r.sibling=s,t.child=r,t.mode&1&&Di(t,e.child,null,o),t.child.memoizedState=td(o),t.memoizedState=ed,s);if(!(t.mode&1))return Jo(e,t,o,null);if(i.data==="$!"){if(r=i.nextSibling&&i.nextSibling.dataset,r)var a=r.dgst;return r=a,s=Error(j(419)),r=Ou(s,r,void 0),Jo(e,t,o,r)}if(a=(o&e.childLanes)!==0,ot||a){if(r=De,r!==null){switch(o&-o){case 4:i=2;break;case 16:i=8;break;case 64:case 128:case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:case 4194304:case 8388608:case 16777216:case 33554432:case 67108864:i=32;break;case 536870912:i=268435456;break;default:i=0}i=i&(r.suspendedLanes|o)?0:i,i!==0&&i!==s.retryLane&&(s.retryLane=i,Cn(e,i),Wt(r,e,i,-1))}return qh(),r=Ou(Error(j(421))),Jo(e,t,o,r)}return i.data==="$?"?(t.flags|=128,t.child=e.child,t=XS.bind(null,e),i._reactRetry=t,null):(e=s.treeContext,vt=Kn(i.nextSibling),xt=t,ve=!0,qt=null,e!==null&&(At[Rt++]=yn,At[Rt++]=vn,At[Rt++]=Lr,yn=e.id,vn=e.overflow,Lr=t),t=Bh(t,r.children),t.flags|=4096,t)}function Qp(e,t,n){e.lanes|=t;var r=e.alternate;r!==null&&(r.lanes|=t),Kc(e.return,t,n)}function Nu(e,t,n,r,i){var s=e.memoizedState;s===null?e.memoizedState={isBackwards:t,rendering:null,renderingStartTime:0,last:r,tail:n,tailMode:i}:(s.isBackwards=t,s.rendering=null,s.renderingStartTime=0,s.last=r,s.tail=n,s.tailMode=i)}function zv(e,t,n){var r=t.pendingProps,i=r.revealOrder,s=r.tail;if(Ye(e,t,r.children,n),r=xe.current,r&2)r=r&1|2,t.flags|=128;else{if(e!==null&&e.flags&128)e:for(e=t.child;e!==null;){if(e.tag===13)e.memoizedState!==null&&Qp(e,n,t);else if(e.tag===19)Qp(e,n,t);else if(e.child!==null){e.child.return=e,e=e.child;continue}if(e===t)break e;for(;e.sibling===null;){if(e.return===null||e.return===t)break e;e=e.return}e.sibling.return=e.return,e=e.sibling}r&=1}if(pe(xe,r),!(t.mode&1))t.memoizedState=null;else switch(i){case"forwards":for(n=t.child,i=null;n!==null;)e=n.alternate,e!==null&&Xa(e)===null&&(i=n),n=n.sibling;n=i,n===null?(i=t.child,t.child=null):(i=n.sibling,n.sibling=null),Nu(t,!1,i,n,s);break;case"backwards":for(n=null,i=t.child,t.child=null;i!==null;){if(e=i.alternate,e!==null&&Xa(e)===null){t.child=i;break}e=i.sibling,i.sibling=n,n=i,i=e}Nu(t,!0,n,null,s);break;case"together":Nu(t,!1,null,null,void 0);break;default:t.memoizedState=null}return t.child}function Ca(e,t){!(t.mode&1)&&e!==null&&(e.alternate=null,t.alternate=null,t.flags|=2)}function En(e,t,n){if(e!==null&&(t.dependencies=e.dependencies),Br|=t.lanes,!(n&t.childLanes))return null;if(e!==null&&t.child!==e.child)throw Error(j(153));if(t.child!==null){for(e=t.child,n=Yn(e,e.pendingProps),t.child=n,n.return=t;e.sibling!==null;)e=e.sibling,n=n.sibling=Yn(e,e.pendingProps),n.return=t;n.sibling=null}return t.child}function FS(e,t,n){switch(t.tag){case 3:Uv(t),Ii();break;case 5:mv(t);break;case 1:lt(t.type)&&Ha(t);break;case 4:Rh(t,t.stateNode.containerInfo);break;case 10:var r=t.type._context,i=t.memoizedProps.value;pe(Ka,r._currentValue),r._currentValue=i;break;case 13:if(r=t.memoizedState,r!==null)return r.dehydrated!==null?(pe(xe,xe.current&1),t.flags|=128,null):n&t.child.childLanes?Vv(e,t,n):(pe(xe,xe.current&1),e=En(e,t,n),e!==null?e.sibling:null);pe(xe,xe.current&1);break;case 19:if(r=(n&t.childLanes)!==0,e.flags&128){if(r)return zv(e,t,n);t.flags|=128}if(i=t.memoizedState,i!==null&&(i.rendering=null,i.tail=null,i.lastEffect=null),pe(xe,xe.current),r)break;return null;case 22:case 23:return t.lanes=0,Fv(e,t,n)}return En(e,t,n)}var qv,nd,Hv,Wv;qv=function(e,t){for(var n=t.child;n!==null;){if(n.tag===5||n.tag===6)e.appendChild(n.stateNode);else if(n.tag!==4&&n.child!==null){n.child.return=n,n=n.child;continue}if(n===t)break;for(;n.sibling===null;){if(n.return===null||n.return===t)return;n=n.return}n.sibling.return=n.return,n=n.sibling}};nd=function(){};Hv=function(e,t,n,r){var i=e.memoizedProps;if(i!==r){e=t.stateNode,Pr(on.current);var s=null;switch(n){case"input":i=_c(e,i),r=_c(e,r),s=[];break;case"select":i=Se({},i,{value:void 0}),r=Se({},r,{value:void 0}),s=[];break;case"textarea":i=Tc(e,i),r=Tc(e,r),s=[];break;default:typeof i.onClick!="function"&&typeof r.onClick=="function"&&(e.onclick=za)}Ac(n,r);var o;n=null;for(u in i)if(!r.hasOwnProperty(u)&&i.hasOwnProperty(u)&&i[u]!=null)if(u==="style"){var a=i[u];for(o in a)a.hasOwnProperty(o)&&(n||(n={}),n[o]="")}else u!=="dangerouslySetInnerHTML"&&u!=="children"&&u!=="suppressContentEditableWarning"&&u!=="suppressHydrationWarning"&&u!=="autoFocus"&&(zs.hasOwnProperty(u)?s||(s=[]):(s=s||[]).push(u,null));for(u in r){var l=r[u];if(a=i!=null?i[u]:void 0,r.hasOwnProperty(u)&&l!==a&&(l!=null||a!=null))if(u==="style")if(a){for(o in a)!a.hasOwnProperty(o)||l&&l.hasOwnProperty(o)||(n||(n={}),n[o]="");for(o in l)l.hasOwnProperty(o)&&a[o]!==l[o]&&(n||(n={}),n[o]=l[o])}else n||(s||(s=[]),s.push(u,n)),n=l;else u==="dangerouslySetInnerHTML"?(l=l?l.__html:void 0,a=a?a.__html:void 0,l!=null&&a!==l&&(s=s||[]).push(u,l)):u==="children"?typeof l!="string"&&typeof l!="number"||(s=s||[]).push(u,""+l):u!=="suppressContentEditableWarning"&&u!=="suppressHydrationWarning"&&(zs.hasOwnProperty(u)?(l!=null&&u==="onScroll"&&ge("scroll",e),s||a===l||(s=[])):(s=s||[]).push(u,l))}n&&(s=s||[]).push("style",n);var u=s;(t.updateQueue=u)&&(t.flags|=4)}};Wv=function(e,t,n,r){n!==r&&(t.flags|=4)};function os(e,t){if(!ve)switch(e.tailMode){case"hidden":t=e.tail;for(var n=null;t!==null;)t.alternate!==null&&(n=t),t=t.sibling;n===null?e.tail=null:n.sibling=null;break;case"collapsed":n=e.tail;for(var r=null;n!==null;)n.alternate!==null&&(r=n),n=n.sibling;r===null?t||e.tail===null?e.tail=null:e.tail.sibling=null:r.sibling=null}}function ze(e){var t=e.alternate!==null&&e.alternate.child===e.child,n=0,r=0;if(t)for(var i=e.child;i!==null;)n|=i.lanes|i.childLanes,r|=i.subtreeFlags&14680064,r|=i.flags&14680064,i.return=e,i=i.sibling;else for(i=e.child;i!==null;)n|=i.lanes|i.childLanes,r|=i.subtreeFlags,r|=i.flags,i.return=e,i=i.sibling;return e.subtreeFlags|=r,e.childLanes=n,t}function $S(e,t,n){var r=t.pendingProps;switch(Sh(t),t.tag){case 2:case 16:case 15:case 0:case 11:case 7:case 8:case 12:case 9:case 14:return ze(t),null;case 1:return lt(t.type)&&qa(),ze(t),null;case 3:return r=t.stateNode,Li(),ye(at),ye(Ke),Nh(),r.pendingContext&&(r.context=r.pendingContext,r.pendingContext=null),(e===null||e.child===null)&&(Go(t)?t.flags|=4:e===null||e.memoizedState.isDehydrated&&!(t.flags&256)||(t.flags|=1024,qt!==null&&(cd(qt),qt=null))),nd(e,t),ze(t),null;case 5:Oh(t);var i=Pr(to.current);if(n=t.type,e!==null&&t.stateNode!=null)Hv(e,t,n,r,i),e.ref!==t.ref&&(t.flags|=512,t.flags|=2097152);else{if(!r){if(t.stateNode===null)throw Error(j(166));return ze(t),null}if(e=Pr(on.current),Go(t)){r=t.stateNode,n=t.type;var s=t.memoizedProps;switch(r[nn]=t,r[Zs]=s,e=(t.mode&1)!==0,n){case"dialog":ge("cancel",r),ge("close",r);break;case"iframe":case"object":case"embed":ge("load",r);break;case"video":case"audio":for(i=0;i<ys.length;i++)ge(ys[i],r);break;case"source":ge("error",r);break;case"img":case"image":case"link":ge("error",r),ge("load",r);break;case"details":ge("toggle",r);break;case"input":sp(r,s),ge("invalid",r);break;case"select":r._wrapperState={wasMultiple:!!s.multiple},ge("invalid",r);break;case"textarea":ap(r,s),ge("invalid",r)}Ac(n,s),i=null;for(var o in s)if(s.hasOwnProperty(o)){var a=s[o];o==="children"?typeof a=="string"?r.textContent!==a&&(s.suppressHydrationWarning!==!0&&Wo(r.textContent,a,e),i=["children",a]):typeof a=="number"&&r.textContent!==""+a&&(s.suppressHydrationWarning!==!0&&Wo(r.textContent,a,e),i=["children",""+a]):zs.hasOwnProperty(o)&&a!=null&&o==="onScroll"&&ge("scroll",r)}switch(n){case"input":Bo(r),op(r,s,!0);break;case"textarea":Bo(r),lp(r);break;case"select":case"option":break;default:typeof s.onClick=="function"&&(r.onclick=za)}r=i,t.updateQueue=r,r!==null&&(t.flags|=4)}else{o=i.nodeType===9?i:i.ownerDocument,e==="http://www.w3.org/1999/xhtml"&&(e=w0(n)),e==="http://www.w3.org/1999/xhtml"?n==="script"?(e=o.createElement("div"),e.innerHTML="<script><\/script>",e=e.removeChild(e.firstChild)):typeof r.is=="string"?e=o.createElement(n,{is:r.is}):(e=o.createElement(n),n==="select"&&(o=e,r.multiple?o.multiple=!0:r.size&&(o.size=r.size))):e=o.createElementNS(e,n),e[nn]=t,e[Zs]=r,qv(e,t,!1,!1),t.stateNode=e;e:{switch(o=Rc(n,r),n){case"dialog":ge("cancel",e),ge("close",e),i=r;break;case"iframe":case"object":case"embed":ge("load",e),i=r;break;case"video":case"audio":for(i=0;i<ys.length;i++)ge(ys[i],e);i=r;break;case"source":ge("error",e),i=r;break;case"img":case"image":case"link":ge("error",e),ge("load",e),i=r;break;case"details":ge("toggle",e),i=r;break;case"input":sp(e,r),i=_c(e,r),ge("invalid",e);break;case"option":i=r;break;case"select":e._wrapperState={wasMultiple:!!r.multiple},i=Se({},r,{value:void 0}),ge("invalid",e);break;case"textarea":ap(e,r),i=Tc(e,r),ge("invalid",e);break;default:i=r}Ac(n,i),a=i;for(s in a)if(a.hasOwnProperty(s)){var l=a[s];s==="style"?S0(e,l):s==="dangerouslySetInnerHTML"?(l=l?l.__html:void 0,l!=null&&k0(e,l)):s==="children"?typeof l=="string"?(n!=="textarea"||l!=="")&&qs(e,l):typeof l=="number"&&qs(e,""+l):s!=="suppressContentEditableWarning"&&s!=="suppressHydrationWarning"&&s!=="autoFocus"&&(zs.hasOwnProperty(s)?l!=null&&s==="onScroll"&&ge("scroll",e):l!=null&&lh(e,s,l,o))}switch(n){case"input":Bo(e),op(e,r,!1);break;case"textarea":Bo(e),lp(e);break;case"option":r.value!=null&&e.setAttribute("value",""+nr(r.value));break;case"select":e.multiple=!!r.multiple,s=r.value,s!=null?_i(e,!!r.multiple,s,!1):r.defaultValue!=null&&_i(e,!!r.multiple,r.defaultValue,!0);break;default:typeof i.onClick=="function"&&(e.onclick=za)}switch(n){case"button":case"input":case"select":case"textarea":r=!!r.autoFocus;break e;case"img":r=!0;break e;default:r=!1}}r&&(t.flags|=4)}t.ref!==null&&(t.flags|=512,t.flags|=2097152)}return ze(t),null;case 6:if(e&&t.stateNode!=null)Wv(e,t,e.memoizedProps,r);else{if(typeof r!="string"&&t.stateNode===null)throw Error(j(166));if(n=Pr(to.current),Pr(on.current),Go(t)){if(r=t.stateNode,n=t.memoizedProps,r[nn]=t,(s=r.nodeValue!==n)&&(e=xt,e!==null))switch(e.tag){case 3:Wo(r.nodeValue,n,(e.mode&1)!==0);break;case 5:e.memoizedProps.suppressHydrationWarning!==!0&&Wo(r.nodeValue,n,(e.mode&1)!==0)}s&&(t.flags|=4)}else r=(n.nodeType===9?n:n.ownerDocument).createTextNode(r),r[nn]=t,t.stateNode=r}return ze(t),null;case 13:if(ye(xe),r=t.memoizedState,e===null||e.memoizedState!==null&&e.memoizedState.dehydrated!==null){if(ve&&vt!==null&&t.mode&1&&!(t.flags&128))cv(),Ii(),t.flags|=98560,s=!1;else if(s=Go(t),r!==null&&r.dehydrated!==null){if(e===null){if(!s)throw Error(j(318));if(s=t.memoizedState,s=s!==null?s.dehydrated:null,!s)throw Error(j(317));s[nn]=t}else Ii(),!(t.flags&128)&&(t.memoizedState=null),t.flags|=4;ze(t),s=!1}else qt!==null&&(cd(qt),qt=null),s=!0;if(!s)return t.flags&65536?t:null}return t.flags&128?(t.lanes=n,t):(r=r!==null,r!==(e!==null&&e.memoizedState!==null)&&r&&(t.child.flags|=8192,t.mode&1&&(e===null||xe.current&1?je===0&&(je=3):qh())),t.updateQueue!==null&&(t.flags|=4),ze(t),null);case 4:return Li(),nd(e,t),e===null&&Xs(t.stateNode.containerInfo),ze(t),null;case 10:return Th(t.type._context),ze(t),null;case 17:return lt(t.type)&&qa(),ze(t),null;case 19:if(ye(xe),s=t.memoizedState,s===null)return ze(t),null;if(r=(t.flags&128)!==0,o=s.rendering,o===null)if(r)os(s,!1);else{if(je!==0||e!==null&&e.flags&128)for(e=t.child;e!==null;){if(o=Xa(e),o!==null){for(t.flags|=128,os(s,!1),r=o.updateQueue,r!==null&&(t.updateQueue=r,t.flags|=4),t.subtreeFlags=0,r=n,n=t.child;n!==null;)s=n,e=r,s.flags&=14680066,o=s.alternate,o===null?(s.childLanes=0,s.lanes=e,s.child=null,s.subtreeFlags=0,s.memoizedProps=null,s.memoizedState=null,s.updateQueue=null,s.dependencies=null,s.stateNode=null):(s.childLanes=o.childLanes,s.lanes=o.lanes,s.child=o.child,s.subtreeFlags=0,s.deletions=null,s.memoizedProps=o.memoizedProps,s.memoizedState=o.memoizedState,s.updateQueue=o.updateQueue,s.type=o.type,e=o.dependencies,s.dependencies=e===null?null:{lanes:e.lanes,firstContext:e.firstContext}),n=n.sibling;return pe(xe,xe.current&1|2),t.child}e=e.sibling}s.tail!==null&&Ee()>Bi&&(t.flags|=128,r=!0,os(s,!1),t.lanes=4194304)}else{if(!r)if(e=Xa(o),e!==null){if(t.flags|=128,r=!0,n=e.updateQueue,n!==null&&(t.updateQueue=n,t.flags|=4),os(s,!0),s.tail===null&&s.tailMode==="hidden"&&!o.alternate&&!ve)return ze(t),null}else 2*Ee()-s.renderingStartTime>Bi&&n!==1073741824&&(t.flags|=128,r=!0,os(s,!1),t.lanes=4194304);s.isBackwards?(o.sibling=t.child,t.child=o):(n=s.last,n!==null?n.sibling=o:t.child=o,s.last=o)}return s.tail!==null?(t=s.tail,s.rendering=t,s.tail=t.sibling,s.renderingStartTime=Ee(),t.sibling=null,n=xe.current,pe(xe,r?n&1|2:n&1),t):(ze(t),null);case 22:case 23:return zh(),r=t.memoizedState!==null,e!==null&&e.memoizedState!==null!==r&&(t.flags|=8192),r&&t.mode&1?mt&1073741824&&(ze(t),t.subtreeFlags&6&&(t.flags|=8192)):ze(t),null;case 24:return null;case 25:return null}throw Error(j(156,t.tag))}function US(e,t){switch(Sh(t),t.tag){case 1:return lt(t.type)&&qa(),e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 3:return Li(),ye(at),ye(Ke),Nh(),e=t.flags,e&65536&&!(e&128)?(t.flags=e&-65537|128,t):null;case 5:return Oh(t),null;case 13:if(ye(xe),e=t.memoizedState,e!==null&&e.dehydrated!==null){if(t.alternate===null)throw Error(j(340));Ii()}return e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 19:return ye(xe),null;case 4:return Li(),null;case 10:return Th(t.type._context),null;case 22:case 23:return zh(),null;case 24:return null;default:return null}}var Qo=!1,He=!1,VS=typeof WeakSet=="function"?WeakSet:Set,V=null;function yi(e,t){var n=e.ref;if(n!==null)if(typeof n=="function")try{n(null)}catch(r){Ce(e,t,r)}else n.current=null}function rd(e,t,n){try{n()}catch(r){Ce(e,t,r)}}var Xp=!1;function zS(e,t){if($c=$a,e=X0(),kh(e)){if("selectionStart"in e)var n={start:e.selectionStart,end:e.selectionEnd};else e:{n=(n=e.ownerDocument)&&n.defaultView||window;var r=n.getSelection&&n.getSelection();if(r&&r.rangeCount!==0){n=r.anchorNode;var i=r.anchorOffset,s=r.focusNode;r=r.focusOffset;try{n.nodeType,s.nodeType}catch{n=null;break e}var o=0,a=-1,l=-1,u=0,c=0,d=e,h=null;t:for(;;){for(var f;d!==n||i!==0&&d.nodeType!==3||(a=o+i),d!==s||r!==0&&d.nodeType!==3||(l=o+r),d.nodeType===3&&(o+=d.nodeValue.length),(f=d.firstChild)!==null;)h=d,d=f;for(;;){if(d===e)break t;if(h===n&&++u===i&&(a=o),h===s&&++c===r&&(l=o),(f=d.nextSibling)!==null)break;d=h,h=d.parentNode}d=f}n=a===-1||l===-1?null:{start:a,end:l}}else n=null}n=n||{start:0,end:0}}else n=null;for(Uc={focusedElem:e,selectionRange:n},$a=!1,V=t;V!==null;)if(t=V,e=t.child,(t.subtreeFlags&1028)!==0&&e!==null)e.return=t,V=e;else for(;V!==null;){t=V;try{var p=t.alternate;if(t.flags&1024)switch(t.tag){case 0:case 11:case 15:break;case 1:if(p!==null){var v=p.memoizedProps,w=p.memoizedState,m=t.stateNode,g=m.getSnapshotBeforeUpdate(t.elementType===t.type?v:Ut(t.type,v),w);m.__reactInternalSnapshotBeforeUpdate=g}break;case 3:var y=t.stateNode.containerInfo;y.nodeType===1?y.textContent="":y.nodeType===9&&y.documentElement&&y.removeChild(y.documentElement);break;case 5:case 6:case 4:case 17:break;default:throw Error(j(163))}}catch(k){Ce(t,t.return,k)}if(e=t.sibling,e!==null){e.return=t.return,V=e;break}V=t.return}return p=Xp,Xp=!1,p}function Ps(e,t,n){var r=t.updateQueue;if(r=r!==null?r.lastEffect:null,r!==null){var i=r=r.next;do{if((i.tag&e)===e){var s=i.destroy;i.destroy=void 0,s!==void 0&&rd(t,n,s)}i=i.next}while(i!==r)}}function Il(e,t){if(t=t.updateQueue,t=t!==null?t.lastEffect:null,t!==null){var n=t=t.next;do{if((n.tag&e)===e){var r=n.create;n.destroy=r()}n=n.next}while(n!==t)}}function id(e){var t=e.ref;if(t!==null){var n=e.stateNode;switch(e.tag){case 5:e=n;break;default:e=n}typeof t=="function"?t(e):t.current=e}}function Gv(e){var t=e.alternate;t!==null&&(e.alternate=null,Gv(t)),e.child=null,e.deletions=null,e.sibling=null,e.tag===5&&(t=e.stateNode,t!==null&&(delete t[nn],delete t[Zs],delete t[qc],delete t[CS],delete t[ES])),e.stateNode=null,e.return=null,e.dependencies=null,e.memoizedProps=null,e.memoizedState=null,e.pendingProps=null,e.stateNode=null,e.updateQueue=null}function Kv(e){return e.tag===5||e.tag===3||e.tag===4}function Yp(e){e:for(;;){for(;e.sibling===null;){if(e.return===null||Kv(e.return))return null;e=e.return}for(e.sibling.return=e.return,e=e.sibling;e.tag!==5&&e.tag!==6&&e.tag!==18;){if(e.flags&2||e.child===null||e.tag===4)continue e;e.child.return=e,e=e.child}if(!(e.flags&2))return e.stateNode}}function sd(e,t,n){var r=e.tag;if(r===5||r===6)e=e.stateNode,t?n.nodeType===8?n.parentNode.insertBefore(e,t):n.insertBefore(e,t):(n.nodeType===8?(t=n.parentNode,t.insertBefore(e,n)):(t=n,t.appendChild(e)),n=n._reactRootContainer,n!=null||t.onclick!==null||(t.onclick=za));else if(r!==4&&(e=e.child,e!==null))for(sd(e,t,n),e=e.sibling;e!==null;)sd(e,t,n),e=e.sibling}function od(e,t,n){var r=e.tag;if(r===5||r===6)e=e.stateNode,t?n.insertBefore(e,t):n.appendChild(e);else if(r!==4&&(e=e.child,e!==null))for(od(e,t,n),e=e.sibling;e!==null;)od(e,t,n),e=e.sibling}var Be=null,zt=!1;function Nn(e,t,n){for(n=n.child;n!==null;)Jv(e,t,n),n=n.sibling}function Jv(e,t,n){if(sn&&typeof sn.onCommitFiberUnmount=="function")try{sn.onCommitFiberUnmount(El,n)}catch{}switch(n.tag){case 5:He||yi(n,t);case 6:var r=Be,i=zt;Be=null,Nn(e,t,n),Be=r,zt=i,Be!==null&&(zt?(e=Be,n=n.stateNode,e.nodeType===8?e.parentNode.removeChild(n):e.removeChild(n)):Be.removeChild(n.stateNode));break;case 18:Be!==null&&(zt?(e=Be,n=n.stateNode,e.nodeType===8?Cu(e.parentNode,n):e.nodeType===1&&Cu(e,n),Ks(e)):Cu(Be,n.stateNode));break;case 4:r=Be,i=zt,Be=n.stateNode.containerInfo,zt=!0,Nn(e,t,n),Be=r,zt=i;break;case 0:case 11:case 14:case 15:if(!He&&(r=n.updateQueue,r!==null&&(r=r.lastEffect,r!==null))){i=r=r.next;do{var s=i,o=s.destroy;s=s.tag,o!==void 0&&(s&2||s&4)&&rd(n,t,o),i=i.next}while(i!==r)}Nn(e,t,n);break;case 1:if(!He&&(yi(n,t),r=n.stateNode,typeof r.componentWillUnmount=="function"))try{r.props=n.memoizedProps,r.state=n.memoizedState,r.componentWillUnmount()}catch(a){Ce(n,t,a)}Nn(e,t,n);break;case 21:Nn(e,t,n);break;case 22:n.mode&1?(He=(r=He)||n.memoizedState!==null,Nn(e,t,n),He=r):Nn(e,t,n);break;default:Nn(e,t,n)}}function Zp(e){var t=e.updateQueue;if(t!==null){e.updateQueue=null;var n=e.stateNode;n===null&&(n=e.stateNode=new VS),t.forEach(function(r){var i=YS.bind(null,e,r);n.has(r)||(n.add(r),r.then(i,i))})}}function Bt(e,t){var n=t.deletions;if(n!==null)for(var r=0;r<n.length;r++){var i=n[r];try{var s=e,o=t,a=o;e:for(;a!==null;){switch(a.tag){case 5:Be=a.stateNode,zt=!1;break e;case 3:Be=a.stateNode.containerInfo,zt=!0;break e;case 4:Be=a.stateNode.containerInfo,zt=!0;break e}a=a.return}if(Be===null)throw Error(j(160));Jv(s,o,i),Be=null,zt=!1;var l=i.alternate;l!==null&&(l.return=null),i.return=null}catch(u){Ce(i,t,u)}}if(t.subtreeFlags&12854)for(t=t.child;t!==null;)Qv(t,e),t=t.sibling}function Qv(e,t){var n=e.alternate,r=e.flags;switch(e.tag){case 0:case 11:case 14:case 15:if(Bt(t,e),Qt(e),r&4){try{Ps(3,e,e.return),Il(3,e)}catch(v){Ce(e,e.return,v)}try{Ps(5,e,e.return)}catch(v){Ce(e,e.return,v)}}break;case 1:Bt(t,e),Qt(e),r&512&&n!==null&&yi(n,n.return);break;case 5:if(Bt(t,e),Qt(e),r&512&&n!==null&&yi(n,n.return),e.flags&32){var i=e.stateNode;try{qs(i,"")}catch(v){Ce(e,e.return,v)}}if(r&4&&(i=e.stateNode,i!=null)){var s=e.memoizedProps,o=n!==null?n.memoizedProps:s,a=e.type,l=e.updateQueue;if(e.updateQueue=null,l!==null)try{a==="input"&&s.type==="radio"&&s.name!=null&&v0(i,s),Rc(a,o);var u=Rc(a,s);for(o=0;o<l.length;o+=2){var c=l[o],d=l[o+1];c==="style"?S0(i,d):c==="dangerouslySetInnerHTML"?k0(i,d):c==="children"?qs(i,d):lh(i,c,d,u)}switch(a){case"input":Cc(i,s);break;case"textarea":x0(i,s);break;case"select":var h=i._wrapperState.wasMultiple;i._wrapperState.wasMultiple=!!s.multiple;var f=s.value;f!=null?_i(i,!!s.multiple,f,!1):h!==!!s.multiple&&(s.defaultValue!=null?_i(i,!!s.multiple,s.defaultValue,!0):_i(i,!!s.multiple,s.multiple?[]:"",!1))}i[Zs]=s}catch(v){Ce(e,e.return,v)}}break;case 6:if(Bt(t,e),Qt(e),r&4){if(e.stateNode===null)throw Error(j(162));i=e.stateNode,s=e.memoizedProps;try{i.nodeValue=s}catch(v){Ce(e,e.return,v)}}break;case 3:if(Bt(t,e),Qt(e),r&4&&n!==null&&n.memoizedState.isDehydrated)try{Ks(t.containerInfo)}catch(v){Ce(e,e.return,v)}break;case 4:Bt(t,e),Qt(e);break;case 13:Bt(t,e),Qt(e),i=e.child,i.flags&8192&&(s=i.memoizedState!==null,i.stateNode.isHidden=s,!s||i.alternate!==null&&i.alternate.memoizedState!==null||(Uh=Ee())),r&4&&Zp(e);break;case 22:if(c=n!==null&&n.memoizedState!==null,e.mode&1?(He=(u=He)||c,Bt(t,e),He=u):Bt(t,e),Qt(e),r&8192){if(u=e.memoizedState!==null,(e.stateNode.isHidden=u)&&!c&&e.mode&1)for(V=e,c=e.child;c!==null;){for(d=V=c;V!==null;){switch(h=V,f=h.child,h.tag){case 0:case 11:case 14:case 15:Ps(4,h,h.return);break;case 1:yi(h,h.return);var p=h.stateNode;if(typeof p.componentWillUnmount=="function"){r=h,n=h.return;try{t=r,p.props=t.memoizedProps,p.state=t.memoizedState,p.componentWillUnmount()}catch(v){Ce(r,n,v)}}break;case 5:yi(h,h.return);break;case 22:if(h.memoizedState!==null){tm(d);continue}}f!==null?(f.return=h,V=f):tm(d)}c=c.sibling}e:for(c=null,d=e;;){if(d.tag===5){if(c===null){c=d;try{i=d.stateNode,u?(s=i.style,typeof s.setProperty=="function"?s.setProperty("display","none","important"):s.display="none"):(a=d.stateNode,l=d.memoizedProps.style,o=l!=null&&l.hasOwnProperty("display")?l.display:null,a.style.display=b0("display",o))}catch(v){Ce(e,e.return,v)}}}else if(d.tag===6){if(c===null)try{d.stateNode.nodeValue=u?"":d.memoizedProps}catch(v){Ce(e,e.return,v)}}else if((d.tag!==22&&d.tag!==23||d.memoizedState===null||d===e)&&d.child!==null){d.child.return=d,d=d.child;continue}if(d===e)break e;for(;d.sibling===null;){if(d.return===null||d.return===e)break e;c===d&&(c=null),d=d.return}c===d&&(c=null),d.sibling.return=d.return,d=d.sibling}}break;case 19:Bt(t,e),Qt(e),r&4&&Zp(e);break;case 21:break;default:Bt(t,e),Qt(e)}}function Qt(e){var t=e.flags;if(t&2){try{e:{for(var n=e.return;n!==null;){if(Kv(n)){var r=n;break e}n=n.return}throw Error(j(160))}switch(r.tag){case 5:var i=r.stateNode;r.flags&32&&(qs(i,""),r.flags&=-33);var s=Yp(e);od(e,s,i);break;case 3:case 4:var o=r.stateNode.containerInfo,a=Yp(e);sd(e,a,o);break;default:throw Error(j(161))}}catch(l){Ce(e,e.return,l)}e.flags&=-3}t&4096&&(e.flags&=-4097)}function qS(e,t,n){V=e,Xv(e)}function Xv(e,t,n){for(var r=(e.mode&1)!==0;V!==null;){var i=V,s=i.child;if(i.tag===22&&r){var o=i.memoizedState!==null||Qo;if(!o){var a=i.alternate,l=a!==null&&a.memoizedState!==null||He;a=Qo;var u=He;if(Qo=o,(He=l)&&!u)for(V=i;V!==null;)o=V,l=o.child,o.tag===22&&o.memoizedState!==null?nm(i):l!==null?(l.return=o,V=l):nm(i);for(;s!==null;)V=s,Xv(s),s=s.sibling;V=i,Qo=a,He=u}em(e)}else i.subtreeFlags&8772&&s!==null?(s.return=i,V=s):em(e)}}function em(e){for(;V!==null;){var t=V;if(t.flags&8772){var n=t.alternate;try{if(t.flags&8772)switch(t.tag){case 0:case 11:case 15:He||Il(5,t);break;case 1:var r=t.stateNode;if(t.flags&4&&!He)if(n===null)r.componentDidMount();else{var i=t.elementType===t.type?n.memoizedProps:Ut(t.type,n.memoizedProps);r.componentDidUpdate(i,n.memoizedState,r.__reactInternalSnapshotBeforeUpdate)}var s=t.updateQueue;s!==null&&Bp(t,s,r);break;case 3:var o=t.updateQueue;if(o!==null){if(n=null,t.child!==null)switch(t.child.tag){case 5:n=t.child.stateNode;break;case 1:n=t.child.stateNode}Bp(t,o,n)}break;case 5:var a=t.stateNode;if(n===null&&t.flags&4){n=a;var l=t.memoizedProps;switch(t.type){case"button":case"input":case"select":case"textarea":l.autoFocus&&n.focus();break;case"img":l.src&&(n.src=l.src)}}break;case 6:break;case 4:break;case 12:break;case 13:if(t.memoizedState===null){var u=t.alternate;if(u!==null){var c=u.memoizedState;if(c!==null){var d=c.dehydrated;d!==null&&Ks(d)}}}break;case 19:case 17:case 21:case 22:case 23:case 25:break;default:throw Error(j(163))}He||t.flags&512&&id(t)}catch(h){Ce(t,t.return,h)}}if(t===e){V=null;break}if(n=t.sibling,n!==null){n.return=t.return,V=n;break}V=t.return}}function tm(e){for(;V!==null;){var t=V;if(t===e){V=null;break}var n=t.sibling;if(n!==null){n.return=t.return,V=n;break}V=t.return}}function nm(e){for(;V!==null;){var t=V;try{switch(t.tag){case 0:case 11:case 15:var n=t.return;try{Il(4,t)}catch(l){Ce(t,n,l)}break;case 1:var r=t.stateNode;if(typeof r.componentDidMount=="function"){var i=t.return;try{r.componentDidMount()}catch(l){Ce(t,i,l)}}var s=t.return;try{id(t)}catch(l){Ce(t,s,l)}break;case 5:var o=t.return;try{id(t)}catch(l){Ce(t,o,l)}}}catch(l){Ce(t,t.return,l)}if(t===e){V=null;break}var a=t.sibling;if(a!==null){a.return=t.return,V=a;break}V=t.return}}var HS=Math.ceil,el=Pn.ReactCurrentDispatcher,Fh=Pn.ReactCurrentOwner,jt=Pn.ReactCurrentBatchConfig,oe=0,De=null,Oe=null,$e=0,mt=0,vi=ar(0),je=0,so=null,Br=0,Dl=0,$h=0,As=null,st=null,Uh=0,Bi=1/0,fn=null,tl=!1,ad=null,Qn=null,Xo=!1,zn=null,nl=0,Rs=0,ld=null,Ea=-1,Ta=0;function et(){return oe&6?Ee():Ea!==-1?Ea:Ea=Ee()}function Xn(e){return e.mode&1?oe&2&&$e!==0?$e&-$e:PS.transition!==null?(Ta===0&&(Ta=D0()),Ta):(e=le,e!==0||(e=window.event,e=e===void 0?16:V0(e.type)),e):1}function Wt(e,t,n,r){if(50<Rs)throw Rs=0,ld=null,Error(j(185));So(e,n,r),(!(oe&2)||e!==De)&&(e===De&&(!(oe&2)&&(Dl|=n),je===4&&Fn(e,$e)),ut(e,r),n===1&&oe===0&&!(t.mode&1)&&(Bi=Ee()+500,Ol&&lr()))}function ut(e,t){var n=e.callbackNode;Pb(e,t);var r=Fa(e,e===De?$e:0);if(r===0)n!==null&&dp(n),e.callbackNode=null,e.callbackPriority=0;else if(t=r&-r,e.callbackPriority!==t){if(n!=null&&dp(n),t===1)e.tag===0?TS(rm.bind(null,e)):av(rm.bind(null,e)),SS(function(){!(oe&6)&&lr()}),n=null;else{switch(L0(r)){case 1:n=fh;break;case 4:n=j0;break;case 16:n=Ba;break;case 536870912:n=I0;break;default:n=Ba}n=sx(n,Yv.bind(null,e))}e.callbackPriority=t,e.callbackNode=n}}function Yv(e,t){if(Ea=-1,Ta=0,oe&6)throw Error(j(327));var n=e.callbackNode;if(Ai()&&e.callbackNode!==n)return null;var r=Fa(e,e===De?$e:0);if(r===0)return null;if(r&30||r&e.expiredLanes||t)t=rl(e,r);else{t=r;var i=oe;oe|=2;var s=ex();(De!==e||$e!==t)&&(fn=null,Bi=Ee()+500,Or(e,t));do try{KS();break}catch(a){Zv(e,a)}while(!0);Eh(),el.current=s,oe=i,Oe!==null?t=0:(De=null,$e=0,t=je)}if(t!==0){if(t===2&&(i=Dc(e),i!==0&&(r=i,t=ud(e,i))),t===1)throw n=so,Or(e,0),Fn(e,r),ut(e,Ee()),n;if(t===6)Fn(e,r);else{if(i=e.current.alternate,!(r&30)&&!WS(i)&&(t=rl(e,r),t===2&&(s=Dc(e),s!==0&&(r=s,t=ud(e,s))),t===1))throw n=so,Or(e,0),Fn(e,r),ut(e,Ee()),n;switch(e.finishedWork=i,e.finishedLanes=r,t){case 0:case 1:throw Error(j(345));case 2:vr(e,st,fn);break;case 3:if(Fn(e,r),(r&130023424)===r&&(t=Uh+500-Ee(),10<t)){if(Fa(e,0)!==0)break;if(i=e.suspendedLanes,(i&r)!==r){et(),e.pingedLanes|=e.suspendedLanes&i;break}e.timeoutHandle=zc(vr.bind(null,e,st,fn),t);break}vr(e,st,fn);break;case 4:if(Fn(e,r),(r&4194240)===r)break;for(t=e.eventTimes,i=-1;0<r;){var o=31-Ht(r);s=1<<o,o=t[o],o>i&&(i=o),r&=~s}if(r=i,r=Ee()-r,r=(120>r?120:480>r?480:1080>r?1080:1920>r?1920:3e3>r?3e3:4320>r?4320:1960*HS(r/1960))-r,10<r){e.timeoutHandle=zc(vr.bind(null,e,st,fn),r);break}vr(e,st,fn);break;case 5:vr(e,st,fn);break;default:throw Error(j(329))}}}return ut(e,Ee()),e.callbackNode===n?Yv.bind(null,e):null}function ud(e,t){var n=As;return e.current.memoizedState.isDehydrated&&(Or(e,t).flags|=256),e=rl(e,t),e!==2&&(t=st,st=n,t!==null&&cd(t)),e}function cd(e){st===null?st=e:st.push.apply(st,e)}function WS(e){for(var t=e;;){if(t.flags&16384){var n=t.updateQueue;if(n!==null&&(n=n.stores,n!==null))for(var r=0;r<n.length;r++){var i=n[r],s=i.getSnapshot;i=i.value;try{if(!Kt(s(),i))return!1}catch{return!1}}}if(n=t.child,t.subtreeFlags&16384&&n!==null)n.return=t,t=n;else{if(t===e)break;for(;t.sibling===null;){if(t.return===null||t.return===e)return!0;t=t.return}t.sibling.return=t.return,t=t.sibling}}return!0}function Fn(e,t){for(t&=~$h,t&=~Dl,e.suspendedLanes|=t,e.pingedLanes&=~t,e=e.expirationTimes;0<t;){var n=31-Ht(t),r=1<<n;e[n]=-1,t&=~r}}function rm(e){if(oe&6)throw Error(j(327));Ai();var t=Fa(e,0);if(!(t&1))return ut(e,Ee()),null;var n=rl(e,t);if(e.tag!==0&&n===2){var r=Dc(e);r!==0&&(t=r,n=ud(e,r))}if(n===1)throw n=so,Or(e,0),Fn(e,t),ut(e,Ee()),n;if(n===6)throw Error(j(345));return e.finishedWork=e.current.alternate,e.finishedLanes=t,vr(e,st,fn),ut(e,Ee()),null}function Vh(e,t){var n=oe;oe|=1;try{return e(t)}finally{oe=n,oe===0&&(Bi=Ee()+500,Ol&&lr())}}function Fr(e){zn!==null&&zn.tag===0&&!(oe&6)&&Ai();var t=oe;oe|=1;var n=jt.transition,r=le;try{if(jt.transition=null,le=1,e)return e()}finally{le=r,jt.transition=n,oe=t,!(oe&6)&&lr()}}function zh(){mt=vi.current,ye(vi)}function Or(e,t){e.finishedWork=null,e.finishedLanes=0;var n=e.timeoutHandle;if(n!==-1&&(e.timeoutHandle=-1,bS(n)),Oe!==null)for(n=Oe.return;n!==null;){var r=n;switch(Sh(r),r.tag){case 1:r=r.type.childContextTypes,r!=null&&qa();break;case 3:Li(),ye(at),ye(Ke),Nh();break;case 5:Oh(r);break;case 4:Li();break;case 13:ye(xe);break;case 19:ye(xe);break;case 10:Th(r.type._context);break;case 22:case 23:zh()}n=n.return}if(De=e,Oe=e=Yn(e.current,null),$e=mt=t,je=0,so=null,$h=Dl=Br=0,st=As=null,Tr!==null){for(t=0;t<Tr.length;t++)if(n=Tr[t],r=n.interleaved,r!==null){n.interleaved=null;var i=r.next,s=n.pending;if(s!==null){var o=s.next;s.next=i,r.next=o}n.pending=r}Tr=null}return e}function Zv(e,t){do{var n=Oe;try{if(Eh(),Sa.current=Za,Ya){for(var r=ke.memoizedState;r!==null;){var i=r.queue;i!==null&&(i.pending=null),r=r.next}Ya=!1}if(Mr=0,Ie=Ne=ke=null,Ts=!1,no=0,Fh.current=null,n===null||n.return===null){je=1,so=t,Oe=null;break}e:{var s=e,o=n.return,a=n,l=t;if(t=$e,a.flags|=32768,l!==null&&typeof l=="object"&&typeof l.then=="function"){var u=l,c=a,d=c.tag;if(!(c.mode&1)&&(d===0||d===11||d===15)){var h=c.alternate;h?(c.updateQueue=h.updateQueue,c.memoizedState=h.memoizedState,c.lanes=h.lanes):(c.updateQueue=null,c.memoizedState=null)}var f=qp(o);if(f!==null){f.flags&=-257,Hp(f,o,a,s,t),f.mode&1&&zp(s,u,t),t=f,l=u;var p=t.updateQueue;if(p===null){var v=new Set;v.add(l),t.updateQueue=v}else p.add(l);break e}else{if(!(t&1)){zp(s,u,t),qh();break e}l=Error(j(426))}}else if(ve&&a.mode&1){var w=qp(o);if(w!==null){!(w.flags&65536)&&(w.flags|=256),Hp(w,o,a,s,t),_h(Mi(l,a));break e}}s=l=Mi(l,a),je!==4&&(je=2),As===null?As=[s]:As.push(s),s=o;do{switch(s.tag){case 3:s.flags|=65536,t&=-t,s.lanes|=t;var m=Lv(s,l,t);Mp(s,m);break e;case 1:a=l;var g=s.type,y=s.stateNode;if(!(s.flags&128)&&(typeof g.getDerivedStateFromError=="function"||y!==null&&typeof y.componentDidCatch=="function"&&(Qn===null||!Qn.has(y)))){s.flags|=65536,t&=-t,s.lanes|=t;var k=Mv(s,a,t);Mp(s,k);break e}}s=s.return}while(s!==null)}nx(n)}catch(T){t=T,Oe===n&&n!==null&&(Oe=n=n.return);continue}break}while(!0)}function ex(){var e=el.current;return el.current=Za,e===null?Za:e}function qh(){(je===0||je===3||je===2)&&(je=4),De===null||!(Br&268435455)&&!(Dl&268435455)||Fn(De,$e)}function rl(e,t){var n=oe;oe|=2;var r=ex();(De!==e||$e!==t)&&(fn=null,Or(e,t));do try{GS();break}catch(i){Zv(e,i)}while(!0);if(Eh(),oe=n,el.current=r,Oe!==null)throw Error(j(261));return De=null,$e=0,je}function GS(){for(;Oe!==null;)tx(Oe)}function KS(){for(;Oe!==null&&!xb();)tx(Oe)}function tx(e){var t=ix(e.alternate,e,mt);e.memoizedProps=e.pendingProps,t===null?nx(e):Oe=t,Fh.current=null}function nx(e){var t=e;do{var n=t.alternate;if(e=t.return,t.flags&32768){if(n=US(n,t),n!==null){n.flags&=32767,Oe=n;return}if(e!==null)e.flags|=32768,e.subtreeFlags=0,e.deletions=null;else{je=6,Oe=null;return}}else if(n=$S(n,t,mt),n!==null){Oe=n;return}if(t=t.sibling,t!==null){Oe=t;return}Oe=t=e}while(t!==null);je===0&&(je=5)}function vr(e,t,n){var r=le,i=jt.transition;try{jt.transition=null,le=1,JS(e,t,n,r)}finally{jt.transition=i,le=r}return null}function JS(e,t,n,r){do Ai();while(zn!==null);if(oe&6)throw Error(j(327));n=e.finishedWork;var i=e.finishedLanes;if(n===null)return null;if(e.finishedWork=null,e.finishedLanes=0,n===e.current)throw Error(j(177));e.callbackNode=null,e.callbackPriority=0;var s=n.lanes|n.childLanes;if(Ab(e,s),e===De&&(Oe=De=null,$e=0),!(n.subtreeFlags&2064)&&!(n.flags&2064)||Xo||(Xo=!0,sx(Ba,function(){return Ai(),null})),s=(n.flags&15990)!==0,n.subtreeFlags&15990||s){s=jt.transition,jt.transition=null;var o=le;le=1;var a=oe;oe|=4,Fh.current=null,zS(e,n),Qv(n,e),mS(Uc),$a=!!$c,Uc=$c=null,e.current=n,qS(n),wb(),oe=a,le=o,jt.transition=s}else e.current=n;if(Xo&&(Xo=!1,zn=e,nl=i),s=e.pendingLanes,s===0&&(Qn=null),Sb(n.stateNode),ut(e,Ee()),t!==null)for(r=e.onRecoverableError,n=0;n<t.length;n++)i=t[n],r(i.value,{componentStack:i.stack,digest:i.digest});if(tl)throw tl=!1,e=ad,ad=null,e;return nl&1&&e.tag!==0&&Ai(),s=e.pendingLanes,s&1?e===ld?Rs++:(Rs=0,ld=e):Rs=0,lr(),null}function Ai(){if(zn!==null){var e=L0(nl),t=jt.transition,n=le;try{if(jt.transition=null,le=16>e?16:e,zn===null)var r=!1;else{if(e=zn,zn=null,nl=0,oe&6)throw Error(j(331));var i=oe;for(oe|=4,V=e.current;V!==null;){var s=V,o=s.child;if(V.flags&16){var a=s.deletions;if(a!==null){for(var l=0;l<a.length;l++){var u=a[l];for(V=u;V!==null;){var c=V;switch(c.tag){case 0:case 11:case 15:Ps(8,c,s)}var d=c.child;if(d!==null)d.return=c,V=d;else for(;V!==null;){c=V;var h=c.sibling,f=c.return;if(Gv(c),c===u){V=null;break}if(h!==null){h.return=f,V=h;break}V=f}}}var p=s.alternate;if(p!==null){var v=p.child;if(v!==null){p.child=null;do{var w=v.sibling;v.sibling=null,v=w}while(v!==null)}}V=s}}if(s.subtreeFlags&2064&&o!==null)o.return=s,V=o;else e:for(;V!==null;){if(s=V,s.flags&2048)switch(s.tag){case 0:case 11:case 15:Ps(9,s,s.return)}var m=s.sibling;if(m!==null){m.return=s.return,V=m;break e}V=s.return}}var g=e.current;for(V=g;V!==null;){o=V;var y=o.child;if(o.subtreeFlags&2064&&y!==null)y.return=o,V=y;else e:for(o=g;V!==null;){if(a=V,a.flags&2048)try{switch(a.tag){case 0:case 11:case 15:Il(9,a)}}catch(T){Ce(a,a.return,T)}if(a===o){V=null;break e}var k=a.sibling;if(k!==null){k.return=a.return,V=k;break e}V=a.return}}if(oe=i,lr(),sn&&typeof sn.onPostCommitFiberRoot=="function")try{sn.onPostCommitFiberRoot(El,e)}catch{}r=!0}return r}finally{le=n,jt.transition=t}}return!1}function im(e,t,n){t=Mi(n,t),t=Lv(e,t,1),e=Jn(e,t,1),t=et(),e!==null&&(So(e,1,t),ut(e,t))}function Ce(e,t,n){if(e.tag===3)im(e,e,n);else for(;t!==null;){if(t.tag===3){im(t,e,n);break}else if(t.tag===1){var r=t.stateNode;if(typeof t.type.getDerivedStateFromError=="function"||typeof r.componentDidCatch=="function"&&(Qn===null||!Qn.has(r))){e=Mi(n,e),e=Mv(t,e,1),t=Jn(t,e,1),e=et(),t!==null&&(So(t,1,e),ut(t,e));break}}t=t.return}}function QS(e,t,n){var r=e.pingCache;r!==null&&r.delete(t),t=et(),e.pingedLanes|=e.suspendedLanes&n,De===e&&($e&n)===n&&(je===4||je===3&&($e&130023424)===$e&&500>Ee()-Uh?Or(e,0):$h|=n),ut(e,t)}function rx(e,t){t===0&&(e.mode&1?(t=Uo,Uo<<=1,!(Uo&130023424)&&(Uo=4194304)):t=1);var n=et();e=Cn(e,t),e!==null&&(So(e,t,n),ut(e,n))}function XS(e){var t=e.memoizedState,n=0;t!==null&&(n=t.retryLane),rx(e,n)}function YS(e,t){var n=0;switch(e.tag){case 13:var r=e.stateNode,i=e.memoizedState;i!==null&&(n=i.retryLane);break;case 19:r=e.stateNode;break;default:throw Error(j(314))}r!==null&&r.delete(t),rx(e,n)}var ix;ix=function(e,t,n){if(e!==null)if(e.memoizedProps!==t.pendingProps||at.current)ot=!0;else{if(!(e.lanes&n)&&!(t.flags&128))return ot=!1,FS(e,t,n);ot=!!(e.flags&131072)}else ot=!1,ve&&t.flags&1048576&&lv(t,Ga,t.index);switch(t.lanes=0,t.tag){case 2:var r=t.type;Ca(e,t),e=t.pendingProps;var i=ji(t,Ke.current);Pi(t,n),i=Ih(null,t,r,e,i,n);var s=Dh();return t.flags|=1,typeof i=="object"&&i!==null&&typeof i.render=="function"&&i.$$typeof===void 0?(t.tag=1,t.memoizedState=null,t.updateQueue=null,lt(r)?(s=!0,Ha(t)):s=!1,t.memoizedState=i.state!==null&&i.state!==void 0?i.state:null,Ah(t),i.updater=jl,t.stateNode=i,i._reactInternals=t,Qc(t,r,e,n),t=Zc(null,t,r,!0,s,n)):(t.tag=0,ve&&s&&bh(t),Ye(null,t,i,n),t=t.child),t;case 16:r=t.elementType;e:{switch(Ca(e,t),e=t.pendingProps,i=r._init,r=i(r._payload),t.type=r,i=t.tag=e_(r),e=Ut(r,e),i){case 0:t=Yc(null,t,r,e,n);break e;case 1:t=Kp(null,t,r,e,n);break e;case 11:t=Wp(null,t,r,e,n);break e;case 14:t=Gp(null,t,r,Ut(r.type,e),n);break e}throw Error(j(306,r,""))}return t;case 0:return r=t.type,i=t.pendingProps,i=t.elementType===r?i:Ut(r,i),Yc(e,t,r,i,n);case 1:return r=t.type,i=t.pendingProps,i=t.elementType===r?i:Ut(r,i),Kp(e,t,r,i,n);case 3:e:{if(Uv(t),e===null)throw Error(j(387));r=t.pendingProps,s=t.memoizedState,i=s.element,pv(e,t),Qa(t,r,null,n);var o=t.memoizedState;if(r=o.element,s.isDehydrated)if(s={element:r,isDehydrated:!1,cache:o.cache,pendingSuspenseBoundaries:o.pendingSuspenseBoundaries,transitions:o.transitions},t.updateQueue.baseState=s,t.memoizedState=s,t.flags&256){i=Mi(Error(j(423)),t),t=Jp(e,t,r,n,i);break e}else if(r!==i){i=Mi(Error(j(424)),t),t=Jp(e,t,r,n,i);break e}else for(vt=Kn(t.stateNode.containerInfo.firstChild),xt=t,ve=!0,qt=null,n=hv(t,null,r,n),t.child=n;n;)n.flags=n.flags&-3|4096,n=n.sibling;else{if(Ii(),r===i){t=En(e,t,n);break e}Ye(e,t,r,n)}t=t.child}return t;case 5:return mv(t),e===null&&Gc(t),r=t.type,i=t.pendingProps,s=e!==null?e.memoizedProps:null,o=i.children,Vc(r,i)?o=null:s!==null&&Vc(r,s)&&(t.flags|=32),$v(e,t),Ye(e,t,o,n),t.child;case 6:return e===null&&Gc(t),null;case 13:return Vv(e,t,n);case 4:return Rh(t,t.stateNode.containerInfo),r=t.pendingProps,e===null?t.child=Di(t,null,r,n):Ye(e,t,r,n),t.child;case 11:return r=t.type,i=t.pendingProps,i=t.elementType===r?i:Ut(r,i),Wp(e,t,r,i,n);case 7:return Ye(e,t,t.pendingProps,n),t.child;case 8:return Ye(e,t,t.pendingProps.children,n),t.child;case 12:return Ye(e,t,t.pendingProps.children,n),t.child;case 10:e:{if(r=t.type._context,i=t.pendingProps,s=t.memoizedProps,o=i.value,pe(Ka,r._currentValue),r._currentValue=o,s!==null)if(Kt(s.value,o)){if(s.children===i.children&&!at.current){t=En(e,t,n);break e}}else for(s=t.child,s!==null&&(s.return=t);s!==null;){var a=s.dependencies;if(a!==null){o=s.child;for(var l=a.firstContext;l!==null;){if(l.context===r){if(s.tag===1){l=wn(-1,n&-n),l.tag=2;var u=s.updateQueue;if(u!==null){u=u.shared;var c=u.pending;c===null?l.next=l:(l.next=c.next,c.next=l),u.pending=l}}s.lanes|=n,l=s.alternate,l!==null&&(l.lanes|=n),Kc(s.return,n,t),a.lanes|=n;break}l=l.next}}else if(s.tag===10)o=s.type===t.type?null:s.child;else if(s.tag===18){if(o=s.return,o===null)throw Error(j(341));o.lanes|=n,a=o.alternate,a!==null&&(a.lanes|=n),Kc(o,n,t),o=s.sibling}else o=s.child;if(o!==null)o.return=s;else for(o=s;o!==null;){if(o===t){o=null;break}if(s=o.sibling,s!==null){s.return=o.return,o=s;break}o=o.return}s=o}Ye(e,t,i.children,n),t=t.child}return t;case 9:return i=t.type,r=t.pendingProps.children,Pi(t,n),i=It(i),r=r(i),t.flags|=1,Ye(e,t,r,n),t.child;case 14:return r=t.type,i=Ut(r,t.pendingProps),i=Ut(r.type,i),Gp(e,t,r,i,n);case 15:return Bv(e,t,t.type,t.pendingProps,n);case 17:return r=t.type,i=t.pendingProps,i=t.elementType===r?i:Ut(r,i),Ca(e,t),t.tag=1,lt(r)?(e=!0,Ha(t)):e=!1,Pi(t,n),Dv(t,r,i),Qc(t,r,i,n),Zc(null,t,r,!0,e,n);case 19:return zv(e,t,n);case 22:return Fv(e,t,n)}throw Error(j(156,t.tag))};function sx(e,t){return N0(e,t)}function ZS(e,t,n,r){this.tag=e,this.key=n,this.sibling=this.child=this.return=this.stateNode=this.type=this.elementType=null,this.index=0,this.ref=null,this.pendingProps=t,this.dependencies=this.memoizedState=this.updateQueue=this.memoizedProps=null,this.mode=r,this.subtreeFlags=this.flags=0,this.deletions=null,this.childLanes=this.lanes=0,this.alternate=null}function Nt(e,t,n,r){return new ZS(e,t,n,r)}function Hh(e){return e=e.prototype,!(!e||!e.isReactComponent)}function e_(e){if(typeof e=="function")return Hh(e)?1:0;if(e!=null){if(e=e.$$typeof,e===ch)return 11;if(e===dh)return 14}return 2}function Yn(e,t){var n=e.alternate;return n===null?(n=Nt(e.tag,t,e.key,e.mode),n.elementType=e.elementType,n.type=e.type,n.stateNode=e.stateNode,n.alternate=e,e.alternate=n):(n.pendingProps=t,n.type=e.type,n.flags=0,n.subtreeFlags=0,n.deletions=null),n.flags=e.flags&14680064,n.childLanes=e.childLanes,n.lanes=e.lanes,n.child=e.child,n.memoizedProps=e.memoizedProps,n.memoizedState=e.memoizedState,n.updateQueue=e.updateQueue,t=e.dependencies,n.dependencies=t===null?null:{lanes:t.lanes,firstContext:t.firstContext},n.sibling=e.sibling,n.index=e.index,n.ref=e.ref,n}function Pa(e,t,n,r,i,s){var o=2;if(r=e,typeof e=="function")Hh(e)&&(o=1);else if(typeof e=="string")o=5;else e:switch(e){case li:return Nr(n.children,i,s,t);case uh:o=8,i|=8;break;case wc:return e=Nt(12,n,t,i|2),e.elementType=wc,e.lanes=s,e;case kc:return e=Nt(13,n,t,i),e.elementType=kc,e.lanes=s,e;case bc:return e=Nt(19,n,t,i),e.elementType=bc,e.lanes=s,e;case m0:return Ll(n,i,s,t);default:if(typeof e=="object"&&e!==null)switch(e.$$typeof){case f0:o=10;break e;case p0:o=9;break e;case ch:o=11;break e;case dh:o=14;break e;case Dn:o=16,r=null;break e}throw Error(j(130,e==null?e:typeof e,""))}return t=Nt(o,n,t,i),t.elementType=e,t.type=r,t.lanes=s,t}function Nr(e,t,n,r){return e=Nt(7,e,r,t),e.lanes=n,e}function Ll(e,t,n,r){return e=Nt(22,e,r,t),e.elementType=m0,e.lanes=n,e.stateNode={isHidden:!1},e}function ju(e,t,n){return e=Nt(6,e,null,t),e.lanes=n,e}function Iu(e,t,n){return t=Nt(4,e.children!==null?e.children:[],e.key,t),t.lanes=n,t.stateNode={containerInfo:e.containerInfo,pendingChildren:null,implementation:e.implementation},t}function t_(e,t,n,r,i){this.tag=t,this.containerInfo=e,this.finishedWork=this.pingCache=this.current=this.pendingChildren=null,this.timeoutHandle=-1,this.callbackNode=this.pendingContext=this.context=null,this.callbackPriority=0,this.eventTimes=pu(0),this.expirationTimes=pu(-1),this.entangledLanes=this.finishedLanes=this.mutableReadLanes=this.expiredLanes=this.pingedLanes=this.suspendedLanes=this.pendingLanes=0,this.entanglements=pu(0),this.identifierPrefix=r,this.onRecoverableError=i,this.mutableSourceEagerHydrationData=null}function Wh(e,t,n,r,i,s,o,a,l){return e=new t_(e,t,n,a,l),t===1?(t=1,s===!0&&(t|=8)):t=0,s=Nt(3,null,null,t),e.current=s,s.stateNode=e,s.memoizedState={element:r,isDehydrated:n,cache:null,transitions:null,pendingSuspenseBoundaries:null},Ah(s),e}function n_(e,t,n){var r=3<arguments.length&&arguments[3]!==void 0?arguments[3]:null;return{$$typeof:ai,key:r==null?null:""+r,children:e,containerInfo:t,implementation:n}}function ox(e){if(!e)return rr;e=e._reactInternals;e:{if(Vr(e)!==e||e.tag!==1)throw Error(j(170));var t=e;do{switch(t.tag){case 3:t=t.stateNode.context;break e;case 1:if(lt(t.type)){t=t.stateNode.__reactInternalMemoizedMergedChildContext;break e}}t=t.return}while(t!==null);throw Error(j(171))}if(e.tag===1){var n=e.type;if(lt(n))return ov(e,n,t)}return t}function ax(e,t,n,r,i,s,o,a,l){return e=Wh(n,r,!0,e,i,s,o,a,l),e.context=ox(null),n=e.current,r=et(),i=Xn(n),s=wn(r,i),s.callback=t??null,Jn(n,s,i),e.current.lanes=i,So(e,i,r),ut(e,r),e}function Ml(e,t,n,r){var i=t.current,s=et(),o=Xn(i);return n=ox(n),t.context===null?t.context=n:t.pendingContext=n,t=wn(s,o),t.payload={element:e},r=r===void 0?null:r,r!==null&&(t.callback=r),e=Jn(i,t,o),e!==null&&(Wt(e,i,o,s),ba(e,i,o)),o}function il(e){if(e=e.current,!e.child)return null;switch(e.child.tag){case 5:return e.child.stateNode;default:return e.child.stateNode}}function sm(e,t){if(e=e.memoizedState,e!==null&&e.dehydrated!==null){var n=e.retryLane;e.retryLane=n!==0&&n<t?n:t}}function Gh(e,t){sm(e,t),(e=e.alternate)&&sm(e,t)}function r_(){return null}var lx=typeof reportError=="function"?reportError:function(e){console.error(e)};function Kh(e){this._internalRoot=e}Bl.prototype.render=Kh.prototype.render=function(e){var t=this._internalRoot;if(t===null)throw Error(j(409));Ml(e,t,null,null)};Bl.prototype.unmount=Kh.prototype.unmount=function(){var e=this._internalRoot;if(e!==null){this._internalRoot=null;var t=e.containerInfo;Fr(function(){Ml(null,e,null,null)}),t[_n]=null}};function Bl(e){this._internalRoot=e}Bl.prototype.unstable_scheduleHydration=function(e){if(e){var t=F0();e={blockedOn:null,target:e,priority:t};for(var n=0;n<Bn.length&&t!==0&&t<Bn[n].priority;n++);Bn.splice(n,0,e),n===0&&U0(e)}};function Jh(e){return!(!e||e.nodeType!==1&&e.nodeType!==9&&e.nodeType!==11)}function Fl(e){return!(!e||e.nodeType!==1&&e.nodeType!==9&&e.nodeType!==11&&(e.nodeType!==8||e.nodeValue!==" react-mount-point-unstable "))}function om(){}function i_(e,t,n,r,i){if(i){if(typeof r=="function"){var s=r;r=function(){var u=il(o);s.call(u)}}var o=ax(t,r,e,0,null,!1,!1,"",om);return e._reactRootContainer=o,e[_n]=o.current,Xs(e.nodeType===8?e.parentNode:e),Fr(),o}for(;i=e.lastChild;)e.removeChild(i);if(typeof r=="function"){var a=r;r=function(){var u=il(l);a.call(u)}}var l=Wh(e,0,!1,null,null,!1,!1,"",om);return e._reactRootContainer=l,e[_n]=l.current,Xs(e.nodeType===8?e.parentNode:e),Fr(function(){Ml(t,l,n,r)}),l}function $l(e,t,n,r,i){var s=n._reactRootContainer;if(s){var o=s;if(typeof i=="function"){var a=i;i=function(){var l=il(o);a.call(l)}}Ml(t,o,e,i)}else o=i_(n,t,e,i,r);return il(o)}M0=function(e){switch(e.tag){case 3:var t=e.stateNode;if(t.current.memoizedState.isDehydrated){var n=gs(t.pendingLanes);n!==0&&(ph(t,n|1),ut(t,Ee()),!(oe&6)&&(Bi=Ee()+500,lr()))}break;case 13:Fr(function(){var r=Cn(e,1);if(r!==null){var i=et();Wt(r,e,1,i)}}),Gh(e,1)}};mh=function(e){if(e.tag===13){var t=Cn(e,134217728);if(t!==null){var n=et();Wt(t,e,134217728,n)}Gh(e,134217728)}};B0=function(e){if(e.tag===13){var t=Xn(e),n=Cn(e,t);if(n!==null){var r=et();Wt(n,e,t,r)}Gh(e,t)}};F0=function(){return le};$0=function(e,t){var n=le;try{return le=e,t()}finally{le=n}};Nc=function(e,t,n){switch(t){case"input":if(Cc(e,n),t=n.name,n.type==="radio"&&t!=null){for(n=e;n.parentNode;)n=n.parentNode;for(n=n.querySelectorAll("input[name="+JSON.stringify(""+t)+'][type="radio"]'),t=0;t<n.length;t++){var r=n[t];if(r!==e&&r.form===e.form){var i=Rl(r);if(!i)throw Error(j(90));y0(r),Cc(r,i)}}}break;case"textarea":x0(e,n);break;case"select":t=n.value,t!=null&&_i(e,!!n.multiple,t,!1)}};E0=Vh;T0=Fr;var s_={usingClientEntryPoint:!1,Events:[Co,hi,Rl,_0,C0,Vh]},as={findFiberByHostInstance:Er,bundleType:0,version:"18.3.1",rendererPackageName:"react-dom"},o_={bundleType:as.bundleType,version:as.version,rendererPackageName:as.rendererPackageName,rendererConfig:as.rendererConfig,overrideHookState:null,overrideHookStateDeletePath:null,overrideHookStateRenamePath:null,overrideProps:null,overridePropsDeletePath:null,overridePropsRenamePath:null,setErrorHandler:null,setSuspenseHandler:null,scheduleUpdate:null,currentDispatcherRef:Pn.ReactCurrentDispatcher,findHostInstanceByFiber:function(e){return e=R0(e),e===null?null:e.stateNode},findFiberByHostInstance:as.findFiberByHostInstance||r_,findHostInstancesForRefresh:null,scheduleRefresh:null,scheduleRoot:null,setRefreshHandler:null,getCurrentFiber:null,reconcilerVersion:"18.3.1-next-f1338f8080-20240426"};if(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__<"u"){var Yo=__REACT_DEVTOOLS_GLOBAL_HOOK__;if(!Yo.isDisabled&&Yo.supportsFiber)try{El=Yo.inject(o_),sn=Yo}catch{}}St.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED=s_;St.createPortal=function(e,t){var n=2<arguments.length&&arguments[2]!==void 0?arguments[2]:null;if(!Jh(t))throw Error(j(200));return n_(e,t,null,n)};St.createRoot=function(e,t){if(!Jh(e))throw Error(j(299));var n=!1,r="",i=lx;return t!=null&&(t.unstable_strictMode===!0&&(n=!0),t.identifierPrefix!==void 0&&(r=t.identifierPrefix),t.onRecoverableError!==void 0&&(i=t.onRecoverableError)),t=Wh(e,1,!1,null,null,n,!1,r,i),e[_n]=t.current,Xs(e.nodeType===8?e.parentNode:e),new Kh(t)};St.findDOMNode=function(e){if(e==null)return null;if(e.nodeType===1)return e;var t=e._reactInternals;if(t===void 0)throw typeof e.render=="function"?Error(j(188)):(e=Object.keys(e).join(","),Error(j(268,e)));return e=R0(t),e=e===null?null:e.stateNode,e};St.flushSync=function(e){return Fr(e)};St.hydrate=function(e,t,n){if(!Fl(t))throw Error(j(200));return $l(null,e,t,!0,n)};St.hydrateRoot=function(e,t,n){if(!Jh(e))throw Error(j(405));var r=n!=null&&n.hydratedSources||null,i=!1,s="",o=lx;if(n!=null&&(n.unstable_strictMode===!0&&(i=!0),n.identifierPrefix!==void 0&&(s=n.identifierPrefix),n.onRecoverableError!==void 0&&(o=n.onRecoverableError)),t=ax(t,null,e,1,n??null,i,!1,s,o),e[_n]=t.current,Xs(e),r)for(e=0;e<r.length;e++)n=r[e],i=n._getVersion,i=i(n._source),t.mutableSourceEagerHydrationData==null?t.mutableSourceEagerHydrationData=[n,i]:t.mutableSourceEagerHydrationData.push(n,i);return new Bl(t)};St.render=function(e,t,n){if(!Fl(t))throw Error(j(200));return $l(null,e,t,!1,n)};St.unmountComponentAtNode=function(e){if(!Fl(e))throw Error(j(40));return e._reactRootContainer?(Fr(function(){$l(null,null,e,!1,function(){e._reactRootContainer=null,e[_n]=null})}),!0):!1};St.unstable_batchedUpdates=Vh;St.unstable_renderSubtreeIntoContainer=function(e,t,n,r){if(!Fl(n))throw Error(j(200));if(e==null||e._reactInternals===void 0)throw Error(j(38));return $l(e,t,n,!1,r)};St.version="18.3.1-next-f1338f8080-20240426";function ux(){if(!(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__>"u"||typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE!="function"))try{__REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(ux)}catch(e){console.error(e)}}ux(),u0.exports=St;var a_=u0.exports,am=a_;vc.createRoot=am.createRoot,vc.hydrateRoot=am.hydrateRoot;/**
 * @remix-run/router v1.23.2
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function oo(){return oo=Object.assign?Object.assign.bind():function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e},oo.apply(this,arguments)}var qn;(function(e){e.Pop="POP",e.Push="PUSH",e.Replace="REPLACE"})(qn||(qn={}));const lm="popstate";function l_(e){e===void 0&&(e={});function t(r,i){let{pathname:s,search:o,hash:a}=r.location;return dd("",{pathname:s,search:o,hash:a},i.state&&i.state.usr||null,i.state&&i.state.key||"default")}function n(r,i){return typeof i=="string"?i:sl(i)}return c_(t,n,null,e)}function be(e,t){if(e===!1||e===null||typeof e>"u")throw new Error(t)}function Qh(e,t){if(!e){typeof console<"u"&&console.warn(t);try{throw new Error(t)}catch{}}}function u_(){return Math.random().toString(36).substr(2,8)}function um(e,t){return{usr:e.state,key:e.key,idx:t}}function dd(e,t,n,r){return n===void 0&&(n=null),oo({pathname:typeof e=="string"?e:e.pathname,search:"",hash:""},typeof t=="string"?Wi(t):t,{state:n,key:t&&t.key||r||u_()})}function sl(e){let{pathname:t="/",search:n="",hash:r=""}=e;return n&&n!=="?"&&(t+=n.charAt(0)==="?"?n:"?"+n),r&&r!=="#"&&(t+=r.charAt(0)==="#"?r:"#"+r),t}function Wi(e){let t={};if(e){let n=e.indexOf("#");n>=0&&(t.hash=e.substr(n),e=e.substr(0,n));let r=e.indexOf("?");r>=0&&(t.search=e.substr(r),e=e.substr(0,r)),e&&(t.pathname=e)}return t}function c_(e,t,n,r){r===void 0&&(r={});let{window:i=document.defaultView,v5Compat:s=!1}=r,o=i.history,a=qn.Pop,l=null,u=c();u==null&&(u=0,o.replaceState(oo({},o.state,{idx:u}),""));function c(){return(o.state||{idx:null}).idx}function d(){a=qn.Pop;let w=c(),m=w==null?null:w-u;u=w,l&&l({action:a,location:v.location,delta:m})}function h(w,m){a=qn.Push;let g=dd(v.location,w,m);u=c()+1;let y=um(g,u),k=v.createHref(g);try{o.pushState(y,"",k)}catch(T){if(T instanceof DOMException&&T.name==="DataCloneError")throw T;i.location.assign(k)}s&&l&&l({action:a,location:v.location,delta:1})}function f(w,m){a=qn.Replace;let g=dd(v.location,w,m);u=c();let y=um(g,u),k=v.createHref(g);o.replaceState(y,"",k),s&&l&&l({action:a,location:v.location,delta:0})}function p(w){let m=i.location.origin!=="null"?i.location.origin:i.location.href,g=typeof w=="string"?w:sl(w);return g=g.replace(/ $/,"%20"),be(m,"No window.location.(origin|href) available to create URL for href: "+g),new URL(g,m)}let v={get action(){return a},get location(){return e(i,o)},listen(w){if(l)throw new Error("A history only accepts one active listener");return i.addEventListener(lm,d),l=w,()=>{i.removeEventListener(lm,d),l=null}},createHref(w){return t(i,w)},createURL:p,encodeLocation(w){let m=p(w);return{pathname:m.pathname,search:m.search,hash:m.hash}},push:h,replace:f,go(w){return o.go(w)}};return v}var cm;(function(e){e.data="data",e.deferred="deferred",e.redirect="redirect",e.error="error"})(cm||(cm={}));function d_(e,t,n){return n===void 0&&(n="/"),h_(e,t,n)}function h_(e,t,n,r){let i=typeof t=="string"?Wi(t):t,s=Fi(i.pathname||"/",n);if(s==null)return null;let o=cx(e);f_(o);let a=null;for(let l=0;a==null&&l<o.length;++l){let u=__(s);a=b_(o[l],u)}return a}function cx(e,t,n,r){t===void 0&&(t=[]),n===void 0&&(n=[]),r===void 0&&(r="");let i=(s,o,a)=>{let l={relativePath:a===void 0?s.path||"":a,caseSensitive:s.caseSensitive===!0,childrenIndex:o,route:s};l.relativePath.startsWith("/")&&(be(l.relativePath.startsWith(r),'Absolute route path "'+l.relativePath+'" nested under path '+('"'+r+'" is not valid. An absolute child route path ')+"must start with the combined path of all its parent routes."),l.relativePath=l.relativePath.slice(r.length));let u=Zn([r,l.relativePath]),c=n.concat(l);s.children&&s.children.length>0&&(be(s.index!==!0,"Index routes must not have child routes. Please remove "+('all child routes from route path "'+u+'".')),cx(s.children,t,c,u)),!(s.path==null&&!s.index)&&t.push({path:u,score:w_(u,s.index),routesMeta:c})};return e.forEach((s,o)=>{var a;if(s.path===""||!((a=s.path)!=null&&a.includes("?")))i(s,o);else for(let l of dx(s.path))i(s,o,l)}),t}function dx(e){let t=e.split("/");if(t.length===0)return[];let[n,...r]=t,i=n.endsWith("?"),s=n.replace(/\?$/,"");if(r.length===0)return i?[s,""]:[s];let o=dx(r.join("/")),a=[];return a.push(...o.map(l=>l===""?s:[s,l].join("/"))),i&&a.push(...o),a.map(l=>e.startsWith("/")&&l===""?"/":l)}function f_(e){e.sort((t,n)=>t.score!==n.score?n.score-t.score:k_(t.routesMeta.map(r=>r.childrenIndex),n.routesMeta.map(r=>r.childrenIndex)))}const p_=/^:[\w-]+$/,m_=3,g_=2,y_=1,v_=10,x_=-2,dm=e=>e==="*";function w_(e,t){let n=e.split("/"),r=n.length;return n.some(dm)&&(r+=x_),t&&(r+=g_),n.filter(i=>!dm(i)).reduce((i,s)=>i+(p_.test(s)?m_:s===""?y_:v_),r)}function k_(e,t){return e.length===t.length&&e.slice(0,-1).every((r,i)=>r===t[i])?e[e.length-1]-t[t.length-1]:0}function b_(e,t,n){let{routesMeta:r}=e,i={},s="/",o=[];for(let a=0;a<r.length;++a){let l=r[a],u=a===r.length-1,c=s==="/"?t:t.slice(s.length)||"/",d=hd({path:l.relativePath,caseSensitive:l.caseSensitive,end:u},c),h=l.route;if(!d)return null;Object.assign(i,d.params),o.push({params:i,pathname:Zn([s,d.pathname]),pathnameBase:A_(Zn([s,d.pathnameBase])),route:h}),d.pathnameBase!=="/"&&(s=Zn([s,d.pathnameBase]))}return o}function hd(e,t){typeof e=="string"&&(e={path:e,caseSensitive:!1,end:!0});let[n,r]=S_(e.path,e.caseSensitive,e.end),i=t.match(n);if(!i)return null;let s=i[0],o=s.replace(/(.)\/+$/,"$1"),a=i.slice(1);return{params:r.reduce((u,c,d)=>{let{paramName:h,isOptional:f}=c;if(h==="*"){let v=a[d]||"";o=s.slice(0,s.length-v.length).replace(/(.)\/+$/,"$1")}const p=a[d];return f&&!p?u[h]=void 0:u[h]=(p||"").replace(/%2F/g,"/"),u},{}),pathname:s,pathnameBase:o,pattern:e}}function S_(e,t,n){t===void 0&&(t=!1),n===void 0&&(n=!0),Qh(e==="*"||!e.endsWith("*")||e.endsWith("/*"),'Route path "'+e+'" will be treated as if it were '+('"'+e.replace(/\*$/,"/*")+'" because the `*` character must ')+"always follow a `/` in the pattern. To get rid of this warning, "+('please change the route path to "'+e.replace(/\*$/,"/*")+'".'));let r=[],i="^"+e.replace(/\/*\*?$/,"").replace(/^\/*/,"/").replace(/[\\.*+^${}|()[\]]/g,"\\$&").replace(/\/:([\w-]+)(\?)?/g,(o,a,l)=>(r.push({paramName:a,isOptional:l!=null}),l?"/?([^\\/]+)?":"/([^\\/]+)"));return e.endsWith("*")?(r.push({paramName:"*"}),i+=e==="*"||e==="/*"?"(.*)$":"(?:\\/(.+)|\\/*)$"):n?i+="\\/*$":e!==""&&e!=="/"&&(i+="(?:(?=\\/|$))"),[new RegExp(i,t?void 0:"i"),r]}function __(e){try{return e.split("/").map(t=>decodeURIComponent(t).replace(/\//g,"%2F")).join("/")}catch(t){return Qh(!1,'The URL path "'+e+'" could not be decoded because it is is a malformed URL segment. This is probably due to a bad percent '+("encoding ("+t+").")),e}}function Fi(e,t){if(t==="/")return e;if(!e.toLowerCase().startsWith(t.toLowerCase()))return null;let n=t.endsWith("/")?t.length-1:t.length,r=e.charAt(n);return r&&r!=="/"?null:e.slice(n)||"/"}const C_=/^(?:[a-z][a-z0-9+.-]*:|\/\/)/i,E_=e=>C_.test(e);function T_(e,t){t===void 0&&(t="/");let{pathname:n,search:r="",hash:i=""}=typeof e=="string"?Wi(e):e,s;if(n)if(E_(n))s=n;else{if(n.includes("//")){let o=n;n=n.replace(/\/\/+/g,"/"),Qh(!1,"Pathnames cannot have embedded double slashes - normalizing "+(o+" -> "+n))}n.startsWith("/")?s=hm(n.substring(1),"/"):s=hm(n,t)}else s=t;return{pathname:s,search:R_(r),hash:O_(i)}}function hm(e,t){let n=t.replace(/\/+$/,"").split("/");return e.split("/").forEach(i=>{i===".."?n.length>1&&n.pop():i!=="."&&n.push(i)}),n.length>1?n.join("/"):"/"}function Du(e,t,n,r){return"Cannot include a '"+e+"' character in a manually specified "+("`to."+t+"` field ["+JSON.stringify(r)+"].  Please separate it out to the ")+("`to."+n+"` field. Alternatively you may provide the full path as ")+'a string in <Link to="..."> and the router will parse it for you.'}function P_(e){return e.filter((t,n)=>n===0||t.route.path&&t.route.path.length>0)}function Xh(e,t){let n=P_(e);return t?n.map((r,i)=>i===n.length-1?r.pathname:r.pathnameBase):n.map(r=>r.pathnameBase)}function Yh(e,t,n,r){r===void 0&&(r=!1);let i;typeof e=="string"?i=Wi(e):(i=oo({},e),be(!i.pathname||!i.pathname.includes("?"),Du("?","pathname","search",i)),be(!i.pathname||!i.pathname.includes("#"),Du("#","pathname","hash",i)),be(!i.search||!i.search.includes("#"),Du("#","search","hash",i)));let s=e===""||i.pathname==="",o=s?"/":i.pathname,a;if(o==null)a=n;else{let d=t.length-1;if(!r&&o.startsWith("..")){let h=o.split("/");for(;h[0]==="..";)h.shift(),d-=1;i.pathname=h.join("/")}a=d>=0?t[d]:"/"}let l=T_(i,a),u=o&&o!=="/"&&o.endsWith("/"),c=(s||o===".")&&n.endsWith("/");return!l.pathname.endsWith("/")&&(u||c)&&(l.pathname+="/"),l}const Zn=e=>e.join("/").replace(/\/\/+/g,"/"),A_=e=>e.replace(/\/+$/,"").replace(/^\/*/,"/"),R_=e=>!e||e==="?"?"":e.startsWith("?")?e:"?"+e,O_=e=>!e||e==="#"?"":e.startsWith("#")?e:"#"+e;function N_(e){return e!=null&&typeof e.status=="number"&&typeof e.statusText=="string"&&typeof e.internal=="boolean"&&"data"in e}const hx=["post","put","patch","delete"];new Set(hx);const j_=["get",...hx];new Set(j_);/**
 * React Router v6.30.3
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function ao(){return ao=Object.assign?Object.assign.bind():function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e},ao.apply(this,arguments)}const Ul=C.createContext(null),fx=C.createContext(null),An=C.createContext(null),Vl=C.createContext(null),un=C.createContext({outlet:null,matches:[],isDataRoute:!1}),px=C.createContext(null);function I_(e,t){let{relative:n}=t===void 0?{}:t;Gi()||be(!1);let{basename:r,navigator:i}=C.useContext(An),{hash:s,pathname:o,search:a}=zl(e,{relative:n}),l=o;return r!=="/"&&(l=o==="/"?r:Zn([r,o])),i.createHref({pathname:l,search:a,hash:s})}function Gi(){return C.useContext(Vl)!=null}function ur(){return Gi()||be(!1),C.useContext(Vl).location}function mx(e){C.useContext(An).static||C.useLayoutEffect(e)}function Zh(){let{isDataRoute:e}=C.useContext(un);return e?J_():D_()}function D_(){Gi()||be(!1);let e=C.useContext(Ul),{basename:t,future:n,navigator:r}=C.useContext(An),{matches:i}=C.useContext(un),{pathname:s}=ur(),o=JSON.stringify(Xh(i,n.v7_relativeSplatPath)),a=C.useRef(!1);return mx(()=>{a.current=!0}),C.useCallback(function(u,c){if(c===void 0&&(c={}),!a.current)return;if(typeof u=="number"){r.go(u);return}let d=Yh(u,JSON.parse(o),s,c.relative==="path");e==null&&t!=="/"&&(d.pathname=d.pathname==="/"?t:Zn([t,d.pathname])),(c.replace?r.replace:r.push)(d,c.state,c)},[t,r,o,s,e])}const L_=C.createContext(null);function M_(e){let t=C.useContext(un).outlet;return t&&C.createElement(L_.Provider,{value:e},t)}function ef(){let{matches:e}=C.useContext(un),t=e[e.length-1];return t?t.params:{}}function zl(e,t){let{relative:n}=t===void 0?{}:t,{future:r}=C.useContext(An),{matches:i}=C.useContext(un),{pathname:s}=ur(),o=JSON.stringify(Xh(i,r.v7_relativeSplatPath));return C.useMemo(()=>Yh(e,JSON.parse(o),s,n==="path"),[e,o,s,n])}function B_(e,t){return F_(e,t)}function F_(e,t,n,r){Gi()||be(!1);let{navigator:i}=C.useContext(An),{matches:s}=C.useContext(un),o=s[s.length-1],a=o?o.params:{};o&&o.pathname;let l=o?o.pathnameBase:"/";o&&o.route;let u=ur(),c;if(t){var d;let w=typeof t=="string"?Wi(t):t;l==="/"||(d=w.pathname)!=null&&d.startsWith(l)||be(!1),c=w}else c=u;let h=c.pathname||"/",f=h;if(l!=="/"){let w=l.replace(/^\//,"").split("/");f="/"+h.replace(/^\//,"").split("/").slice(w.length).join("/")}let p=d_(e,{pathname:f}),v=q_(p&&p.map(w=>Object.assign({},w,{params:Object.assign({},a,w.params),pathname:Zn([l,i.encodeLocation?i.encodeLocation(w.pathname).pathname:w.pathname]),pathnameBase:w.pathnameBase==="/"?l:Zn([l,i.encodeLocation?i.encodeLocation(w.pathnameBase).pathname:w.pathnameBase])})),s,n,r);return t&&v?C.createElement(Vl.Provider,{value:{location:ao({pathname:"/",search:"",hash:"",state:null,key:"default"},c),navigationType:qn.Pop}},v):v}function $_(){let e=K_(),t=N_(e)?e.status+" "+e.statusText:e instanceof Error?e.message:JSON.stringify(e),n=e instanceof Error?e.stack:null,i={padding:"0.5rem",backgroundColor:"rgba(200,200,200, 0.5)"};return C.createElement(C.Fragment,null,C.createElement("h2",null,"Unexpected Application Error!"),C.createElement("h3",{style:{fontStyle:"italic"}},t),n?C.createElement("pre",{style:i},n):null,null)}const U_=C.createElement($_,null);class V_ extends C.Component{constructor(t){super(t),this.state={location:t.location,revalidation:t.revalidation,error:t.error}}static getDerivedStateFromError(t){return{error:t}}static getDerivedStateFromProps(t,n){return n.location!==t.location||n.revalidation!=="idle"&&t.revalidation==="idle"?{error:t.error,location:t.location,revalidation:t.revalidation}:{error:t.error!==void 0?t.error:n.error,location:n.location,revalidation:t.revalidation||n.revalidation}}componentDidCatch(t,n){console.error("React Router caught the following error during render",t,n)}render(){return this.state.error!==void 0?C.createElement(un.Provider,{value:this.props.routeContext},C.createElement(px.Provider,{value:this.state.error,children:this.props.component})):this.props.children}}function z_(e){let{routeContext:t,match:n,children:r}=e,i=C.useContext(Ul);return i&&i.static&&i.staticContext&&(n.route.errorElement||n.route.ErrorBoundary)&&(i.staticContext._deepestRenderedBoundaryId=n.route.id),C.createElement(un.Provider,{value:t},r)}function q_(e,t,n,r){var i;if(t===void 0&&(t=[]),n===void 0&&(n=null),r===void 0&&(r=null),e==null){var s;if(!n)return null;if(n.errors)e=n.matches;else if((s=r)!=null&&s.v7_partialHydration&&t.length===0&&!n.initialized&&n.matches.length>0)e=n.matches;else return null}let o=e,a=(i=n)==null?void 0:i.errors;if(a!=null){let c=o.findIndex(d=>d.route.id&&(a==null?void 0:a[d.route.id])!==void 0);c>=0||be(!1),o=o.slice(0,Math.min(o.length,c+1))}let l=!1,u=-1;if(n&&r&&r.v7_partialHydration)for(let c=0;c<o.length;c++){let d=o[c];if((d.route.HydrateFallback||d.route.hydrateFallbackElement)&&(u=c),d.route.id){let{loaderData:h,errors:f}=n,p=d.route.loader&&h[d.route.id]===void 0&&(!f||f[d.route.id]===void 0);if(d.route.lazy||p){l=!0,u>=0?o=o.slice(0,u+1):o=[o[0]];break}}}return o.reduceRight((c,d,h)=>{let f,p=!1,v=null,w=null;n&&(f=a&&d.route.id?a[d.route.id]:void 0,v=d.route.errorElement||U_,l&&(u<0&&h===0?(Q_("route-fallback"),p=!0,w=null):u===h&&(p=!0,w=d.route.hydrateFallbackElement||null)));let m=t.concat(o.slice(0,h+1)),g=()=>{let y;return f?y=v:p?y=w:d.route.Component?y=C.createElement(d.route.Component,null):d.route.element?y=d.route.element:y=c,C.createElement(z_,{match:d,routeContext:{outlet:c,matches:m,isDataRoute:n!=null},children:y})};return n&&(d.route.ErrorBoundary||d.route.errorElement||h===0)?C.createElement(V_,{location:n.location,revalidation:n.revalidation,component:v,error:f,children:g(),routeContext:{outlet:null,matches:m,isDataRoute:!0}}):g()},null)}var gx=function(e){return e.UseBlocker="useBlocker",e.UseRevalidator="useRevalidator",e.UseNavigateStable="useNavigate",e}(gx||{}),yx=function(e){return e.UseBlocker="useBlocker",e.UseLoaderData="useLoaderData",e.UseActionData="useActionData",e.UseRouteError="useRouteError",e.UseNavigation="useNavigation",e.UseRouteLoaderData="useRouteLoaderData",e.UseMatches="useMatches",e.UseRevalidator="useRevalidator",e.UseNavigateStable="useNavigate",e.UseRouteId="useRouteId",e}(yx||{});function H_(e){let t=C.useContext(Ul);return t||be(!1),t}function W_(e){let t=C.useContext(fx);return t||be(!1),t}function G_(e){let t=C.useContext(un);return t||be(!1),t}function vx(e){let t=G_(),n=t.matches[t.matches.length-1];return n.route.id||be(!1),n.route.id}function K_(){var e;let t=C.useContext(px),n=W_(),r=vx();return t!==void 0?t:(e=n.errors)==null?void 0:e[r]}function J_(){let{router:e}=H_(gx.UseNavigateStable),t=vx(yx.UseNavigateStable),n=C.useRef(!1);return mx(()=>{n.current=!0}),C.useCallback(function(i,s){s===void 0&&(s={}),n.current&&(typeof i=="number"?e.navigate(i):e.navigate(i,ao({fromRouteId:t},s)))},[e,t])}const fm={};function Q_(e,t,n){fm[e]||(fm[e]=!0)}function X_(e,t){e==null||e.v7_startTransition,e==null||e.v7_relativeSplatPath}function Y_(e){let{to:t,replace:n,state:r,relative:i}=e;Gi()||be(!1);let{future:s,static:o}=C.useContext(An),{matches:a}=C.useContext(un),{pathname:l}=ur(),u=Zh(),c=Yh(t,Xh(a,s.v7_relativeSplatPath),l,i==="path"),d=JSON.stringify(c);return C.useEffect(()=>u(JSON.parse(d),{replace:n,state:r,relative:i}),[u,d,i,n,r]),null}function xx(e){return M_(e.context)}function Ft(e){be(!1)}function Z_(e){let{basename:t="/",children:n=null,location:r,navigationType:i=qn.Pop,navigator:s,static:o=!1,future:a}=e;Gi()&&be(!1);let l=t.replace(/^\/*/,"/"),u=C.useMemo(()=>({basename:l,navigator:s,static:o,future:ao({v7_relativeSplatPath:!1},a)}),[l,a,s,o]);typeof r=="string"&&(r=Wi(r));let{pathname:c="/",search:d="",hash:h="",state:f=null,key:p="default"}=r,v=C.useMemo(()=>{let w=Fi(c,l);return w==null?null:{location:{pathname:w,search:d,hash:h,state:f,key:p},navigationType:i}},[l,c,d,h,f,p,i]);return v==null?null:C.createElement(An.Provider,{value:u},C.createElement(Vl.Provider,{children:n,value:v}))}function eC(e){let{children:t,location:n}=e;return B_(fd(t),n)}new Promise(()=>{});function fd(e,t){t===void 0&&(t=[]);let n=[];return C.Children.forEach(e,(r,i)=>{if(!C.isValidElement(r))return;let s=[...t,i];if(r.type===C.Fragment){n.push.apply(n,fd(r.props.children,s));return}r.type!==Ft&&be(!1),!r.props.index||!r.props.children||be(!1);let o={id:r.props.id||s.join("-"),caseSensitive:r.props.caseSensitive,element:r.props.element,Component:r.props.Component,index:r.props.index,path:r.props.path,loader:r.props.loader,action:r.props.action,errorElement:r.props.errorElement,ErrorBoundary:r.props.ErrorBoundary,hasErrorBoundary:r.props.ErrorBoundary!=null||r.props.errorElement!=null,shouldRevalidate:r.props.shouldRevalidate,handle:r.props.handle,lazy:r.props.lazy};r.props.children&&(o.children=fd(r.props.children,s)),n.push(o)}),n}/**
 * React Router DOM v6.30.3
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function ol(){return ol=Object.assign?Object.assign.bind():function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e},ol.apply(this,arguments)}function wx(e,t){if(e==null)return{};var n={},r=Object.keys(e),i,s;for(s=0;s<r.length;s++)i=r[s],!(t.indexOf(i)>=0)&&(n[i]=e[i]);return n}function tC(e){return!!(e.metaKey||e.altKey||e.ctrlKey||e.shiftKey)}function nC(e,t){return e.button===0&&(!t||t==="_self")&&!tC(e)}const rC=["onClick","relative","reloadDocument","replace","state","target","to","preventScrollReset","viewTransition"],iC=["aria-current","caseSensitive","className","end","style","to","viewTransition","children"],sC="6";try{window.__reactRouterVersion=sC}catch{}const oC=C.createContext({isTransitioning:!1}),aC="startTransition",pm=Qk[aC];function lC(e){let{basename:t,children:n,future:r,window:i}=e,s=C.useRef();s.current==null&&(s.current=l_({window:i,v5Compat:!0}));let o=s.current,[a,l]=C.useState({action:o.action,location:o.location}),{v7_startTransition:u}=r||{},c=C.useCallback(d=>{u&&pm?pm(()=>l(d)):l(d)},[l,u]);return C.useLayoutEffect(()=>o.listen(c),[o,c]),C.useEffect(()=>X_(r),[r]),C.createElement(Z_,{basename:t,children:n,location:a.location,navigationType:a.action,navigator:o,future:r})}const uC=typeof window<"u"&&typeof window.document<"u"&&typeof window.document.createElement<"u",cC=/^(?:[a-z][a-z0-9+.-]*:|\/\/)/i,Fe=C.forwardRef(function(t,n){let{onClick:r,relative:i,reloadDocument:s,replace:o,state:a,target:l,to:u,preventScrollReset:c,viewTransition:d}=t,h=wx(t,rC),{basename:f}=C.useContext(An),p,v=!1;if(typeof u=="string"&&cC.test(u)&&(p=u,uC))try{let y=new URL(window.location.href),k=u.startsWith("//")?new URL(y.protocol+u):new URL(u),T=Fi(k.pathname,f);k.origin===y.origin&&T!=null?u=T+k.search+k.hash:v=!0}catch{}let w=I_(u,{relative:i}),m=hC(u,{replace:o,state:a,target:l,preventScrollReset:c,relative:i,viewTransition:d});function g(y){r&&r(y),y.defaultPrevented||m(y)}return C.createElement("a",ol({},h,{href:p||w,onClick:v||s?r:g,ref:n,target:l}))}),Zo=C.forwardRef(function(t,n){let{"aria-current":r="page",caseSensitive:i=!1,className:s="",end:o=!1,style:a,to:l,viewTransition:u,children:c}=t,d=wx(t,iC),h=zl(l,{relative:d.relative}),f=ur(),p=C.useContext(fx),{navigator:v,basename:w}=C.useContext(An),m=p!=null&&fC(h)&&u===!0,g=v.encodeLocation?v.encodeLocation(h).pathname:h.pathname,y=f.pathname,k=p&&p.navigation&&p.navigation.location?p.navigation.location.pathname:null;i||(y=y.toLowerCase(),k=k?k.toLowerCase():null,g=g.toLowerCase()),k&&w&&(k=Fi(k,w)||k);const T=g!=="/"&&g.endsWith("/")?g.length-1:g.length;let S=y===g||!o&&y.startsWith(g)&&y.charAt(T)==="/",P=k!=null&&(k===g||!o&&k.startsWith(g)&&k.charAt(g.length)==="/"),A={isActive:S,isPending:P,isTransitioning:m},O=S?r:void 0,E;typeof s=="function"?E=s(A):E=[s,S?"active":null,P?"pending":null,m?"transitioning":null].filter(Boolean).join(" ");let L=typeof a=="function"?a(A):a;return C.createElement(Fe,ol({},d,{"aria-current":O,className:E,ref:n,style:L,to:l,viewTransition:u}),typeof c=="function"?c(A):c)});var pd;(function(e){e.UseScrollRestoration="useScrollRestoration",e.UseSubmit="useSubmit",e.UseSubmitFetcher="useSubmitFetcher",e.UseFetcher="useFetcher",e.useViewTransitionState="useViewTransitionState"})(pd||(pd={}));var mm;(function(e){e.UseFetcher="useFetcher",e.UseFetchers="useFetchers",e.UseScrollRestoration="useScrollRestoration"})(mm||(mm={}));function dC(e){let t=C.useContext(Ul);return t||be(!1),t}function hC(e,t){let{target:n,replace:r,state:i,preventScrollReset:s,relative:o,viewTransition:a}=t===void 0?{}:t,l=Zh(),u=ur(),c=zl(e,{relative:o});return C.useCallback(d=>{if(nC(d,n)){d.preventDefault();let h=r!==void 0?r:sl(u)===sl(c);l(e,{replace:h,state:i,preventScrollReset:s,relative:o,viewTransition:a})}},[u,l,c,r,i,n,e,s,o,a])}function fC(e,t){t===void 0&&(t={});let n=C.useContext(oC);n==null&&be(!1);let{basename:r}=dC(pd.useViewTransitionState),i=zl(e,{relative:t.relative});if(!n.isTransitioning)return!1;let s=Fi(n.currentLocation.pathname,r)||n.currentLocation.pathname,o=Fi(n.nextLocation.pathname,r)||n.nextLocation.pathname;return hd(i.pathname,o)!=null||hd(i.pathname,s)!=null}const Kr=[{level:1,title:"菜鳥工程師",minXp:0},{level:2,title:"菜鳥工程師",minXp:100},{level:3,title:"菜鳥工程師",minXp:200},{level:4,title:"菜鳥工程師",minXp:350},{level:5,title:"初級開發者",minXp:500},{level:6,title:"初級開發者",minXp:700},{level:7,title:"初級開發者",minXp:900},{level:8,title:"初級開發者",minXp:1100},{level:10,title:"純函式戰士",minXp:1200},{level:12,title:"純函式戰士",minXp:1600},{level:15,title:"SQL 探險家",minXp:2e3},{level:18,title:"SQL 探險家",minXp:2500},{level:20,title:"React 騎士",minXp:3e3},{level:22,title:"React 騎士",minXp:3500},{level:25,title:"Agent 術士",minXp:4500},{level:28,title:"Agent 術士",minXp:5200},{level:30,title:"供應鏈大師",minXp:6e3}];function pC(e){let t=Kr[0],n=Kr[1];for(let r=Kr.length-1;r>=0;r--)if(e>=Kr[r].minXp){t=Kr[r],n=Kr[r+1]||null;break}return{level:t.level,title:t.title,currentXp:e,xpForNext:n?n.minXp:t.minXp,progress:n?(e-t.minXp)/(n.minXp-t.minXp):1}}function mC(e,{usedHints:t=0,attempts:n=1}){let r=e;return t===0&&n===1?r=Math.floor(r*1.5):t>0&&(r=Math.max(10,r-t*20)),r}const kx=C.createContext(null),bx="di-quest-progress",md={totalXp:0,questStatus:{},challengeStatus:{},achievements:[],streakDays:0,lastActiveDate:null,devMode:!1};function gC(){try{const e=localStorage.getItem(bx);if(e)return{...md,...JSON.parse(e)}}catch{}return md}function yC(e){try{localStorage.setItem(bx,JSON.stringify(e))}catch{}}function vC(e,t){switch(t.type){case"COMPLETE_CHALLENGE":{const{questId:n,challengeId:r,score:i,code:s,usedHints:o,attempts:a}=t.payload,l=`${n}-${r}`,u=e.challengeStatus[l];if(u!=null&&u.completed)return e;const c=t.payload.baseXp||50,d=mC(c,{usedHints:o,attempts:a});return{...e,totalXp:e.totalXp+d,challengeStatus:{...e.challengeStatus,[l]:{completed:!0,score:i,usedHints:o,attempts:a,code:s,earnedXp:d}}}}case"COMPLETE_QUEST":{const{questId:n,score:r}=t.payload,i=e.questStatus[n];return i!=null&&i.completed?e:{...e,totalXp:e.totalXp+(t.payload.bonusXp||0),questStatus:{...e.questStatus,[n]:{completed:!0,score:r,completedAt:new Date().toISOString()}}}}case"UNLOCK_ACHIEVEMENT":return e.achievements.includes(t.payload)?e:{...e,achievements:[...e.achievements,t.payload]};case"UPDATE_STREAK":{const n=new Date().toISOString().slice(0,10);if(e.lastActiveDate===n)return e;const r=new Date(Date.now()-864e5).toISOString().slice(0,10),i=e.lastActiveDate===r?e.streakDays+1:1;return{...e,streakDays:i,lastActiveDate:n}}case"TOGGLE_DEV_MODE":return{...e,devMode:!e.devMode};case"RESET":return md;default:return e}}function xC({children:e}){const[t,n]=C.useReducer(vC,null,gC);C.useEffect(()=>{yC(t)},[t]),C.useEffect(()=>{n({type:"UPDATE_STREAK"})},[]);const r=pC(t.totalXp),a={...t,levelInfo:r,dispatch:n,isQuestUnlocked:l=>{var h,f;if(t.devMode)return!0;const[u,c]=l.split("-").map(Number);if(u===1&&c===1)return!0;if(c>1){const p=`${u}-${c-1}`;return!!((h=t.questStatus[p])!=null&&h.completed)}const d=`${u-1}-6`;return!!((f=t.questStatus[d])!=null&&f.completed)},isWorldUnlocked:l=>{var c;if(t.devMode||l===1)return!0;const u=`${l-1}-6`;return!!((c=t.questStatus[u])!=null&&c.completed)},getQuestProgress:(l,u)=>{var d;let c=0;for(let h=1;h<=u;h++)(d=t.challengeStatus[`${l}-${h}`])!=null&&d.completed&&c++;return c}};return x.jsx(kx.Provider,{value:a,children:e})}function Ki(){const e=C.useContext(kx);if(!e)throw new Error("useQuest must be used inside <QuestProvider>");return e}/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */var wC={xmlns:"http://www.w3.org/2000/svg",width:24,height:24,viewBox:"0 0 24 24",fill:"none",stroke:"currentColor",strokeWidth:2,strokeLinecap:"round",strokeLinejoin:"round"};/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const kC=e=>e.replace(/([a-z0-9])([A-Z])/g,"$1-$2").toLowerCase().trim(),ae=(e,t)=>{const n=C.forwardRef(({color:r="currentColor",size:i=24,strokeWidth:s=2,absoluteStrokeWidth:o,className:a="",children:l,...u},c)=>C.createElement("svg",{ref:c,...wC,width:i,height:i,stroke:r,strokeWidth:o?Number(s)*24/Number(i):s,className:["lucide",`lucide-${kC(e)}`,a].join(" "),...u},[...t.map(([d,h])=>C.createElement(d,h)),...Array.isArray(l)?l:[l]]));return n.displayName=`${e}`,n};/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const tf=ae("ArrowLeft",[["path",{d:"m12 19-7-7 7-7",key:"1l729n"}],["path",{d:"M19 12H5",key:"x3x0zl"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const bC=ae("Award",[["circle",{cx:"12",cy:"8",r:"6",key:"1vp47v"}],["path",{d:"M15.477 12.89 17 22l-5-3-5 3 1.523-9.11",key:"em7aur"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const SC=ae("BarChart3",[["path",{d:"M3 3v18h18",key:"1s2lah"}],["path",{d:"M18 17V9",key:"2bz60n"}],["path",{d:"M13 17V5",key:"1frdt8"}],["path",{d:"M8 17v-3",key:"17ska0"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const jr=ae("BookOpen",[["path",{d:"M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z",key:"vv98re"}],["path",{d:"M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z",key:"1cyq3y"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const gm=ae("Bot",[["path",{d:"M12 8V4H8",key:"hb8ula"}],["rect",{width:"16",height:"12",x:"4",y:"8",rx:"2",key:"enze0r"}],["path",{d:"M2 14h2",key:"vft8re"}],["path",{d:"M20 14h2",key:"4cs60a"}],["path",{d:"M15 13v2",key:"1xurst"}],["path",{d:"M9 13v2",key:"rq6x2g"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const al=ae("CheckCircle",[["path",{d:"M22 11.08V12a10 10 0 1 1-5.93-9.14",key:"g774vq"}],["path",{d:"m9 11 3 3L22 4",key:"1pflzl"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const _C=ae("ChevronDown",[["path",{d:"m6 9 6 6 6-6",key:"qrunsl"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const CC=ae("ChevronLeft",[["path",{d:"m15 18-6-6 6-6",key:"1wnfg3"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const ym=ae("ChevronRight",[["path",{d:"m9 18 6-6-6-6",key:"mthhwq"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const EC=ae("ChevronUp",[["path",{d:"m18 15-6-6-6 6",key:"153udz"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const vm=ae("Circle",[["circle",{cx:"12",cy:"12",r:"10",key:"1mglay"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const TC=ae("Clock",[["circle",{cx:"12",cy:"12",r:"10",key:"1mglay"}],["polyline",{points:"12 6 12 12 16 14",key:"68esgv"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const PC=ae("Code",[["polyline",{points:"16 18 22 12 16 6",key:"z7tu5w"}],["polyline",{points:"8 6 2 12 8 18",key:"1eg1df"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const AC=ae("Flame",[["path",{d:"M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 2.5z",key:"96xj49"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const RC=ae("GraduationCap",[["path",{d:"M22 10v6M2 10l10-5 10 5-10 5z",key:"1ef52a"}],["path",{d:"M6 12v5c3 3 9 3 12 0v-5",key:"1f75yj"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const Sx=ae("HelpCircle",[["circle",{cx:"12",cy:"12",r:"10",key:"1mglay"}],["path",{d:"M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3",key:"1u773s"}],["path",{d:"M12 17h.01",key:"p32p05"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const OC=ae("Lightbulb",[["path",{d:"M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1 .2 2.2 1.5 3.5.7.7 1.3 1.5 1.5 2.5",key:"1gvzjb"}],["path",{d:"M9 18h6",key:"x1upvd"}],["path",{d:"M10 22h4",key:"ceow96"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const xm=ae("Lock",[["rect",{width:"18",height:"11",x:"3",y:"11",rx:"2",ry:"2",key:"1w4ew1"}],["path",{d:"M7 11V7a5 5 0 0 1 10 0v4",key:"fwvmzm"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const gd=ae("Map",[["polygon",{points:"3 6 9 3 15 6 21 3 21 18 15 21 9 18 3 21",key:"ok2ie8"}],["line",{x1:"9",x2:"9",y1:"3",y2:"18",key:"w34qz5"}],["line",{x1:"15",x2:"15",y1:"6",y2:"21",key:"volv9a"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const NC=ae("MessageCircle",[["path",{d:"M7.9 20A9 9 0 1 0 4 16.1L2 22Z",key:"vv11sd"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const yd=ae("Play",[["polygon",{points:"5 3 19 12 5 21 5 3",key:"191637"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const jC=ae("RotateCcw",[["path",{d:"M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8",key:"1357e3"}],["path",{d:"M3 3v5h5",key:"1xhq8a"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const _x=ae("Send",[["path",{d:"m22 2-7 20-4-9-9-4Z",key:"1q3vgg"}],["path",{d:"M22 2 11 13",key:"nzbqef"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const IC=ae("Sparkles",[["path",{d:"m12 3-1.912 5.813a2 2 0 0 1-1.275 1.275L3 12l5.813 1.912a2 2 0 0 1 1.275 1.275L12 21l1.912-5.813a2 2 0 0 1 1.275-1.275L21 12l-5.813-1.912a2 2 0 0 1-1.275-1.275L12 3Z",key:"17u4zn"}],["path",{d:"M5 3v4",key:"bklmnn"}],["path",{d:"M19 17v4",key:"iiml17"}],["path",{d:"M3 5h4",key:"nem4j1"}],["path",{d:"M17 19h4",key:"lbex7p"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const DC=ae("Swords",[["polyline",{points:"14.5 17.5 3 6 3 3 6 3 17.5 14.5",key:"1hfsw2"}],["line",{x1:"13",x2:"19",y1:"19",y2:"13",key:"1vrmhu"}],["line",{x1:"16",x2:"20",y1:"16",y2:"20",key:"1bron3"}],["line",{x1:"19",x2:"21",y1:"21",y2:"19",key:"13pww6"}],["polyline",{points:"14.5 6.5 18 3 21 3 21 6 17.5 9.5",key:"hbey2j"}],["line",{x1:"5",x2:"9",y1:"14",y2:"18",key:"1hf58s"}],["line",{x1:"7",x2:"4",y1:"17",y2:"20",key:"pidxm4"}],["line",{x1:"3",x2:"5",y1:"19",y2:"21",key:"1pehsh"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const LC=ae("Target",[["circle",{cx:"12",cy:"12",r:"10",key:"1mglay"}],["circle",{cx:"12",cy:"12",r:"6",key:"1vlfrh"}],["circle",{cx:"12",cy:"12",r:"2",key:"1c9p78"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const MC=ae("TrendingUp",[["polyline",{points:"22 7 13.5 15.5 8.5 10.5 2 17",key:"126l90"}],["polyline",{points:"16 7 22 7 22 13",key:"kwv8wd"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const Cx=ae("Trophy",[["path",{d:"M6 9H4.5a2.5 2.5 0 0 1 0-5H6",key:"17hqa7"}],["path",{d:"M18 9h1.5a2.5 2.5 0 0 0 0-5H18",key:"lmptdp"}],["path",{d:"M4 22h16",key:"57wxv0"}],["path",{d:"M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22",key:"1nw9bq"}],["path",{d:"M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22",key:"1np0yb"}],["path",{d:"M18 2H6v7a6 6 0 0 0 12 0V2Z",key:"u46fv3"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const BC=ae("Unlock",[["rect",{width:"18",height:"11",x:"3",y:"11",rx:"2",ry:"2",key:"1w4ew1"}],["path",{d:"M7 11V7a5 5 0 0 1 9.9-1",key:"1mm8w8"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const FC=ae("User",[["path",{d:"M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2",key:"975kel"}],["circle",{cx:"12",cy:"7",r:"4",key:"17ys0d"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const $C=ae("XCircle",[["circle",{cx:"12",cy:"12",r:"10",key:"1mglay"}],["path",{d:"m15 9-6 6",key:"1uzhvr"}],["path",{d:"m9 9 6 6",key:"z0biqf"}]]);/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const wm=ae("Zap",[["polygon",{points:"13 2 3 14 12 14 11 22 21 10 12 10 13 2",key:"45s27k"}]]);function UC(){const{levelInfo:e,devMode:t,dispatch:n}=Ki(),i=ur().pathname.includes("/arena");return x.jsxs("div",{className:"min-h-screen flex flex-col",children:[x.jsx("nav",{className:"bg-brand-dark border-b border-slate-700 px-6 py-4",children:x.jsxs("div",{className:"max-w-7xl mx-auto flex items-center justify-between",children:[x.jsxs(Zo,{to:"/di-quest",className:"flex items-center gap-3",children:[x.jsx("div",{className:"w-10 h-10 bg-gradient-to-br from-brand-primary to-brand-secondary rounded-lg flex items-center justify-center",children:x.jsx(DC,{className:"w-5 h-5 text-white"})}),x.jsxs("div",{children:[x.jsx("h1",{className:"text-xl font-bold text-white",children:"DI Quest"}),x.jsx("p",{className:"text-xs text-slate-400",children:"從你自己的專案學會寫程式"})]})]}),x.jsxs("div",{className:"flex items-center gap-4",children:[x.jsxs("div",{className:"flex items-center gap-2",children:[x.jsxs("span",{className:"text-brand-accent font-bold",children:["Lv.",e.level]}),x.jsx("span",{className:"text-slate-400 text-sm",children:e.title})]}),x.jsx("div",{className:"w-32 progress-bar",children:x.jsx("div",{className:"progress-fill",style:{width:`${Math.round(e.progress*100)}%`}})}),x.jsxs("span",{className:"text-slate-500 text-xs",children:[e.currentXp," XP"]}),x.jsxs("button",{onClick:()=>n({type:"TOGGLE_DEV_MODE"}),className:`ml-2 px-3 py-1 rounded text-xs font-mono transition-colors ${t?"bg-amber-500/20 text-amber-400 border border-amber-500/50":"bg-slate-800 text-slate-500 border border-slate-700 hover:text-slate-300"}`,title:"開發者模式：解鎖全部關卡",children:[x.jsx(BC,{className:"w-3 h-3 inline mr-1"}),t?"DEV ON":"DEV"]})]})]})}),t&&x.jsx("div",{className:"bg-amber-500/10 border-b border-amber-500/30 px-4 py-1.5 text-center",children:x.jsx("span",{className:"text-amber-400 text-xs font-mono",children:"🔓 開發者模式：全部關卡已解鎖"})}),x.jsx("main",{className:"flex-1",children:x.jsx(xx,{})}),x.jsxs("div",{className:`fixed flex flex-col gap-3 z-50 transition-all duration-300 ${i?"bottom-3 right-3 scale-75 opacity-70 hover:opacity-100 hover:scale-100":"bottom-6 right-6"}`,children:[x.jsx(Zo,{to:"/di-quest/map",className:({isActive:s})=>`w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors ${s?"bg-brand-primary text-white":"bg-slate-800 text-slate-400 hover:bg-slate-700"}`,title:"關卡地圖",children:x.jsx(gd,{className:"w-5 h-5"})}),x.jsx(Zo,{to:"/di-quest/progress",className:({isActive:s})=>`w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors ${s?"bg-brand-secondary text-white":"bg-slate-800 text-slate-400 hover:bg-slate-700"}`,title:"進度儀表板",children:x.jsx(SC,{className:"w-5 h-5"})}),x.jsx(Zo,{to:"/di-quest/chat",className:({isActive:s})=>`w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors ${s?"bg-brand-accent text-white":"bg-slate-800 text-slate-400 hover:bg-slate-700"}`,title:"問小迪",children:x.jsx(NC,{className:"w-5 h-5"})})]})]})}function VC(){return x.jsx("div",{className:"min-h-[calc(100vh-73px)]",children:x.jsx(xx,{})})}const Ex=C.createContext({transformPagePoint:e=>e,isStatic:!1,reducedMotion:"never"}),ql=C.createContext({}),Hl=C.createContext(null),Wl=typeof document<"u",nf=Wl?C.useLayoutEffect:C.useEffect,Tx=C.createContext({strict:!1}),rf=e=>e.replace(/([a-z])([A-Z])/g,"$1-$2").toLowerCase(),zC="framerAppearId",Px="data-"+rf(zC);function qC(e,t,n,r){const{visualElement:i}=C.useContext(ql),s=C.useContext(Tx),o=C.useContext(Hl),a=C.useContext(Ex).reducedMotion,l=C.useRef();r=r||s.renderer,!l.current&&r&&(l.current=r(e,{visualState:t,parent:i,props:n,presenceContext:o,blockInitialAnimation:o?o.initial===!1:!1,reducedMotionConfig:a}));const u=l.current;C.useInsertionEffect(()=>{u&&u.update(n,o)});const c=C.useRef(!!(n[Px]&&!window.HandoffComplete));return nf(()=>{u&&(u.render(),c.current&&u.animationState&&u.animationState.animateChanges())}),C.useEffect(()=>{u&&(u.updateFeatures(),!c.current&&u.animationState&&u.animationState.animateChanges(),c.current&&(c.current=!1,window.HandoffComplete=!0))}),u}function xi(e){return e&&typeof e=="object"&&Object.prototype.hasOwnProperty.call(e,"current")}function HC(e,t,n){return C.useCallback(r=>{r&&e.mount&&e.mount(r),t&&(r?t.mount(r):t.unmount()),n&&(typeof n=="function"?n(r):xi(n)&&(n.current=r))},[t])}function lo(e){return typeof e=="string"||Array.isArray(e)}function Gl(e){return e!==null&&typeof e=="object"&&typeof e.start=="function"}const sf=["animate","whileInView","whileFocus","whileHover","whileTap","whileDrag","exit"],of=["initial",...sf];function Kl(e){return Gl(e.animate)||of.some(t=>lo(e[t]))}function Ax(e){return!!(Kl(e)||e.variants)}function WC(e,t){if(Kl(e)){const{initial:n,animate:r}=e;return{initial:n===!1||lo(n)?n:void 0,animate:lo(r)?r:void 0}}return e.inherit!==!1?t:{}}function GC(e){const{initial:t,animate:n}=WC(e,C.useContext(ql));return C.useMemo(()=>({initial:t,animate:n}),[km(t),km(n)])}function km(e){return Array.isArray(e)?e.join(" "):e}const bm={animation:["animate","variants","whileHover","whileTap","exit","whileInView","whileFocus","whileDrag"],exit:["exit"],drag:["drag","dragControls"],focus:["whileFocus"],hover:["whileHover","onHoverStart","onHoverEnd"],tap:["whileTap","onTap","onTapStart","onTapCancel"],pan:["onPan","onPanStart","onPanSessionStart","onPanEnd"],inView:["whileInView","onViewportEnter","onViewportLeave"],layout:["layout","layoutId"]},uo={};for(const e in bm)uo[e]={isEnabled:t=>bm[e].some(n=>!!t[n])};function KC(e){for(const t in e)uo[t]={...uo[t],...e[t]}}const af=C.createContext({}),Rx=C.createContext({}),JC=Symbol.for("motionComponentSymbol");function QC({preloadedFeatures:e,createVisualElement:t,useRender:n,useVisualState:r,Component:i}){e&&KC(e);function s(a,l){let u;const c={...C.useContext(Ex),...a,layoutId:XC(a)},{isStatic:d}=c,h=GC(a),f=r(a,d);if(!d&&Wl){h.visualElement=qC(i,f,c,t);const p=C.useContext(Rx),v=C.useContext(Tx).strict;h.visualElement&&(u=h.visualElement.loadFeatures(c,v,e,p))}return C.createElement(ql.Provider,{value:h},u&&h.visualElement?C.createElement(u,{visualElement:h.visualElement,...c}):null,n(i,a,HC(f,h.visualElement,l),f,d,h.visualElement))}const o=C.forwardRef(s);return o[JC]=i,o}function XC({layoutId:e}){const t=C.useContext(af).id;return t&&e!==void 0?t+"-"+e:e}function YC(e){function t(r,i={}){return QC(e(r,i))}if(typeof Proxy>"u")return t;const n=new Map;return new Proxy(t,{get:(r,i)=>(n.has(i)||n.set(i,t(i)),n.get(i))})}const ZC=["animate","circle","defs","desc","ellipse","g","image","line","filter","marker","mask","metadata","path","pattern","polygon","polyline","rect","stop","switch","symbol","svg","text","tspan","use","view"];function lf(e){return typeof e!="string"||e.includes("-")?!1:!!(ZC.indexOf(e)>-1||/[A-Z]/.test(e))}const ll={};function eE(e){Object.assign(ll,e)}const To=["transformPerspective","x","y","z","translateX","translateY","translateZ","scale","scaleX","scaleY","rotate","rotateX","rotateY","rotateZ","skew","skewX","skewY"],zr=new Set(To);function Ox(e,{layout:t,layoutId:n}){return zr.has(e)||e.startsWith("origin")||(t||n!==void 0)&&(!!ll[e]||e==="opacity")}const ct=e=>!!(e&&e.getVelocity),tE={x:"translateX",y:"translateY",z:"translateZ",transformPerspective:"perspective"},nE=To.length;function rE(e,{enableHardwareAcceleration:t=!0,allowTransformNone:n=!0},r,i){let s="";for(let o=0;o<nE;o++){const a=To[o];if(e[a]!==void 0){const l=tE[a]||a;s+=`${l}(${e[a]}) `}}return t&&!e.z&&(s+="translateZ(0)"),s=s.trim(),i?s=i(e,r?"":s):n&&r&&(s="none"),s}const Nx=e=>t=>typeof t=="string"&&t.startsWith(e),jx=Nx("--"),vd=Nx("var(--"),iE=/var\s*\(\s*--[\w-]+(\s*,\s*(?:(?:[^)(]|\((?:[^)(]+|\([^)(]*\))*\))*)+)?\s*\)/g,sE=(e,t)=>t&&typeof e=="number"?t.transform(e):e,ir=(e,t,n)=>Math.min(Math.max(n,e),t),qr={test:e=>typeof e=="number",parse:parseFloat,transform:e=>e},Os={...qr,transform:e=>ir(0,1,e)},ea={...qr,default:1},Ns=e=>Math.round(e*1e5)/1e5,Jl=/(-)?([\d]*\.?[\d])+/g,Ix=/(#[0-9a-f]{3,8}|(rgb|hsl)a?\((-?[\d\.]+%?[,\s]+){2}(-?[\d\.]+%?)\s*[\,\/]?\s*[\d\.]*%?\))/gi,oE=/^(#[0-9a-f]{3,8}|(rgb|hsl)a?\((-?[\d\.]+%?[,\s]+){2}(-?[\d\.]+%?)\s*[\,\/]?\s*[\d\.]*%?\))$/i;function Po(e){return typeof e=="string"}const Ao=e=>({test:t=>Po(t)&&t.endsWith(e)&&t.split(" ").length===1,parse:parseFloat,transform:t=>`${t}${e}`}),In=Ao("deg"),an=Ao("%"),Q=Ao("px"),aE=Ao("vh"),lE=Ao("vw"),Sm={...an,parse:e=>an.parse(e)/100,transform:e=>an.transform(e*100)},_m={...qr,transform:Math.round},Dx={borderWidth:Q,borderTopWidth:Q,borderRightWidth:Q,borderBottomWidth:Q,borderLeftWidth:Q,borderRadius:Q,radius:Q,borderTopLeftRadius:Q,borderTopRightRadius:Q,borderBottomRightRadius:Q,borderBottomLeftRadius:Q,width:Q,maxWidth:Q,height:Q,maxHeight:Q,size:Q,top:Q,right:Q,bottom:Q,left:Q,padding:Q,paddingTop:Q,paddingRight:Q,paddingBottom:Q,paddingLeft:Q,margin:Q,marginTop:Q,marginRight:Q,marginBottom:Q,marginLeft:Q,rotate:In,rotateX:In,rotateY:In,rotateZ:In,scale:ea,scaleX:ea,scaleY:ea,scaleZ:ea,skew:In,skewX:In,skewY:In,distance:Q,translateX:Q,translateY:Q,translateZ:Q,x:Q,y:Q,z:Q,perspective:Q,transformPerspective:Q,opacity:Os,originX:Sm,originY:Sm,originZ:Q,zIndex:_m,fillOpacity:Os,strokeOpacity:Os,numOctaves:_m};function uf(e,t,n,r){const{style:i,vars:s,transform:o,transformOrigin:a}=e;let l=!1,u=!1,c=!0;for(const d in t){const h=t[d];if(jx(d)){s[d]=h;continue}const f=Dx[d],p=sE(h,f);if(zr.has(d)){if(l=!0,o[d]=p,!c)continue;h!==(f.default||0)&&(c=!1)}else d.startsWith("origin")?(u=!0,a[d]=p):i[d]=p}if(t.transform||(l||r?i.transform=rE(e.transform,n,c,r):i.transform&&(i.transform="none")),u){const{originX:d="50%",originY:h="50%",originZ:f=0}=a;i.transformOrigin=`${d} ${h} ${f}`}}const cf=()=>({style:{},transform:{},transformOrigin:{},vars:{}});function Lx(e,t,n){for(const r in t)!ct(t[r])&&!Ox(r,n)&&(e[r]=t[r])}function uE({transformTemplate:e},t,n){return C.useMemo(()=>{const r=cf();return uf(r,t,{enableHardwareAcceleration:!n},e),Object.assign({},r.vars,r.style)},[t])}function cE(e,t,n){const r=e.style||{},i={};return Lx(i,r,e),Object.assign(i,uE(e,t,n)),e.transformValues?e.transformValues(i):i}function dE(e,t,n){const r={},i=cE(e,t,n);return e.drag&&e.dragListener!==!1&&(r.draggable=!1,i.userSelect=i.WebkitUserSelect=i.WebkitTouchCallout="none",i.touchAction=e.drag===!0?"none":`pan-${e.drag==="x"?"y":"x"}`),e.tabIndex===void 0&&(e.onTap||e.onTapStart||e.whileTap)&&(r.tabIndex=0),r.style=i,r}const hE=new Set(["animate","exit","variants","initial","style","values","variants","transition","transformTemplate","transformValues","custom","inherit","onBeforeLayoutMeasure","onAnimationStart","onAnimationComplete","onUpdate","onDragStart","onDrag","onDragEnd","onMeasureDragConstraints","onDirectionLock","onDragTransitionEnd","_dragX","_dragY","onHoverStart","onHoverEnd","onViewportEnter","onViewportLeave","globalTapTarget","ignoreStrict","viewport"]);function ul(e){return e.startsWith("while")||e.startsWith("drag")&&e!=="draggable"||e.startsWith("layout")||e.startsWith("onTap")||e.startsWith("onPan")||e.startsWith("onLayout")||hE.has(e)}let Mx=e=>!ul(e);function fE(e){e&&(Mx=t=>t.startsWith("on")?!ul(t):e(t))}try{fE(require("@emotion/is-prop-valid").default)}catch{}function pE(e,t,n){const r={};for(const i in e)i==="values"&&typeof e.values=="object"||(Mx(i)||n===!0&&ul(i)||!t&&!ul(i)||e.draggable&&i.startsWith("onDrag"))&&(r[i]=e[i]);return r}function Cm(e,t,n){return typeof e=="string"?e:Q.transform(t+n*e)}function mE(e,t,n){const r=Cm(t,e.x,e.width),i=Cm(n,e.y,e.height);return`${r} ${i}`}const gE={offset:"stroke-dashoffset",array:"stroke-dasharray"},yE={offset:"strokeDashoffset",array:"strokeDasharray"};function vE(e,t,n=1,r=0,i=!0){e.pathLength=1;const s=i?gE:yE;e[s.offset]=Q.transform(-r);const o=Q.transform(t),a=Q.transform(n);e[s.array]=`${o} ${a}`}function df(e,{attrX:t,attrY:n,attrScale:r,originX:i,originY:s,pathLength:o,pathSpacing:a=1,pathOffset:l=0,...u},c,d,h){if(uf(e,u,c,h),d){e.style.viewBox&&(e.attrs.viewBox=e.style.viewBox);return}e.attrs=e.style,e.style={};const{attrs:f,style:p,dimensions:v}=e;f.transform&&(v&&(p.transform=f.transform),delete f.transform),v&&(i!==void 0||s!==void 0||p.transform)&&(p.transformOrigin=mE(v,i!==void 0?i:.5,s!==void 0?s:.5)),t!==void 0&&(f.x=t),n!==void 0&&(f.y=n),r!==void 0&&(f.scale=r),o!==void 0&&vE(f,o,a,l,!1)}const Bx=()=>({...cf(),attrs:{}}),hf=e=>typeof e=="string"&&e.toLowerCase()==="svg";function xE(e,t,n,r){const i=C.useMemo(()=>{const s=Bx();return df(s,t,{enableHardwareAcceleration:!1},hf(r),e.transformTemplate),{...s.attrs,style:{...s.style}}},[t]);if(e.style){const s={};Lx(s,e.style,e),i.style={...s,...i.style}}return i}function wE(e=!1){return(n,r,i,{latestValues:s},o)=>{const l=(lf(n)?xE:dE)(r,s,o,n),c={...pE(r,typeof n=="string",e),...l,ref:i},{children:d}=r,h=C.useMemo(()=>ct(d)?d.get():d,[d]);return C.createElement(n,{...c,children:h})}}function Fx(e,{style:t,vars:n},r,i){Object.assign(e.style,t,i&&i.getProjectionStyles(r));for(const s in n)e.style.setProperty(s,n[s])}const $x=new Set(["baseFrequency","diffuseConstant","kernelMatrix","kernelUnitLength","keySplines","keyTimes","limitingConeAngle","markerHeight","markerWidth","numOctaves","targetX","targetY","surfaceScale","specularConstant","specularExponent","stdDeviation","tableValues","viewBox","gradientTransform","pathLength","startOffset","textLength","lengthAdjust"]);function Ux(e,t,n,r){Fx(e,t,void 0,r);for(const i in t.attrs)e.setAttribute($x.has(i)?i:rf(i),t.attrs[i])}function ff(e,t){const{style:n}=e,r={};for(const i in n)(ct(n[i])||t.style&&ct(t.style[i])||Ox(i,e))&&(r[i]=n[i]);return r}function Vx(e,t){const n=ff(e,t);for(const r in e)if(ct(e[r])||ct(t[r])){const i=To.indexOf(r)!==-1?"attr"+r.charAt(0).toUpperCase()+r.substring(1):r;n[i]=e[r]}return n}function pf(e,t,n,r={},i={}){return typeof t=="function"&&(t=t(n!==void 0?n:e.custom,r,i)),typeof t=="string"&&(t=e.variants&&e.variants[t]),typeof t=="function"&&(t=t(n!==void 0?n:e.custom,r,i)),t}function zx(e){const t=C.useRef(null);return t.current===null&&(t.current=e()),t.current}const cl=e=>Array.isArray(e),kE=e=>!!(e&&typeof e=="object"&&e.mix&&e.toValue),bE=e=>cl(e)?e[e.length-1]||0:e;function Aa(e){const t=ct(e)?e.get():e;return kE(t)?t.toValue():t}function SE({scrapeMotionValuesFromProps:e,createRenderState:t,onMount:n},r,i,s){const o={latestValues:_E(r,i,s,e),renderState:t()};return n&&(o.mount=a=>n(r,a,o)),o}const qx=e=>(t,n)=>{const r=C.useContext(ql),i=C.useContext(Hl),s=()=>SE(e,t,r,i);return n?s():zx(s)};function _E(e,t,n,r){const i={},s=r(e,{});for(const h in s)i[h]=Aa(s[h]);let{initial:o,animate:a}=e;const l=Kl(e),u=Ax(e);t&&u&&!l&&e.inherit!==!1&&(o===void 0&&(o=t.initial),a===void 0&&(a=t.animate));let c=n?n.initial===!1:!1;c=c||o===!1;const d=c?a:o;return d&&typeof d!="boolean"&&!Gl(d)&&(Array.isArray(d)?d:[d]).forEach(f=>{const p=pf(e,f);if(!p)return;const{transitionEnd:v,transition:w,...m}=p;for(const g in m){let y=m[g];if(Array.isArray(y)){const k=c?y.length-1:0;y=y[k]}y!==null&&(i[g]=y)}for(const g in v)i[g]=v[g]}),i}const Te=e=>e;class Em{constructor(){this.order=[],this.scheduled=new Set}add(t){if(!this.scheduled.has(t))return this.scheduled.add(t),this.order.push(t),!0}remove(t){const n=this.order.indexOf(t);n!==-1&&(this.order.splice(n,1),this.scheduled.delete(t))}clear(){this.order.length=0,this.scheduled.clear()}}function CE(e){let t=new Em,n=new Em,r=0,i=!1,s=!1;const o=new WeakSet,a={schedule:(l,u=!1,c=!1)=>{const d=c&&i,h=d?t:n;return u&&o.add(l),h.add(l)&&d&&i&&(r=t.order.length),l},cancel:l=>{n.remove(l),o.delete(l)},process:l=>{if(i){s=!0;return}if(i=!0,[t,n]=[n,t],n.clear(),r=t.order.length,r)for(let u=0;u<r;u++){const c=t.order[u];c(l),o.has(c)&&(a.schedule(c),e())}i=!1,s&&(s=!1,a.process(l))}};return a}const ta=["prepare","read","update","preRender","render","postRender"],EE=40;function TE(e,t){let n=!1,r=!0;const i={delta:0,timestamp:0,isProcessing:!1},s=ta.reduce((d,h)=>(d[h]=CE(()=>n=!0),d),{}),o=d=>s[d].process(i),a=()=>{const d=performance.now();n=!1,i.delta=r?1e3/60:Math.max(Math.min(d-i.timestamp,EE),1),i.timestamp=d,i.isProcessing=!0,ta.forEach(o),i.isProcessing=!1,n&&t&&(r=!1,e(a))},l=()=>{n=!0,r=!0,i.isProcessing||e(a)};return{schedule:ta.reduce((d,h)=>{const f=s[h];return d[h]=(p,v=!1,w=!1)=>(n||l(),f.schedule(p,v,w)),d},{}),cancel:d=>ta.forEach(h=>s[h].cancel(d)),state:i,steps:s}}const{schedule:me,cancel:Tn,state:qe,steps:Lu}=TE(typeof requestAnimationFrame<"u"?requestAnimationFrame:Te,!0),PE={useVisualState:qx({scrapeMotionValuesFromProps:Vx,createRenderState:Bx,onMount:(e,t,{renderState:n,latestValues:r})=>{me.read(()=>{try{n.dimensions=typeof t.getBBox=="function"?t.getBBox():t.getBoundingClientRect()}catch{n.dimensions={x:0,y:0,width:0,height:0}}}),me.render(()=>{df(n,r,{enableHardwareAcceleration:!1},hf(t.tagName),e.transformTemplate),Ux(t,n)})}})},AE={useVisualState:qx({scrapeMotionValuesFromProps:ff,createRenderState:cf})};function RE(e,{forwardMotionProps:t=!1},n,r){return{...lf(e)?PE:AE,preloadedFeatures:n,useRender:wE(t),createVisualElement:r,Component:e}}function xn(e,t,n,r={passive:!0}){return e.addEventListener(t,n,r),()=>e.removeEventListener(t,n)}const Hx=e=>e.pointerType==="mouse"?typeof e.button!="number"||e.button<=0:e.isPrimary!==!1;function Ql(e,t="page"){return{point:{x:e[t+"X"],y:e[t+"Y"]}}}const OE=e=>t=>Hx(t)&&e(t,Ql(t));function kn(e,t,n,r){return xn(e,t,OE(n),r)}const NE=(e,t)=>n=>t(e(n)),er=(...e)=>e.reduce(NE);function Wx(e){let t=null;return()=>{const n=()=>{t=null};return t===null?(t=e,n):!1}}const Tm=Wx("dragHorizontal"),Pm=Wx("dragVertical");function Gx(e){let t=!1;if(e==="y")t=Pm();else if(e==="x")t=Tm();else{const n=Tm(),r=Pm();n&&r?t=()=>{n(),r()}:(n&&n(),r&&r())}return t}function Kx(){const e=Gx(!0);return e?(e(),!1):!0}class cr{constructor(t){this.isMounted=!1,this.node=t}update(){}}function Am(e,t){const n="pointer"+(t?"enter":"leave"),r="onHover"+(t?"Start":"End"),i=(s,o)=>{if(s.pointerType==="touch"||Kx())return;const a=e.getProps();e.animationState&&a.whileHover&&e.animationState.setActive("whileHover",t),a[r]&&me.update(()=>a[r](s,o))};return kn(e.current,n,i,{passive:!e.getProps()[r]})}class jE extends cr{mount(){this.unmount=er(Am(this.node,!0),Am(this.node,!1))}unmount(){}}class IE extends cr{constructor(){super(...arguments),this.isActive=!1}onFocus(){let t=!1;try{t=this.node.current.matches(":focus-visible")}catch{t=!0}!t||!this.node.animationState||(this.node.animationState.setActive("whileFocus",!0),this.isActive=!0)}onBlur(){!this.isActive||!this.node.animationState||(this.node.animationState.setActive("whileFocus",!1),this.isActive=!1)}mount(){this.unmount=er(xn(this.node.current,"focus",()=>this.onFocus()),xn(this.node.current,"blur",()=>this.onBlur()))}unmount(){}}const Jx=(e,t)=>t?e===t?!0:Jx(e,t.parentElement):!1;function Mu(e,t){if(!t)return;const n=new PointerEvent("pointer"+e);t(n,Ql(n))}class DE extends cr{constructor(){super(...arguments),this.removeStartListeners=Te,this.removeEndListeners=Te,this.removeAccessibleListeners=Te,this.startPointerPress=(t,n)=>{if(this.isPressing)return;this.removeEndListeners();const r=this.node.getProps(),s=kn(window,"pointerup",(a,l)=>{if(!this.checkPressEnd())return;const{onTap:u,onTapCancel:c,globalTapTarget:d}=this.node.getProps();me.update(()=>{!d&&!Jx(this.node.current,a.target)?c&&c(a,l):u&&u(a,l)})},{passive:!(r.onTap||r.onPointerUp)}),o=kn(window,"pointercancel",(a,l)=>this.cancelPress(a,l),{passive:!(r.onTapCancel||r.onPointerCancel)});this.removeEndListeners=er(s,o),this.startPress(t,n)},this.startAccessiblePress=()=>{const t=s=>{if(s.key!=="Enter"||this.isPressing)return;const o=a=>{a.key!=="Enter"||!this.checkPressEnd()||Mu("up",(l,u)=>{const{onTap:c}=this.node.getProps();c&&me.update(()=>c(l,u))})};this.removeEndListeners(),this.removeEndListeners=xn(this.node.current,"keyup",o),Mu("down",(a,l)=>{this.startPress(a,l)})},n=xn(this.node.current,"keydown",t),r=()=>{this.isPressing&&Mu("cancel",(s,o)=>this.cancelPress(s,o))},i=xn(this.node.current,"blur",r);this.removeAccessibleListeners=er(n,i)}}startPress(t,n){this.isPressing=!0;const{onTapStart:r,whileTap:i}=this.node.getProps();i&&this.node.animationState&&this.node.animationState.setActive("whileTap",!0),r&&me.update(()=>r(t,n))}checkPressEnd(){return this.removeEndListeners(),this.isPressing=!1,this.node.getProps().whileTap&&this.node.animationState&&this.node.animationState.setActive("whileTap",!1),!Kx()}cancelPress(t,n){if(!this.checkPressEnd())return;const{onTapCancel:r}=this.node.getProps();r&&me.update(()=>r(t,n))}mount(){const t=this.node.getProps(),n=kn(t.globalTapTarget?window:this.node.current,"pointerdown",this.startPointerPress,{passive:!(t.onTapStart||t.onPointerStart)}),r=xn(this.node.current,"focus",this.startAccessiblePress);this.removeStartListeners=er(n,r)}unmount(){this.removeStartListeners(),this.removeEndListeners(),this.removeAccessibleListeners()}}const xd=new WeakMap,Bu=new WeakMap,LE=e=>{const t=xd.get(e.target);t&&t(e)},ME=e=>{e.forEach(LE)};function BE({root:e,...t}){const n=e||document;Bu.has(n)||Bu.set(n,{});const r=Bu.get(n),i=JSON.stringify(t);return r[i]||(r[i]=new IntersectionObserver(ME,{root:e,...t})),r[i]}function FE(e,t,n){const r=BE(t);return xd.set(e,n),r.observe(e),()=>{xd.delete(e),r.unobserve(e)}}const $E={some:0,all:1};class UE extends cr{constructor(){super(...arguments),this.hasEnteredView=!1,this.isInView=!1}startObserver(){this.unmount();const{viewport:t={}}=this.node.getProps(),{root:n,margin:r,amount:i="some",once:s}=t,o={root:n?n.current:void 0,rootMargin:r,threshold:typeof i=="number"?i:$E[i]},a=l=>{const{isIntersecting:u}=l;if(this.isInView===u||(this.isInView=u,s&&!u&&this.hasEnteredView))return;u&&(this.hasEnteredView=!0),this.node.animationState&&this.node.animationState.setActive("whileInView",u);const{onViewportEnter:c,onViewportLeave:d}=this.node.getProps(),h=u?c:d;h&&h(l)};return FE(this.node.current,o,a)}mount(){this.startObserver()}update(){if(typeof IntersectionObserver>"u")return;const{props:t,prevProps:n}=this.node;["amount","margin","root"].some(VE(t,n))&&this.startObserver()}unmount(){}}function VE({viewport:e={}},{viewport:t={}}={}){return n=>e[n]!==t[n]}const zE={inView:{Feature:UE},tap:{Feature:DE},focus:{Feature:IE},hover:{Feature:jE}};function Qx(e,t){if(!Array.isArray(t))return!1;const n=t.length;if(n!==e.length)return!1;for(let r=0;r<n;r++)if(t[r]!==e[r])return!1;return!0}function qE(e){const t={};return e.values.forEach((n,r)=>t[r]=n.get()),t}function HE(e){const t={};return e.values.forEach((n,r)=>t[r]=n.getVelocity()),t}function Xl(e,t,n){const r=e.getProps();return pf(r,t,n!==void 0?n:r.custom,qE(e),HE(e))}let mf=Te;const Ir=e=>e*1e3,bn=e=>e/1e3,WE={current:!1},Xx=e=>Array.isArray(e)&&typeof e[0]=="number";function Yx(e){return!!(!e||typeof e=="string"&&Zx[e]||Xx(e)||Array.isArray(e)&&e.every(Yx))}const vs=([e,t,n,r])=>`cubic-bezier(${e}, ${t}, ${n}, ${r})`,Zx={linear:"linear",ease:"ease",easeIn:"ease-in",easeOut:"ease-out",easeInOut:"ease-in-out",circIn:vs([0,.65,.55,1]),circOut:vs([.55,0,1,.45]),backIn:vs([.31,.01,.66,-.59]),backOut:vs([.33,1.53,.69,.99])};function ew(e){if(e)return Xx(e)?vs(e):Array.isArray(e)?e.map(ew):Zx[e]}function GE(e,t,n,{delay:r=0,duration:i,repeat:s=0,repeatType:o="loop",ease:a,times:l}={}){const u={[t]:n};l&&(u.offset=l);const c=ew(a);return Array.isArray(c)&&(u.easing=c),e.animate(u,{delay:r,duration:i,easing:Array.isArray(c)?"linear":c,fill:"both",iterations:s+1,direction:o==="reverse"?"alternate":"normal"})}function KE(e,{repeat:t,repeatType:n="loop"}){const r=t&&n!=="loop"&&t%2===1?0:e.length-1;return e[r]}const tw=(e,t,n)=>(((1-3*n+3*t)*e+(3*n-6*t))*e+3*t)*e,JE=1e-7,QE=12;function XE(e,t,n,r,i){let s,o,a=0;do o=t+(n-t)/2,s=tw(o,r,i)-e,s>0?n=o:t=o;while(Math.abs(s)>JE&&++a<QE);return o}function Ro(e,t,n,r){if(e===t&&n===r)return Te;const i=s=>XE(s,0,1,e,n);return s=>s===0||s===1?s:tw(i(s),t,r)}const YE=Ro(.42,0,1,1),ZE=Ro(0,0,.58,1),nw=Ro(.42,0,.58,1),eT=e=>Array.isArray(e)&&typeof e[0]!="number",rw=e=>t=>t<=.5?e(2*t)/2:(2-e(2*(1-t)))/2,iw=e=>t=>1-e(1-t),gf=e=>1-Math.sin(Math.acos(e)),sw=iw(gf),tT=rw(gf),ow=Ro(.33,1.53,.69,.99),yf=iw(ow),nT=rw(yf),rT=e=>(e*=2)<1?.5*yf(e):.5*(2-Math.pow(2,-10*(e-1))),iT={linear:Te,easeIn:YE,easeInOut:nw,easeOut:ZE,circIn:gf,circInOut:tT,circOut:sw,backIn:yf,backInOut:nT,backOut:ow,anticipate:rT},Rm=e=>{if(Array.isArray(e)){mf(e.length===4);const[t,n,r,i]=e;return Ro(t,n,r,i)}else if(typeof e=="string")return iT[e];return e},vf=(e,t)=>n=>!!(Po(n)&&oE.test(n)&&n.startsWith(e)||t&&Object.prototype.hasOwnProperty.call(n,t)),aw=(e,t,n)=>r=>{if(!Po(r))return r;const[i,s,o,a]=r.match(Jl);return{[e]:parseFloat(i),[t]:parseFloat(s),[n]:parseFloat(o),alpha:a!==void 0?parseFloat(a):1}},sT=e=>ir(0,255,e),Fu={...qr,transform:e=>Math.round(sT(e))},Ar={test:vf("rgb","red"),parse:aw("red","green","blue"),transform:({red:e,green:t,blue:n,alpha:r=1})=>"rgba("+Fu.transform(e)+", "+Fu.transform(t)+", "+Fu.transform(n)+", "+Ns(Os.transform(r))+")"};function oT(e){let t="",n="",r="",i="";return e.length>5?(t=e.substring(1,3),n=e.substring(3,5),r=e.substring(5,7),i=e.substring(7,9)):(t=e.substring(1,2),n=e.substring(2,3),r=e.substring(3,4),i=e.substring(4,5),t+=t,n+=n,r+=r,i+=i),{red:parseInt(t,16),green:parseInt(n,16),blue:parseInt(r,16),alpha:i?parseInt(i,16)/255:1}}const wd={test:vf("#"),parse:oT,transform:Ar.transform},wi={test:vf("hsl","hue"),parse:aw("hue","saturation","lightness"),transform:({hue:e,saturation:t,lightness:n,alpha:r=1})=>"hsla("+Math.round(e)+", "+an.transform(Ns(t))+", "+an.transform(Ns(n))+", "+Ns(Os.transform(r))+")"},Xe={test:e=>Ar.test(e)||wd.test(e)||wi.test(e),parse:e=>Ar.test(e)?Ar.parse(e):wi.test(e)?wi.parse(e):wd.parse(e),transform:e=>Po(e)?e:e.hasOwnProperty("red")?Ar.transform(e):wi.transform(e)},we=(e,t,n)=>-n*e+n*t+e;function $u(e,t,n){return n<0&&(n+=1),n>1&&(n-=1),n<1/6?e+(t-e)*6*n:n<1/2?t:n<2/3?e+(t-e)*(2/3-n)*6:e}function aT({hue:e,saturation:t,lightness:n,alpha:r}){e/=360,t/=100,n/=100;let i=0,s=0,o=0;if(!t)i=s=o=n;else{const a=n<.5?n*(1+t):n+t-n*t,l=2*n-a;i=$u(l,a,e+1/3),s=$u(l,a,e),o=$u(l,a,e-1/3)}return{red:Math.round(i*255),green:Math.round(s*255),blue:Math.round(o*255),alpha:r}}const Uu=(e,t,n)=>{const r=e*e;return Math.sqrt(Math.max(0,n*(t*t-r)+r))},lT=[wd,Ar,wi],uT=e=>lT.find(t=>t.test(e));function Om(e){const t=uT(e);let n=t.parse(e);return t===wi&&(n=aT(n)),n}const lw=(e,t)=>{const n=Om(e),r=Om(t),i={...n};return s=>(i.red=Uu(n.red,r.red,s),i.green=Uu(n.green,r.green,s),i.blue=Uu(n.blue,r.blue,s),i.alpha=we(n.alpha,r.alpha,s),Ar.transform(i))};function cT(e){var t,n;return isNaN(e)&&Po(e)&&(((t=e.match(Jl))===null||t===void 0?void 0:t.length)||0)+(((n=e.match(Ix))===null||n===void 0?void 0:n.length)||0)>0}const uw={regex:iE,countKey:"Vars",token:"${v}",parse:Te},cw={regex:Ix,countKey:"Colors",token:"${c}",parse:Xe.parse},dw={regex:Jl,countKey:"Numbers",token:"${n}",parse:qr.parse};function Vu(e,{regex:t,countKey:n,token:r,parse:i}){const s=e.tokenised.match(t);s&&(e["num"+n]=s.length,e.tokenised=e.tokenised.replace(t,r),e.values.push(...s.map(i)))}function dl(e){const t=e.toString(),n={value:t,tokenised:t,values:[],numVars:0,numColors:0,numNumbers:0};return n.value.includes("var(--")&&Vu(n,uw),Vu(n,cw),Vu(n,dw),n}function hw(e){return dl(e).values}function fw(e){const{values:t,numColors:n,numVars:r,tokenised:i}=dl(e),s=t.length;return o=>{let a=i;for(let l=0;l<s;l++)l<r?a=a.replace(uw.token,o[l]):l<r+n?a=a.replace(cw.token,Xe.transform(o[l])):a=a.replace(dw.token,Ns(o[l]));return a}}const dT=e=>typeof e=="number"?0:e;function hT(e){const t=hw(e);return fw(e)(t.map(dT))}const sr={test:cT,parse:hw,createTransformer:fw,getAnimatableNone:hT},pw=(e,t)=>n=>`${n>0?t:e}`;function mw(e,t){return typeof e=="number"?n=>we(e,t,n):Xe.test(e)?lw(e,t):e.startsWith("var(")?pw(e,t):yw(e,t)}const gw=(e,t)=>{const n=[...e],r=n.length,i=e.map((s,o)=>mw(s,t[o]));return s=>{for(let o=0;o<r;o++)n[o]=i[o](s);return n}},fT=(e,t)=>{const n={...e,...t},r={};for(const i in n)e[i]!==void 0&&t[i]!==void 0&&(r[i]=mw(e[i],t[i]));return i=>{for(const s in r)n[s]=r[s](i);return n}},yw=(e,t)=>{const n=sr.createTransformer(t),r=dl(e),i=dl(t);return r.numVars===i.numVars&&r.numColors===i.numColors&&r.numNumbers>=i.numNumbers?er(gw(r.values,i.values),n):pw(e,t)},co=(e,t,n)=>{const r=t-e;return r===0?1:(n-e)/r},Nm=(e,t)=>n=>we(e,t,n);function pT(e){return typeof e=="number"?Nm:typeof e=="string"?Xe.test(e)?lw:yw:Array.isArray(e)?gw:typeof e=="object"?fT:Nm}function mT(e,t,n){const r=[],i=n||pT(e[0]),s=e.length-1;for(let o=0;o<s;o++){let a=i(e[o],e[o+1]);if(t){const l=Array.isArray(t)?t[o]||Te:t;a=er(l,a)}r.push(a)}return r}function vw(e,t,{clamp:n=!0,ease:r,mixer:i}={}){const s=e.length;if(mf(s===t.length),s===1)return()=>t[0];e[0]>e[s-1]&&(e=[...e].reverse(),t=[...t].reverse());const o=mT(t,r,i),a=o.length,l=u=>{let c=0;if(a>1)for(;c<e.length-2&&!(u<e[c+1]);c++);const d=co(e[c],e[c+1],u);return o[c](d)};return n?u=>l(ir(e[0],e[s-1],u)):l}function gT(e,t){const n=e[e.length-1];for(let r=1;r<=t;r++){const i=co(0,t,r);e.push(we(n,1,i))}}function yT(e){const t=[0];return gT(t,e.length-1),t}function vT(e,t){return e.map(n=>n*t)}function xT(e,t){return e.map(()=>t||nw).splice(0,e.length-1)}function hl({duration:e=300,keyframes:t,times:n,ease:r="easeInOut"}){const i=eT(r)?r.map(Rm):Rm(r),s={done:!1,value:t[0]},o=vT(n&&n.length===t.length?n:yT(t),e),a=vw(o,t,{ease:Array.isArray(i)?i:xT(t,i)});return{calculatedDuration:e,next:l=>(s.value=a(l),s.done=l>=e,s)}}function xw(e,t){return t?e*(1e3/t):0}const wT=5;function ww(e,t,n){const r=Math.max(t-wT,0);return xw(n-e(r),t-r)}const zu=.001,kT=.01,bT=10,ST=.05,_T=1;function CT({duration:e=800,bounce:t=.25,velocity:n=0,mass:r=1}){let i,s,o=1-t;o=ir(ST,_T,o),e=ir(kT,bT,bn(e)),o<1?(i=u=>{const c=u*o,d=c*e,h=c-n,f=kd(u,o),p=Math.exp(-d);return zu-h/f*p},s=u=>{const d=u*o*e,h=d*n+n,f=Math.pow(o,2)*Math.pow(u,2)*e,p=Math.exp(-d),v=kd(Math.pow(u,2),o);return(-i(u)+zu>0?-1:1)*((h-f)*p)/v}):(i=u=>{const c=Math.exp(-u*e),d=(u-n)*e+1;return-zu+c*d},s=u=>{const c=Math.exp(-u*e),d=(n-u)*(e*e);return c*d});const a=5/e,l=TT(i,s,a);if(e=Ir(e),isNaN(l))return{stiffness:100,damping:10,duration:e};{const u=Math.pow(l,2)*r;return{stiffness:u,damping:o*2*Math.sqrt(r*u),duration:e}}}const ET=12;function TT(e,t,n){let r=n;for(let i=1;i<ET;i++)r=r-e(r)/t(r);return r}function kd(e,t){return e*Math.sqrt(1-t*t)}const PT=["duration","bounce"],AT=["stiffness","damping","mass"];function jm(e,t){return t.some(n=>e[n]!==void 0)}function RT(e){let t={velocity:0,stiffness:100,damping:10,mass:1,isResolvedFromDuration:!1,...e};if(!jm(e,AT)&&jm(e,PT)){const n=CT(e);t={...t,...n,mass:1},t.isResolvedFromDuration=!0}return t}function kw({keyframes:e,restDelta:t,restSpeed:n,...r}){const i=e[0],s=e[e.length-1],o={done:!1,value:i},{stiffness:a,damping:l,mass:u,duration:c,velocity:d,isResolvedFromDuration:h}=RT({...r,velocity:-bn(r.velocity||0)}),f=d||0,p=l/(2*Math.sqrt(a*u)),v=s-i,w=bn(Math.sqrt(a/u)),m=Math.abs(v)<5;n||(n=m?.01:2),t||(t=m?.005:.5);let g;if(p<1){const y=kd(w,p);g=k=>{const T=Math.exp(-p*w*k);return s-T*((f+p*w*v)/y*Math.sin(y*k)+v*Math.cos(y*k))}}else if(p===1)g=y=>s-Math.exp(-w*y)*(v+(f+w*v)*y);else{const y=w*Math.sqrt(p*p-1);g=k=>{const T=Math.exp(-p*w*k),S=Math.min(y*k,300);return s-T*((f+p*w*v)*Math.sinh(S)+y*v*Math.cosh(S))/y}}return{calculatedDuration:h&&c||null,next:y=>{const k=g(y);if(h)o.done=y>=c;else{let T=f;y!==0&&(p<1?T=ww(g,y,k):T=0);const S=Math.abs(T)<=n,P=Math.abs(s-k)<=t;o.done=S&&P}return o.value=o.done?s:k,o}}}function Im({keyframes:e,velocity:t=0,power:n=.8,timeConstant:r=325,bounceDamping:i=10,bounceStiffness:s=500,modifyTarget:o,min:a,max:l,restDelta:u=.5,restSpeed:c}){const d=e[0],h={done:!1,value:d},f=A=>a!==void 0&&A<a||l!==void 0&&A>l,p=A=>a===void 0?l:l===void 0||Math.abs(a-A)<Math.abs(l-A)?a:l;let v=n*t;const w=d+v,m=o===void 0?w:o(w);m!==w&&(v=m-d);const g=A=>-v*Math.exp(-A/r),y=A=>m+g(A),k=A=>{const O=g(A),E=y(A);h.done=Math.abs(O)<=u,h.value=h.done?m:E};let T,S;const P=A=>{f(h.value)&&(T=A,S=kw({keyframes:[h.value,p(h.value)],velocity:ww(y,A,h.value),damping:i,stiffness:s,restDelta:u,restSpeed:c}))};return P(0),{calculatedDuration:null,next:A=>{let O=!1;return!S&&T===void 0&&(O=!0,k(A),P(A)),T!==void 0&&A>T?S.next(A-T):(!O&&k(A),h)}}}const OT=e=>{const t=({timestamp:n})=>e(n);return{start:()=>me.update(t,!0),stop:()=>Tn(t),now:()=>qe.isProcessing?qe.timestamp:performance.now()}},Dm=2e4;function Lm(e){let t=0;const n=50;let r=e.next(t);for(;!r.done&&t<Dm;)t+=n,r=e.next(t);return t>=Dm?1/0:t}const NT={decay:Im,inertia:Im,tween:hl,keyframes:hl,spring:kw};function fl({autoplay:e=!0,delay:t=0,driver:n=OT,keyframes:r,type:i="keyframes",repeat:s=0,repeatDelay:o=0,repeatType:a="loop",onPlay:l,onStop:u,onComplete:c,onUpdate:d,...h}){let f=1,p=!1,v,w;const m=()=>{w=new Promise(N=>{v=N})};m();let g;const y=NT[i]||hl;let k;y!==hl&&typeof r[0]!="number"&&(k=vw([0,100],r,{clamp:!1}),r=[0,100]);const T=y({...h,keyframes:r});let S;a==="mirror"&&(S=y({...h,keyframes:[...r].reverse(),velocity:-(h.velocity||0)}));let P="idle",A=null,O=null,E=null;T.calculatedDuration===null&&s&&(T.calculatedDuration=Lm(T));const{calculatedDuration:L}=T;let B=1/0,K=1/0;L!==null&&(B=L+o,K=B*(s+1)-o);let J=0;const M=N=>{if(O===null)return;f>0&&(O=Math.min(O,N)),f<0&&(O=Math.min(N-K/f,O)),A!==null?J=A:J=Math.round(N-O)*f;const q=J-t*(f>=0?1:-1),b=f>=0?q<0:q>K;J=Math.max(q,0),P==="finished"&&A===null&&(J=K);let ee=J,de=T;if(s){const Jt=Math.min(J,K)/B;let Lt=Math.floor(Jt),Et=Jt%1;!Et&&Jt>=1&&(Et=1),Et===1&&Lt--,Lt=Math.min(Lt,s+1),!!(Lt%2)&&(a==="reverse"?(Et=1-Et,o&&(Et-=o/B)):a==="mirror"&&(de=S)),ee=ir(0,1,Et)*B}const re=b?{done:!1,value:r[0]}:de.next(ee);k&&(re.value=k(re.value));let{done:Qe}=re;!b&&L!==null&&(Qe=f>=0?J>=K:J<=0);const Ct=A===null&&(P==="finished"||P==="running"&&Qe);return d&&d(re.value),Ct&&I(),re},U=()=>{g&&g.stop(),g=void 0},X=()=>{P="idle",U(),v(),m(),O=E=null},I=()=>{P="finished",c&&c(),U(),v()},$=()=>{if(p)return;g||(g=n(M));const N=g.now();l&&l(),A!==null?O=N-A:(!O||P==="finished")&&(O=N),P==="finished"&&m(),E=O,A=null,P="running",g.start()};e&&$();const _={then(N,q){return w.then(N,q)},get time(){return bn(J)},set time(N){N=Ir(N),J=N,A!==null||!g||f===0?A=N:O=g.now()-N/f},get duration(){const N=T.calculatedDuration===null?Lm(T):T.calculatedDuration;return bn(N)},get speed(){return f},set speed(N){N===f||!g||(f=N,_.time=bn(J))},get state(){return P},play:$,pause:()=>{P="paused",A=J},stop:()=>{p=!0,P!=="idle"&&(P="idle",u&&u(),X())},cancel:()=>{E!==null&&M(E),X()},complete:()=>{P="finished"},sample:N=>(O=0,M(N))};return _}function jT(e){let t;return()=>(t===void 0&&(t=e()),t)}const IT=jT(()=>Object.hasOwnProperty.call(Element.prototype,"animate")),DT=new Set(["opacity","clipPath","filter","transform","backgroundColor"]),na=10,LT=2e4,MT=(e,t)=>t.type==="spring"||e==="backgroundColor"||!Yx(t.ease);function BT(e,t,{onUpdate:n,onComplete:r,...i}){if(!(IT()&&DT.has(t)&&!i.repeatDelay&&i.repeatType!=="mirror"&&i.damping!==0&&i.type!=="inertia"))return!1;let o=!1,a,l,u=!1;const c=()=>{l=new Promise(y=>{a=y})};c();let{keyframes:d,duration:h=300,ease:f,times:p}=i;if(MT(t,i)){const y=fl({...i,repeat:0,delay:0});let k={done:!1,value:d[0]};const T=[];let S=0;for(;!k.done&&S<LT;)k=y.sample(S),T.push(k.value),S+=na;p=void 0,d=T,h=S-na,f="linear"}const v=GE(e.owner.current,t,d,{...i,duration:h,ease:f,times:p}),w=()=>{u=!1,v.cancel()},m=()=>{u=!0,me.update(w),a(),c()};return v.onfinish=()=>{u||(e.set(KE(d,i)),r&&r(),m())},{then(y,k){return l.then(y,k)},attachTimeline(y){return v.timeline=y,v.onfinish=null,Te},get time(){return bn(v.currentTime||0)},set time(y){v.currentTime=Ir(y)},get speed(){return v.playbackRate},set speed(y){v.playbackRate=y},get duration(){return bn(h)},play:()=>{o||(v.play(),Tn(w))},pause:()=>v.pause(),stop:()=>{if(o=!0,v.playState==="idle")return;const{currentTime:y}=v;if(y){const k=fl({...i,autoplay:!1});e.setWithVelocity(k.sample(y-na).value,k.sample(y).value,na)}m()},complete:()=>{u||v.finish()},cancel:m}}function FT({keyframes:e,delay:t,onUpdate:n,onComplete:r}){const i=()=>(n&&n(e[e.length-1]),r&&r(),{time:0,speed:1,duration:0,play:Te,pause:Te,stop:Te,then:s=>(s(),Promise.resolve()),cancel:Te,complete:Te});return t?fl({keyframes:[0,1],duration:0,delay:t,onComplete:i}):i()}const $T={type:"spring",stiffness:500,damping:25,restSpeed:10},UT=e=>({type:"spring",stiffness:550,damping:e===0?2*Math.sqrt(550):30,restSpeed:10}),VT={type:"keyframes",duration:.8},zT={type:"keyframes",ease:[.25,.1,.35,1],duration:.3},qT=(e,{keyframes:t})=>t.length>2?VT:zr.has(e)?e.startsWith("scale")?UT(t[1]):$T:zT,bd=(e,t)=>e==="zIndex"?!1:!!(typeof t=="number"||Array.isArray(t)||typeof t=="string"&&(sr.test(t)||t==="0")&&!t.startsWith("url(")),HT=new Set(["brightness","contrast","saturate","opacity"]);function WT(e){const[t,n]=e.slice(0,-1).split("(");if(t==="drop-shadow")return e;const[r]=n.match(Jl)||[];if(!r)return e;const i=n.replace(r,"");let s=HT.has(t)?1:0;return r!==n&&(s*=100),t+"("+s+i+")"}const GT=/([a-z-]*)\(.*?\)/g,Sd={...sr,getAnimatableNone:e=>{const t=e.match(GT);return t?t.map(WT).join(" "):e}},KT={...Dx,color:Xe,backgroundColor:Xe,outlineColor:Xe,fill:Xe,stroke:Xe,borderColor:Xe,borderTopColor:Xe,borderRightColor:Xe,borderBottomColor:Xe,borderLeftColor:Xe,filter:Sd,WebkitFilter:Sd},xf=e=>KT[e];function bw(e,t){let n=xf(e);return n!==Sd&&(n=sr),n.getAnimatableNone?n.getAnimatableNone(t):void 0}const Sw=e=>/^0[^.\s]+$/.test(e);function JT(e){if(typeof e=="number")return e===0;if(e!==null)return e==="none"||e==="0"||Sw(e)}function QT(e,t,n,r){const i=bd(t,n);let s;Array.isArray(n)?s=[...n]:s=[null,n];const o=r.from!==void 0?r.from:e.get();let a;const l=[];for(let u=0;u<s.length;u++)s[u]===null&&(s[u]=u===0?o:s[u-1]),JT(s[u])&&l.push(u),typeof s[u]=="string"&&s[u]!=="none"&&s[u]!=="0"&&(a=s[u]);if(i&&l.length&&a)for(let u=0;u<l.length;u++){const c=l[u];s[c]=bw(t,a)}return s}function XT({when:e,delay:t,delayChildren:n,staggerChildren:r,staggerDirection:i,repeat:s,repeatType:o,repeatDelay:a,from:l,elapsed:u,...c}){return!!Object.keys(c).length}function wf(e,t){return e[t]||e.default||e}const YT={skipAnimations:!1},kf=(e,t,n,r={})=>i=>{const s=wf(r,e)||{},o=s.delay||r.delay||0;let{elapsed:a=0}=r;a=a-Ir(o);const l=QT(t,e,n,s),u=l[0],c=l[l.length-1],d=bd(e,u),h=bd(e,c);let f={keyframes:l,velocity:t.getVelocity(),ease:"easeOut",...s,delay:-a,onUpdate:p=>{t.set(p),s.onUpdate&&s.onUpdate(p)},onComplete:()=>{i(),s.onComplete&&s.onComplete()}};if(XT(s)||(f={...f,...qT(e,f)}),f.duration&&(f.duration=Ir(f.duration)),f.repeatDelay&&(f.repeatDelay=Ir(f.repeatDelay)),!d||!h||WE.current||s.type===!1||YT.skipAnimations)return FT(f);if(!r.isHandoff&&t.owner&&t.owner.current instanceof HTMLElement&&!t.owner.getProps().onUpdate){const p=BT(t,e,f);if(p)return p}return fl(f)};function pl(e){return!!(ct(e)&&e.add)}const _w=e=>/^\-?\d*\.?\d+$/.test(e);function bf(e,t){e.indexOf(t)===-1&&e.push(t)}function Sf(e,t){const n=e.indexOf(t);n>-1&&e.splice(n,1)}class _f{constructor(){this.subscriptions=[]}add(t){return bf(this.subscriptions,t),()=>Sf(this.subscriptions,t)}notify(t,n,r){const i=this.subscriptions.length;if(i)if(i===1)this.subscriptions[0](t,n,r);else for(let s=0;s<i;s++){const o=this.subscriptions[s];o&&o(t,n,r)}}getSize(){return this.subscriptions.length}clear(){this.subscriptions.length=0}}const ZT=e=>!isNaN(parseFloat(e));class eP{constructor(t,n={}){this.version="10.18.0",this.timeDelta=0,this.lastUpdated=0,this.canTrackVelocity=!1,this.events={},this.updateAndNotify=(r,i=!0)=>{this.prev=this.current,this.current=r;const{delta:s,timestamp:o}=qe;this.lastUpdated!==o&&(this.timeDelta=s,this.lastUpdated=o,me.postRender(this.scheduleVelocityCheck)),this.prev!==this.current&&this.events.change&&this.events.change.notify(this.current),this.events.velocityChange&&this.events.velocityChange.notify(this.getVelocity()),i&&this.events.renderRequest&&this.events.renderRequest.notify(this.current)},this.scheduleVelocityCheck=()=>me.postRender(this.velocityCheck),this.velocityCheck=({timestamp:r})=>{r!==this.lastUpdated&&(this.prev=this.current,this.events.velocityChange&&this.events.velocityChange.notify(this.getVelocity()))},this.hasAnimated=!1,this.prev=this.current=t,this.canTrackVelocity=ZT(this.current),this.owner=n.owner}onChange(t){return this.on("change",t)}on(t,n){this.events[t]||(this.events[t]=new _f);const r=this.events[t].add(n);return t==="change"?()=>{r(),me.read(()=>{this.events.change.getSize()||this.stop()})}:r}clearListeners(){for(const t in this.events)this.events[t].clear()}attach(t,n){this.passiveEffect=t,this.stopPassiveEffect=n}set(t,n=!0){!n||!this.passiveEffect?this.updateAndNotify(t,n):this.passiveEffect(t,this.updateAndNotify)}setWithVelocity(t,n,r){this.set(n),this.prev=t,this.timeDelta=r}jump(t){this.updateAndNotify(t),this.prev=t,this.stop(),this.stopPassiveEffect&&this.stopPassiveEffect()}get(){return this.current}getPrevious(){return this.prev}getVelocity(){return this.canTrackVelocity?xw(parseFloat(this.current)-parseFloat(this.prev),this.timeDelta):0}start(t){return this.stop(),new Promise(n=>{this.hasAnimated=!0,this.animation=t(n),this.events.animationStart&&this.events.animationStart.notify()}).then(()=>{this.events.animationComplete&&this.events.animationComplete.notify(),this.clearAnimation()})}stop(){this.animation&&(this.animation.stop(),this.events.animationCancel&&this.events.animationCancel.notify()),this.clearAnimation()}isAnimating(){return!!this.animation}clearAnimation(){delete this.animation}destroy(){this.clearListeners(),this.stop(),this.stopPassiveEffect&&this.stopPassiveEffect()}}function $i(e,t){return new eP(e,t)}const Cw=e=>t=>t.test(e),tP={test:e=>e==="auto",parse:e=>e},Ew=[qr,Q,an,In,lE,aE,tP],ls=e=>Ew.find(Cw(e)),nP=[...Ew,Xe,sr],rP=e=>nP.find(Cw(e));function iP(e,t,n){e.hasValue(t)?e.getValue(t).set(n):e.addValue(t,$i(n))}function sP(e,t){const n=Xl(e,t);let{transitionEnd:r={},transition:i={},...s}=n?e.makeTargetAnimatable(n,!1):{};s={...s,...r};for(const o in s){const a=bE(s[o]);iP(e,o,a)}}function oP(e,t,n){var r,i;const s=Object.keys(t).filter(a=>!e.hasValue(a)),o=s.length;if(o)for(let a=0;a<o;a++){const l=s[a],u=t[l];let c=null;Array.isArray(u)&&(c=u[0]),c===null&&(c=(i=(r=n[l])!==null&&r!==void 0?r:e.readValue(l))!==null&&i!==void 0?i:t[l]),c!=null&&(typeof c=="string"&&(_w(c)||Sw(c))?c=parseFloat(c):!rP(c)&&sr.test(u)&&(c=bw(l,u)),e.addValue(l,$i(c,{owner:e})),n[l]===void 0&&(n[l]=c),c!==null&&e.setBaseTarget(l,c))}}function aP(e,t){return t?(t[e]||t.default||t).from:void 0}function lP(e,t,n){const r={};for(const i in e){const s=aP(i,t);if(s!==void 0)r[i]=s;else{const o=n.getValue(i);o&&(r[i]=o.get())}}return r}function uP({protectedKeys:e,needsAnimating:t},n){const r=e.hasOwnProperty(n)&&t[n]!==!0;return t[n]=!1,r}function cP(e,t){const n=e.get();if(Array.isArray(t)){for(let r=0;r<t.length;r++)if(t[r]!==n)return!0}else return n!==t}function Tw(e,t,{delay:n=0,transitionOverride:r,type:i}={}){let{transition:s=e.getDefaultTransition(),transitionEnd:o,...a}=e.makeTargetAnimatable(t);const l=e.getValue("willChange");r&&(s=r);const u=[],c=i&&e.animationState&&e.animationState.getState()[i];for(const d in a){const h=e.getValue(d),f=a[d];if(!h||f===void 0||c&&uP(c,d))continue;const p={delay:n,elapsed:0,...wf(s||{},d)};if(window.HandoffAppearAnimations){const m=e.getProps()[Px];if(m){const g=window.HandoffAppearAnimations(m,d,h,me);g!==null&&(p.elapsed=g,p.isHandoff=!0)}}let v=!p.isHandoff&&!cP(h,f);if(p.type==="spring"&&(h.getVelocity()||p.velocity)&&(v=!1),h.animation&&(v=!1),v)continue;h.start(kf(d,h,f,e.shouldReduceMotion&&zr.has(d)?{type:!1}:p));const w=h.animation;pl(l)&&(l.add(d),w.then(()=>l.remove(d))),u.push(w)}return o&&Promise.all(u).then(()=>{o&&sP(e,o)}),u}function _d(e,t,n={}){const r=Xl(e,t,n.custom);let{transition:i=e.getDefaultTransition()||{}}=r||{};n.transitionOverride&&(i=n.transitionOverride);const s=r?()=>Promise.all(Tw(e,r,n)):()=>Promise.resolve(),o=e.variantChildren&&e.variantChildren.size?(l=0)=>{const{delayChildren:u=0,staggerChildren:c,staggerDirection:d}=i;return dP(e,t,u+l,c,d,n)}:()=>Promise.resolve(),{when:a}=i;if(a){const[l,u]=a==="beforeChildren"?[s,o]:[o,s];return l().then(()=>u())}else return Promise.all([s(),o(n.delay)])}function dP(e,t,n=0,r=0,i=1,s){const o=[],a=(e.variantChildren.size-1)*r,l=i===1?(u=0)=>u*r:(u=0)=>a-u*r;return Array.from(e.variantChildren).sort(hP).forEach((u,c)=>{u.notify("AnimationStart",t),o.push(_d(u,t,{...s,delay:n+l(c)}).then(()=>u.notify("AnimationComplete",t)))}),Promise.all(o)}function hP(e,t){return e.sortNodePosition(t)}function fP(e,t,n={}){e.notify("AnimationStart",t);let r;if(Array.isArray(t)){const i=t.map(s=>_d(e,s,n));r=Promise.all(i)}else if(typeof t=="string")r=_d(e,t,n);else{const i=typeof t=="function"?Xl(e,t,n.custom):t;r=Promise.all(Tw(e,i,n))}return r.then(()=>e.notify("AnimationComplete",t))}const pP=[...sf].reverse(),mP=sf.length;function gP(e){return t=>Promise.all(t.map(({animation:n,options:r})=>fP(e,n,r)))}function yP(e){let t=gP(e);const n=xP();let r=!0;const i=(l,u)=>{const c=Xl(e,u);if(c){const{transition:d,transitionEnd:h,...f}=c;l={...l,...f,...h}}return l};function s(l){t=l(e)}function o(l,u){const c=e.getProps(),d=e.getVariantContext(!0)||{},h=[],f=new Set;let p={},v=1/0;for(let m=0;m<mP;m++){const g=pP[m],y=n[g],k=c[g]!==void 0?c[g]:d[g],T=lo(k),S=g===u?y.isActive:null;S===!1&&(v=m);let P=k===d[g]&&k!==c[g]&&T;if(P&&r&&e.manuallyAnimateOnMount&&(P=!1),y.protectedKeys={...p},!y.isActive&&S===null||!k&&!y.prevProp||Gl(k)||typeof k=="boolean")continue;let O=vP(y.prevProp,k)||g===u&&y.isActive&&!P&&T||m>v&&T,E=!1;const L=Array.isArray(k)?k:[k];let B=L.reduce(i,{});S===!1&&(B={});const{prevResolvedValues:K={}}=y,J={...K,...B},M=U=>{O=!0,f.has(U)&&(E=!0,f.delete(U)),y.needsAnimating[U]=!0};for(const U in J){const X=B[U],I=K[U];if(p.hasOwnProperty(U))continue;let $=!1;cl(X)&&cl(I)?$=!Qx(X,I):$=X!==I,$?X!==void 0?M(U):f.add(U):X!==void 0&&f.has(U)?M(U):y.protectedKeys[U]=!0}y.prevProp=k,y.prevResolvedValues=B,y.isActive&&(p={...p,...B}),r&&e.blockInitialAnimation&&(O=!1),O&&(!P||E)&&h.push(...L.map(U=>({animation:U,options:{type:g,...l}})))}if(f.size){const m={};f.forEach(g=>{const y=e.getBaseTarget(g);y!==void 0&&(m[g]=y)}),h.push({animation:m})}let w=!!h.length;return r&&(c.initial===!1||c.initial===c.animate)&&!e.manuallyAnimateOnMount&&(w=!1),r=!1,w?t(h):Promise.resolve()}function a(l,u,c){var d;if(n[l].isActive===u)return Promise.resolve();(d=e.variantChildren)===null||d===void 0||d.forEach(f=>{var p;return(p=f.animationState)===null||p===void 0?void 0:p.setActive(l,u)}),n[l].isActive=u;const h=o(c,l);for(const f in n)n[f].protectedKeys={};return h}return{animateChanges:o,setActive:a,setAnimateFunction:s,getState:()=>n}}function vP(e,t){return typeof t=="string"?t!==e:Array.isArray(t)?!Qx(t,e):!1}function fr(e=!1){return{isActive:e,protectedKeys:{},needsAnimating:{},prevResolvedValues:{}}}function xP(){return{animate:fr(!0),whileInView:fr(),whileHover:fr(),whileTap:fr(),whileDrag:fr(),whileFocus:fr(),exit:fr()}}class wP extends cr{constructor(t){super(t),t.animationState||(t.animationState=yP(t))}updateAnimationControlsSubscription(){const{animate:t}=this.node.getProps();this.unmount(),Gl(t)&&(this.unmount=t.subscribe(this.node))}mount(){this.updateAnimationControlsSubscription()}update(){const{animate:t}=this.node.getProps(),{animate:n}=this.node.prevProps||{};t!==n&&this.updateAnimationControlsSubscription()}unmount(){}}let kP=0;class bP extends cr{constructor(){super(...arguments),this.id=kP++}update(){if(!this.node.presenceContext)return;const{isPresent:t,onExitComplete:n,custom:r}=this.node.presenceContext,{isPresent:i}=this.node.prevPresenceContext||{};if(!this.node.animationState||t===i)return;const s=this.node.animationState.setActive("exit",!t,{custom:r??this.node.getProps().custom});n&&!t&&s.then(()=>n(this.id))}mount(){const{register:t}=this.node.presenceContext||{};t&&(this.unmount=t(this.id))}unmount(){}}const SP={animation:{Feature:wP},exit:{Feature:bP}},Mm=(e,t)=>Math.abs(e-t);function _P(e,t){const n=Mm(e.x,t.x),r=Mm(e.y,t.y);return Math.sqrt(n**2+r**2)}class Pw{constructor(t,n,{transformPagePoint:r,contextWindow:i,dragSnapToOrigin:s=!1}={}){if(this.startEvent=null,this.lastMoveEvent=null,this.lastMoveEventInfo=null,this.handlers={},this.contextWindow=window,this.updatePoint=()=>{if(!(this.lastMoveEvent&&this.lastMoveEventInfo))return;const d=Hu(this.lastMoveEventInfo,this.history),h=this.startEvent!==null,f=_P(d.offset,{x:0,y:0})>=3;if(!h&&!f)return;const{point:p}=d,{timestamp:v}=qe;this.history.push({...p,timestamp:v});const{onStart:w,onMove:m}=this.handlers;h||(w&&w(this.lastMoveEvent,d),this.startEvent=this.lastMoveEvent),m&&m(this.lastMoveEvent,d)},this.handlePointerMove=(d,h)=>{this.lastMoveEvent=d,this.lastMoveEventInfo=qu(h,this.transformPagePoint),me.update(this.updatePoint,!0)},this.handlePointerUp=(d,h)=>{this.end();const{onEnd:f,onSessionEnd:p,resumeAnimation:v}=this.handlers;if(this.dragSnapToOrigin&&v&&v(),!(this.lastMoveEvent&&this.lastMoveEventInfo))return;const w=Hu(d.type==="pointercancel"?this.lastMoveEventInfo:qu(h,this.transformPagePoint),this.history);this.startEvent&&f&&f(d,w),p&&p(d,w)},!Hx(t))return;this.dragSnapToOrigin=s,this.handlers=n,this.transformPagePoint=r,this.contextWindow=i||window;const o=Ql(t),a=qu(o,this.transformPagePoint),{point:l}=a,{timestamp:u}=qe;this.history=[{...l,timestamp:u}];const{onSessionStart:c}=n;c&&c(t,Hu(a,this.history)),this.removeListeners=er(kn(this.contextWindow,"pointermove",this.handlePointerMove),kn(this.contextWindow,"pointerup",this.handlePointerUp),kn(this.contextWindow,"pointercancel",this.handlePointerUp))}updateHandlers(t){this.handlers=t}end(){this.removeListeners&&this.removeListeners(),Tn(this.updatePoint)}}function qu(e,t){return t?{point:t(e.point)}:e}function Bm(e,t){return{x:e.x-t.x,y:e.y-t.y}}function Hu({point:e},t){return{point:e,delta:Bm(e,Aw(t)),offset:Bm(e,CP(t)),velocity:EP(t,.1)}}function CP(e){return e[0]}function Aw(e){return e[e.length-1]}function EP(e,t){if(e.length<2)return{x:0,y:0};let n=e.length-1,r=null;const i=Aw(e);for(;n>=0&&(r=e[n],!(i.timestamp-r.timestamp>Ir(t)));)n--;if(!r)return{x:0,y:0};const s=bn(i.timestamp-r.timestamp);if(s===0)return{x:0,y:0};const o={x:(i.x-r.x)/s,y:(i.y-r.y)/s};return o.x===1/0&&(o.x=0),o.y===1/0&&(o.y=0),o}function bt(e){return e.max-e.min}function Cd(e,t=0,n=.01){return Math.abs(e-t)<=n}function Fm(e,t,n,r=.5){e.origin=r,e.originPoint=we(t.min,t.max,e.origin),e.scale=bt(n)/bt(t),(Cd(e.scale,1,1e-4)||isNaN(e.scale))&&(e.scale=1),e.translate=we(n.min,n.max,e.origin)-e.originPoint,(Cd(e.translate)||isNaN(e.translate))&&(e.translate=0)}function js(e,t,n,r){Fm(e.x,t.x,n.x,r?r.originX:void 0),Fm(e.y,t.y,n.y,r?r.originY:void 0)}function $m(e,t,n){e.min=n.min+t.min,e.max=e.min+bt(t)}function TP(e,t,n){$m(e.x,t.x,n.x),$m(e.y,t.y,n.y)}function Um(e,t,n){e.min=t.min-n.min,e.max=e.min+bt(t)}function Is(e,t,n){Um(e.x,t.x,n.x),Um(e.y,t.y,n.y)}function PP(e,{min:t,max:n},r){return t!==void 0&&e<t?e=r?we(t,e,r.min):Math.max(e,t):n!==void 0&&e>n&&(e=r?we(n,e,r.max):Math.min(e,n)),e}function Vm(e,t,n){return{min:t!==void 0?e.min+t:void 0,max:n!==void 0?e.max+n-(e.max-e.min):void 0}}function AP(e,{top:t,left:n,bottom:r,right:i}){return{x:Vm(e.x,n,i),y:Vm(e.y,t,r)}}function zm(e,t){let n=t.min-e.min,r=t.max-e.max;return t.max-t.min<e.max-e.min&&([n,r]=[r,n]),{min:n,max:r}}function RP(e,t){return{x:zm(e.x,t.x),y:zm(e.y,t.y)}}function OP(e,t){let n=.5;const r=bt(e),i=bt(t);return i>r?n=co(t.min,t.max-r,e.min):r>i&&(n=co(e.min,e.max-i,t.min)),ir(0,1,n)}function NP(e,t){const n={};return t.min!==void 0&&(n.min=t.min-e.min),t.max!==void 0&&(n.max=t.max-e.min),n}const Ed=.35;function jP(e=Ed){return e===!1?e=0:e===!0&&(e=Ed),{x:qm(e,"left","right"),y:qm(e,"top","bottom")}}function qm(e,t,n){return{min:Hm(e,t),max:Hm(e,n)}}function Hm(e,t){return typeof e=="number"?e:e[t]||0}const Wm=()=>({translate:0,scale:1,origin:0,originPoint:0}),ki=()=>({x:Wm(),y:Wm()}),Gm=()=>({min:0,max:0}),Pe=()=>({x:Gm(),y:Gm()});function Pt(e){return[e("x"),e("y")]}function Rw({top:e,left:t,right:n,bottom:r}){return{x:{min:t,max:n},y:{min:e,max:r}}}function IP({x:e,y:t}){return{top:t.min,right:e.max,bottom:t.max,left:e.min}}function DP(e,t){if(!t)return e;const n=t({x:e.left,y:e.top}),r=t({x:e.right,y:e.bottom});return{top:n.y,left:n.x,bottom:r.y,right:r.x}}function Wu(e){return e===void 0||e===1}function Td({scale:e,scaleX:t,scaleY:n}){return!Wu(e)||!Wu(t)||!Wu(n)}function xr(e){return Td(e)||Ow(e)||e.z||e.rotate||e.rotateX||e.rotateY}function Ow(e){return Km(e.x)||Km(e.y)}function Km(e){return e&&e!=="0%"}function ml(e,t,n){const r=e-n,i=t*r;return n+i}function Jm(e,t,n,r,i){return i!==void 0&&(e=ml(e,i,r)),ml(e,n,r)+t}function Pd(e,t=0,n=1,r,i){e.min=Jm(e.min,t,n,r,i),e.max=Jm(e.max,t,n,r,i)}function Nw(e,{x:t,y:n}){Pd(e.x,t.translate,t.scale,t.originPoint),Pd(e.y,n.translate,n.scale,n.originPoint)}function LP(e,t,n,r=!1){const i=n.length;if(!i)return;t.x=t.y=1;let s,o;for(let a=0;a<i;a++){s=n[a],o=s.projectionDelta;const l=s.instance;l&&l.style&&l.style.display==="contents"||(r&&s.options.layoutScroll&&s.scroll&&s!==s.root&&bi(e,{x:-s.scroll.offset.x,y:-s.scroll.offset.y}),o&&(t.x*=o.x.scale,t.y*=o.y.scale,Nw(e,o)),r&&xr(s.latestValues)&&bi(e,s.latestValues))}t.x=Qm(t.x),t.y=Qm(t.y)}function Qm(e){return Number.isInteger(e)||e>1.0000000000001||e<.999999999999?e:1}function Mn(e,t){e.min=e.min+t,e.max=e.max+t}function Xm(e,t,[n,r,i]){const s=t[i]!==void 0?t[i]:.5,o=we(e.min,e.max,s);Pd(e,t[n],t[r],o,t.scale)}const MP=["x","scaleX","originX"],BP=["y","scaleY","originY"];function bi(e,t){Xm(e.x,t,MP),Xm(e.y,t,BP)}function jw(e,t){return Rw(DP(e.getBoundingClientRect(),t))}function FP(e,t,n){const r=jw(e,n),{scroll:i}=t;return i&&(Mn(r.x,i.offset.x),Mn(r.y,i.offset.y)),r}const Iw=({current:e})=>e?e.ownerDocument.defaultView:null,$P=new WeakMap;class UP{constructor(t){this.openGlobalLock=null,this.isDragging=!1,this.currentDirection=null,this.originPoint={x:0,y:0},this.constraints=!1,this.hasMutatedConstraints=!1,this.elastic=Pe(),this.visualElement=t}start(t,{snapToCursor:n=!1}={}){const{presenceContext:r}=this.visualElement;if(r&&r.isPresent===!1)return;const i=c=>{const{dragSnapToOrigin:d}=this.getProps();d?this.pauseAnimation():this.stopAnimation(),n&&this.snapToCursor(Ql(c,"page").point)},s=(c,d)=>{const{drag:h,dragPropagation:f,onDragStart:p}=this.getProps();if(h&&!f&&(this.openGlobalLock&&this.openGlobalLock(),this.openGlobalLock=Gx(h),!this.openGlobalLock))return;this.isDragging=!0,this.currentDirection=null,this.resolveConstraints(),this.visualElement.projection&&(this.visualElement.projection.isAnimationBlocked=!0,this.visualElement.projection.target=void 0),Pt(w=>{let m=this.getAxisMotionValue(w).get()||0;if(an.test(m)){const{projection:g}=this.visualElement;if(g&&g.layout){const y=g.layout.layoutBox[w];y&&(m=bt(y)*(parseFloat(m)/100))}}this.originPoint[w]=m}),p&&me.update(()=>p(c,d),!1,!0);const{animationState:v}=this.visualElement;v&&v.setActive("whileDrag",!0)},o=(c,d)=>{const{dragPropagation:h,dragDirectionLock:f,onDirectionLock:p,onDrag:v}=this.getProps();if(!h&&!this.openGlobalLock)return;const{offset:w}=d;if(f&&this.currentDirection===null){this.currentDirection=VP(w),this.currentDirection!==null&&p&&p(this.currentDirection);return}this.updateAxis("x",d.point,w),this.updateAxis("y",d.point,w),this.visualElement.render(),v&&v(c,d)},a=(c,d)=>this.stop(c,d),l=()=>Pt(c=>{var d;return this.getAnimationState(c)==="paused"&&((d=this.getAxisMotionValue(c).animation)===null||d===void 0?void 0:d.play())}),{dragSnapToOrigin:u}=this.getProps();this.panSession=new Pw(t,{onSessionStart:i,onStart:s,onMove:o,onSessionEnd:a,resumeAnimation:l},{transformPagePoint:this.visualElement.getTransformPagePoint(),dragSnapToOrigin:u,contextWindow:Iw(this.visualElement)})}stop(t,n){const r=this.isDragging;if(this.cancel(),!r)return;const{velocity:i}=n;this.startAnimation(i);const{onDragEnd:s}=this.getProps();s&&me.update(()=>s(t,n))}cancel(){this.isDragging=!1;const{projection:t,animationState:n}=this.visualElement;t&&(t.isAnimationBlocked=!1),this.panSession&&this.panSession.end(),this.panSession=void 0;const{dragPropagation:r}=this.getProps();!r&&this.openGlobalLock&&(this.openGlobalLock(),this.openGlobalLock=null),n&&n.setActive("whileDrag",!1)}updateAxis(t,n,r){const{drag:i}=this.getProps();if(!r||!ra(t,i,this.currentDirection))return;const s=this.getAxisMotionValue(t);let o=this.originPoint[t]+r[t];this.constraints&&this.constraints[t]&&(o=PP(o,this.constraints[t],this.elastic[t])),s.set(o)}resolveConstraints(){var t;const{dragConstraints:n,dragElastic:r}=this.getProps(),i=this.visualElement.projection&&!this.visualElement.projection.layout?this.visualElement.projection.measure(!1):(t=this.visualElement.projection)===null||t===void 0?void 0:t.layout,s=this.constraints;n&&xi(n)?this.constraints||(this.constraints=this.resolveRefConstraints()):n&&i?this.constraints=AP(i.layoutBox,n):this.constraints=!1,this.elastic=jP(r),s!==this.constraints&&i&&this.constraints&&!this.hasMutatedConstraints&&Pt(o=>{this.getAxisMotionValue(o)&&(this.constraints[o]=NP(i.layoutBox[o],this.constraints[o]))})}resolveRefConstraints(){const{dragConstraints:t,onMeasureDragConstraints:n}=this.getProps();if(!t||!xi(t))return!1;const r=t.current,{projection:i}=this.visualElement;if(!i||!i.layout)return!1;const s=FP(r,i.root,this.visualElement.getTransformPagePoint());let o=RP(i.layout.layoutBox,s);if(n){const a=n(IP(o));this.hasMutatedConstraints=!!a,a&&(o=Rw(a))}return o}startAnimation(t){const{drag:n,dragMomentum:r,dragElastic:i,dragTransition:s,dragSnapToOrigin:o,onDragTransitionEnd:a}=this.getProps(),l=this.constraints||{},u=Pt(c=>{if(!ra(c,n,this.currentDirection))return;let d=l&&l[c]||{};o&&(d={min:0,max:0});const h=i?200:1e6,f=i?40:1e7,p={type:"inertia",velocity:r?t[c]:0,bounceStiffness:h,bounceDamping:f,timeConstant:750,restDelta:1,restSpeed:10,...s,...d};return this.startAxisValueAnimation(c,p)});return Promise.all(u).then(a)}startAxisValueAnimation(t,n){const r=this.getAxisMotionValue(t);return r.start(kf(t,r,0,n))}stopAnimation(){Pt(t=>this.getAxisMotionValue(t).stop())}pauseAnimation(){Pt(t=>{var n;return(n=this.getAxisMotionValue(t).animation)===null||n===void 0?void 0:n.pause()})}getAnimationState(t){var n;return(n=this.getAxisMotionValue(t).animation)===null||n===void 0?void 0:n.state}getAxisMotionValue(t){const n="_drag"+t.toUpperCase(),r=this.visualElement.getProps(),i=r[n];return i||this.visualElement.getValue(t,(r.initial?r.initial[t]:void 0)||0)}snapToCursor(t){Pt(n=>{const{drag:r}=this.getProps();if(!ra(n,r,this.currentDirection))return;const{projection:i}=this.visualElement,s=this.getAxisMotionValue(n);if(i&&i.layout){const{min:o,max:a}=i.layout.layoutBox[n];s.set(t[n]-we(o,a,.5))}})}scalePositionWithinConstraints(){if(!this.visualElement.current)return;const{drag:t,dragConstraints:n}=this.getProps(),{projection:r}=this.visualElement;if(!xi(n)||!r||!this.constraints)return;this.stopAnimation();const i={x:0,y:0};Pt(o=>{const a=this.getAxisMotionValue(o);if(a){const l=a.get();i[o]=OP({min:l,max:l},this.constraints[o])}});const{transformTemplate:s}=this.visualElement.getProps();this.visualElement.current.style.transform=s?s({},""):"none",r.root&&r.root.updateScroll(),r.updateLayout(),this.resolveConstraints(),Pt(o=>{if(!ra(o,t,null))return;const a=this.getAxisMotionValue(o),{min:l,max:u}=this.constraints[o];a.set(we(l,u,i[o]))})}addListeners(){if(!this.visualElement.current)return;$P.set(this.visualElement,this);const t=this.visualElement.current,n=kn(t,"pointerdown",l=>{const{drag:u,dragListener:c=!0}=this.getProps();u&&c&&this.start(l)}),r=()=>{const{dragConstraints:l}=this.getProps();xi(l)&&(this.constraints=this.resolveRefConstraints())},{projection:i}=this.visualElement,s=i.addEventListener("measure",r);i&&!i.layout&&(i.root&&i.root.updateScroll(),i.updateLayout()),r();const o=xn(window,"resize",()=>this.scalePositionWithinConstraints()),a=i.addEventListener("didUpdate",({delta:l,hasLayoutChanged:u})=>{this.isDragging&&u&&(Pt(c=>{const d=this.getAxisMotionValue(c);d&&(this.originPoint[c]+=l[c].translate,d.set(d.get()+l[c].translate))}),this.visualElement.render())});return()=>{o(),n(),s(),a&&a()}}getProps(){const t=this.visualElement.getProps(),{drag:n=!1,dragDirectionLock:r=!1,dragPropagation:i=!1,dragConstraints:s=!1,dragElastic:o=Ed,dragMomentum:a=!0}=t;return{...t,drag:n,dragDirectionLock:r,dragPropagation:i,dragConstraints:s,dragElastic:o,dragMomentum:a}}}function ra(e,t,n){return(t===!0||t===e)&&(n===null||n===e)}function VP(e,t=10){let n=null;return Math.abs(e.y)>t?n="y":Math.abs(e.x)>t&&(n="x"),n}class zP extends cr{constructor(t){super(t),this.removeGroupControls=Te,this.removeListeners=Te,this.controls=new UP(t)}mount(){const{dragControls:t}=this.node.getProps();t&&(this.removeGroupControls=t.subscribe(this.controls)),this.removeListeners=this.controls.addListeners()||Te}unmount(){this.removeGroupControls(),this.removeListeners()}}const Ym=e=>(t,n)=>{e&&me.update(()=>e(t,n))};class qP extends cr{constructor(){super(...arguments),this.removePointerDownListener=Te}onPointerDown(t){this.session=new Pw(t,this.createPanHandlers(),{transformPagePoint:this.node.getTransformPagePoint(),contextWindow:Iw(this.node)})}createPanHandlers(){const{onPanSessionStart:t,onPanStart:n,onPan:r,onPanEnd:i}=this.node.getProps();return{onSessionStart:Ym(t),onStart:Ym(n),onMove:r,onEnd:(s,o)=>{delete this.session,i&&me.update(()=>i(s,o))}}}mount(){this.removePointerDownListener=kn(this.node.current,"pointerdown",t=>this.onPointerDown(t))}update(){this.session&&this.session.updateHandlers(this.createPanHandlers())}unmount(){this.removePointerDownListener(),this.session&&this.session.end()}}function HP(){const e=C.useContext(Hl);if(e===null)return[!0,null];const{isPresent:t,onExitComplete:n,register:r}=e,i=C.useId();return C.useEffect(()=>r(i),[]),!t&&n?[!1,()=>n&&n(i)]:[!0]}const Ra={hasAnimatedSinceResize:!0,hasEverUpdated:!1};function Zm(e,t){return t.max===t.min?0:e/(t.max-t.min)*100}const us={correct:(e,t)=>{if(!t.target)return e;if(typeof e=="string")if(Q.test(e))e=parseFloat(e);else return e;const n=Zm(e,t.target.x),r=Zm(e,t.target.y);return`${n}% ${r}%`}},WP={correct:(e,{treeScale:t,projectionDelta:n})=>{const r=e,i=sr.parse(e);if(i.length>5)return r;const s=sr.createTransformer(e),o=typeof i[0]!="number"?1:0,a=n.x.scale*t.x,l=n.y.scale*t.y;i[0+o]/=a,i[1+o]/=l;const u=we(a,l,.5);return typeof i[2+o]=="number"&&(i[2+o]/=u),typeof i[3+o]=="number"&&(i[3+o]/=u),s(i)}};class GP extends rn.Component{componentDidMount(){const{visualElement:t,layoutGroup:n,switchLayoutGroup:r,layoutId:i}=this.props,{projection:s}=t;eE(KP),s&&(n.group&&n.group.add(s),r&&r.register&&i&&r.register(s),s.root.didUpdate(),s.addEventListener("animationComplete",()=>{this.safeToRemove()}),s.setOptions({...s.options,onExitComplete:()=>this.safeToRemove()})),Ra.hasEverUpdated=!0}getSnapshotBeforeUpdate(t){const{layoutDependency:n,visualElement:r,drag:i,isPresent:s}=this.props,o=r.projection;return o&&(o.isPresent=s,i||t.layoutDependency!==n||n===void 0?o.willUpdate():this.safeToRemove(),t.isPresent!==s&&(s?o.promote():o.relegate()||me.postRender(()=>{const a=o.getStack();(!a||!a.members.length)&&this.safeToRemove()}))),null}componentDidUpdate(){const{projection:t}=this.props.visualElement;t&&(t.root.didUpdate(),queueMicrotask(()=>{!t.currentAnimation&&t.isLead()&&this.safeToRemove()}))}componentWillUnmount(){const{visualElement:t,layoutGroup:n,switchLayoutGroup:r}=this.props,{projection:i}=t;i&&(i.scheduleCheckAfterUnmount(),n&&n.group&&n.group.remove(i),r&&r.deregister&&r.deregister(i))}safeToRemove(){const{safeToRemove:t}=this.props;t&&t()}render(){return null}}function Dw(e){const[t,n]=HP(),r=C.useContext(af);return rn.createElement(GP,{...e,layoutGroup:r,switchLayoutGroup:C.useContext(Rx),isPresent:t,safeToRemove:n})}const KP={borderRadius:{...us,applyTo:["borderTopLeftRadius","borderTopRightRadius","borderBottomLeftRadius","borderBottomRightRadius"]},borderTopLeftRadius:us,borderTopRightRadius:us,borderBottomLeftRadius:us,borderBottomRightRadius:us,boxShadow:WP},Lw=["TopLeft","TopRight","BottomLeft","BottomRight"],JP=Lw.length,eg=e=>typeof e=="string"?parseFloat(e):e,tg=e=>typeof e=="number"||Q.test(e);function QP(e,t,n,r,i,s){i?(e.opacity=we(0,n.opacity!==void 0?n.opacity:1,XP(r)),e.opacityExit=we(t.opacity!==void 0?t.opacity:1,0,YP(r))):s&&(e.opacity=we(t.opacity!==void 0?t.opacity:1,n.opacity!==void 0?n.opacity:1,r));for(let o=0;o<JP;o++){const a=`border${Lw[o]}Radius`;let l=ng(t,a),u=ng(n,a);if(l===void 0&&u===void 0)continue;l||(l=0),u||(u=0),l===0||u===0||tg(l)===tg(u)?(e[a]=Math.max(we(eg(l),eg(u),r),0),(an.test(u)||an.test(l))&&(e[a]+="%")):e[a]=u}(t.rotate||n.rotate)&&(e.rotate=we(t.rotate||0,n.rotate||0,r))}function ng(e,t){return e[t]!==void 0?e[t]:e.borderRadius}const XP=Mw(0,.5,sw),YP=Mw(.5,.95,Te);function Mw(e,t,n){return r=>r<e?0:r>t?1:n(co(e,t,r))}function rg(e,t){e.min=t.min,e.max=t.max}function Tt(e,t){rg(e.x,t.x),rg(e.y,t.y)}function ig(e,t,n,r,i){return e-=t,e=ml(e,1/n,r),i!==void 0&&(e=ml(e,1/i,r)),e}function ZP(e,t=0,n=1,r=.5,i,s=e,o=e){if(an.test(t)&&(t=parseFloat(t),t=we(o.min,o.max,t/100)-o.min),typeof t!="number")return;let a=we(s.min,s.max,r);e===s&&(a-=t),e.min=ig(e.min,t,n,a,i),e.max=ig(e.max,t,n,a,i)}function sg(e,t,[n,r,i],s,o){ZP(e,t[n],t[r],t[i],t.scale,s,o)}const eA=["x","scaleX","originX"],tA=["y","scaleY","originY"];function og(e,t,n,r){sg(e.x,t,eA,n?n.x:void 0,r?r.x:void 0),sg(e.y,t,tA,n?n.y:void 0,r?r.y:void 0)}function ag(e){return e.translate===0&&e.scale===1}function Bw(e){return ag(e.x)&&ag(e.y)}function nA(e,t){return e.x.min===t.x.min&&e.x.max===t.x.max&&e.y.min===t.y.min&&e.y.max===t.y.max}function Fw(e,t){return Math.round(e.x.min)===Math.round(t.x.min)&&Math.round(e.x.max)===Math.round(t.x.max)&&Math.round(e.y.min)===Math.round(t.y.min)&&Math.round(e.y.max)===Math.round(t.y.max)}function lg(e){return bt(e.x)/bt(e.y)}class rA{constructor(){this.members=[]}add(t){bf(this.members,t),t.scheduleRender()}remove(t){if(Sf(this.members,t),t===this.prevLead&&(this.prevLead=void 0),t===this.lead){const n=this.members[this.members.length-1];n&&this.promote(n)}}relegate(t){const n=this.members.findIndex(i=>t===i);if(n===0)return!1;let r;for(let i=n;i>=0;i--){const s=this.members[i];if(s.isPresent!==!1){r=s;break}}return r?(this.promote(r),!0):!1}promote(t,n){const r=this.lead;if(t!==r&&(this.prevLead=r,this.lead=t,t.show(),r)){r.instance&&r.scheduleRender(),t.scheduleRender(),t.resumeFrom=r,n&&(t.resumeFrom.preserveOpacity=!0),r.snapshot&&(t.snapshot=r.snapshot,t.snapshot.latestValues=r.animationValues||r.latestValues),t.root&&t.root.isUpdating&&(t.isLayoutDirty=!0);const{crossfade:i}=t.options;i===!1&&r.hide()}}exitAnimationComplete(){this.members.forEach(t=>{const{options:n,resumingFrom:r}=t;n.onExitComplete&&n.onExitComplete(),r&&r.options.onExitComplete&&r.options.onExitComplete()})}scheduleRender(){this.members.forEach(t=>{t.instance&&t.scheduleRender(!1)})}removeLeadSnapshot(){this.lead&&this.lead.snapshot&&(this.lead.snapshot=void 0)}}function ug(e,t,n){let r="";const i=e.x.translate/t.x,s=e.y.translate/t.y;if((i||s)&&(r=`translate3d(${i}px, ${s}px, 0) `),(t.x!==1||t.y!==1)&&(r+=`scale(${1/t.x}, ${1/t.y}) `),n){const{rotate:l,rotateX:u,rotateY:c}=n;l&&(r+=`rotate(${l}deg) `),u&&(r+=`rotateX(${u}deg) `),c&&(r+=`rotateY(${c}deg) `)}const o=e.x.scale*t.x,a=e.y.scale*t.y;return(o!==1||a!==1)&&(r+=`scale(${o}, ${a})`),r||"none"}const iA=(e,t)=>e.depth-t.depth;class sA{constructor(){this.children=[],this.isDirty=!1}add(t){bf(this.children,t),this.isDirty=!0}remove(t){Sf(this.children,t),this.isDirty=!0}forEach(t){this.isDirty&&this.children.sort(iA),this.isDirty=!1,this.children.forEach(t)}}function oA(e,t){const n=performance.now(),r=({timestamp:i})=>{const s=i-n;s>=t&&(Tn(r),e(s-t))};return me.read(r,!0),()=>Tn(r)}function aA(e){window.MotionDebug&&window.MotionDebug.record(e)}function lA(e){return e instanceof SVGElement&&e.tagName!=="svg"}function uA(e,t,n){const r=ct(e)?e:$i(e);return r.start(kf("",r,t,n)),r.animation}const cg=["","X","Y","Z"],cA={visibility:"hidden"},dg=1e3;let dA=0;const wr={type:"projectionFrame",totalNodes:0,resolvedTargetDeltas:0,recalculatedProjection:0};function $w({attachResizeListener:e,defaultParent:t,measureScroll:n,checkIsScrollRoot:r,resetTransform:i}){return class{constructor(o={},a=t==null?void 0:t()){this.id=dA++,this.animationId=0,this.children=new Set,this.options={},this.isTreeAnimating=!1,this.isAnimationBlocked=!1,this.isLayoutDirty=!1,this.isProjectionDirty=!1,this.isSharedProjectionDirty=!1,this.isTransformDirty=!1,this.updateManuallyBlocked=!1,this.updateBlockedByResize=!1,this.isUpdating=!1,this.isSVG=!1,this.needsReset=!1,this.shouldResetTransform=!1,this.treeScale={x:1,y:1},this.eventHandlers=new Map,this.hasTreeAnimated=!1,this.updateScheduled=!1,this.projectionUpdateScheduled=!1,this.checkUpdateFailed=()=>{this.isUpdating&&(this.isUpdating=!1,this.clearAllSnapshots())},this.updateProjection=()=>{this.projectionUpdateScheduled=!1,wr.totalNodes=wr.resolvedTargetDeltas=wr.recalculatedProjection=0,this.nodes.forEach(pA),this.nodes.forEach(xA),this.nodes.forEach(wA),this.nodes.forEach(mA),aA(wr)},this.hasProjected=!1,this.isVisible=!0,this.animationProgress=0,this.sharedNodes=new Map,this.latestValues=o,this.root=a?a.root||a:this,this.path=a?[...a.path,a]:[],this.parent=a,this.depth=a?a.depth+1:0;for(let l=0;l<this.path.length;l++)this.path[l].shouldResetTransform=!0;this.root===this&&(this.nodes=new sA)}addEventListener(o,a){return this.eventHandlers.has(o)||this.eventHandlers.set(o,new _f),this.eventHandlers.get(o).add(a)}notifyListeners(o,...a){const l=this.eventHandlers.get(o);l&&l.notify(...a)}hasListeners(o){return this.eventHandlers.has(o)}mount(o,a=this.root.hasTreeAnimated){if(this.instance)return;this.isSVG=lA(o),this.instance=o;const{layoutId:l,layout:u,visualElement:c}=this.options;if(c&&!c.current&&c.mount(o),this.root.nodes.add(this),this.parent&&this.parent.children.add(this),a&&(u||l)&&(this.isLayoutDirty=!0),e){let d;const h=()=>this.root.updateBlockedByResize=!1;e(o,()=>{this.root.updateBlockedByResize=!0,d&&d(),d=oA(h,250),Ra.hasAnimatedSinceResize&&(Ra.hasAnimatedSinceResize=!1,this.nodes.forEach(fg))})}l&&this.root.registerSharedNode(l,this),this.options.animate!==!1&&c&&(l||u)&&this.addEventListener("didUpdate",({delta:d,hasLayoutChanged:h,hasRelativeTargetChanged:f,layout:p})=>{if(this.isTreeAnimationBlocked()){this.target=void 0,this.relativeTarget=void 0;return}const v=this.options.transition||c.getDefaultTransition()||CA,{onLayoutAnimationStart:w,onLayoutAnimationComplete:m}=c.getProps(),g=!this.targetLayout||!Fw(this.targetLayout,p)||f,y=!h&&f;if(this.options.layoutRoot||this.resumeFrom&&this.resumeFrom.instance||y||h&&(g||!this.currentAnimation)){this.resumeFrom&&(this.resumingFrom=this.resumeFrom,this.resumingFrom.resumingFrom=void 0),this.setAnimationOrigin(d,y);const k={...wf(v,"layout"),onPlay:w,onComplete:m};(c.shouldReduceMotion||this.options.layoutRoot)&&(k.delay=0,k.type=!1),this.startAnimation(k)}else h||fg(this),this.isLead()&&this.options.onExitComplete&&this.options.onExitComplete();this.targetLayout=p})}unmount(){this.options.layoutId&&this.willUpdate(),this.root.nodes.remove(this);const o=this.getStack();o&&o.remove(this),this.parent&&this.parent.children.delete(this),this.instance=void 0,Tn(this.updateProjection)}blockUpdate(){this.updateManuallyBlocked=!0}unblockUpdate(){this.updateManuallyBlocked=!1}isUpdateBlocked(){return this.updateManuallyBlocked||this.updateBlockedByResize}isTreeAnimationBlocked(){return this.isAnimationBlocked||this.parent&&this.parent.isTreeAnimationBlocked()||!1}startUpdate(){this.isUpdateBlocked()||(this.isUpdating=!0,this.nodes&&this.nodes.forEach(kA),this.animationId++)}getTransformTemplate(){const{visualElement:o}=this.options;return o&&o.getProps().transformTemplate}willUpdate(o=!0){if(this.root.hasTreeAnimated=!0,this.root.isUpdateBlocked()){this.options.onExitComplete&&this.options.onExitComplete();return}if(!this.root.isUpdating&&this.root.startUpdate(),this.isLayoutDirty)return;this.isLayoutDirty=!0;for(let c=0;c<this.path.length;c++){const d=this.path[c];d.shouldResetTransform=!0,d.updateScroll("snapshot"),d.options.layoutRoot&&d.willUpdate(!1)}const{layoutId:a,layout:l}=this.options;if(a===void 0&&!l)return;const u=this.getTransformTemplate();this.prevTransformTemplateValue=u?u(this.latestValues,""):void 0,this.updateSnapshot(),o&&this.notifyListeners("willUpdate")}update(){if(this.updateScheduled=!1,this.isUpdateBlocked()){this.unblockUpdate(),this.clearAllSnapshots(),this.nodes.forEach(hg);return}this.isUpdating||this.nodes.forEach(yA),this.isUpdating=!1,this.nodes.forEach(vA),this.nodes.forEach(hA),this.nodes.forEach(fA),this.clearAllSnapshots();const a=performance.now();qe.delta=ir(0,1e3/60,a-qe.timestamp),qe.timestamp=a,qe.isProcessing=!0,Lu.update.process(qe),Lu.preRender.process(qe),Lu.render.process(qe),qe.isProcessing=!1}didUpdate(){this.updateScheduled||(this.updateScheduled=!0,queueMicrotask(()=>this.update()))}clearAllSnapshots(){this.nodes.forEach(gA),this.sharedNodes.forEach(bA)}scheduleUpdateProjection(){this.projectionUpdateScheduled||(this.projectionUpdateScheduled=!0,me.preRender(this.updateProjection,!1,!0))}scheduleCheckAfterUnmount(){me.postRender(()=>{this.isLayoutDirty?this.root.didUpdate():this.root.checkUpdateFailed()})}updateSnapshot(){this.snapshot||!this.instance||(this.snapshot=this.measure())}updateLayout(){if(!this.instance||(this.updateScroll(),!(this.options.alwaysMeasureLayout&&this.isLead())&&!this.isLayoutDirty))return;if(this.resumeFrom&&!this.resumeFrom.instance)for(let l=0;l<this.path.length;l++)this.path[l].updateScroll();const o=this.layout;this.layout=this.measure(!1),this.layoutCorrected=Pe(),this.isLayoutDirty=!1,this.projectionDelta=void 0,this.notifyListeners("measure",this.layout.layoutBox);const{visualElement:a}=this.options;a&&a.notify("LayoutMeasure",this.layout.layoutBox,o?o.layoutBox:void 0)}updateScroll(o="measure"){let a=!!(this.options.layoutScroll&&this.instance);this.scroll&&this.scroll.animationId===this.root.animationId&&this.scroll.phase===o&&(a=!1),a&&(this.scroll={animationId:this.root.animationId,phase:o,isRoot:r(this.instance),offset:n(this.instance)})}resetTransform(){if(!i)return;const o=this.isLayoutDirty||this.shouldResetTransform,a=this.projectionDelta&&!Bw(this.projectionDelta),l=this.getTransformTemplate(),u=l?l(this.latestValues,""):void 0,c=u!==this.prevTransformTemplateValue;o&&(a||xr(this.latestValues)||c)&&(i(this.instance,u),this.shouldResetTransform=!1,this.scheduleRender())}measure(o=!0){const a=this.measurePageBox();let l=this.removeElementScroll(a);return o&&(l=this.removeTransform(l)),EA(l),{animationId:this.root.animationId,measuredBox:a,layoutBox:l,latestValues:{},source:this.id}}measurePageBox(){const{visualElement:o}=this.options;if(!o)return Pe();const a=o.measureViewportBox(),{scroll:l}=this.root;return l&&(Mn(a.x,l.offset.x),Mn(a.y,l.offset.y)),a}removeElementScroll(o){const a=Pe();Tt(a,o);for(let l=0;l<this.path.length;l++){const u=this.path[l],{scroll:c,options:d}=u;if(u!==this.root&&c&&d.layoutScroll){if(c.isRoot){Tt(a,o);const{scroll:h}=this.root;h&&(Mn(a.x,-h.offset.x),Mn(a.y,-h.offset.y))}Mn(a.x,c.offset.x),Mn(a.y,c.offset.y)}}return a}applyTransform(o,a=!1){const l=Pe();Tt(l,o);for(let u=0;u<this.path.length;u++){const c=this.path[u];!a&&c.options.layoutScroll&&c.scroll&&c!==c.root&&bi(l,{x:-c.scroll.offset.x,y:-c.scroll.offset.y}),xr(c.latestValues)&&bi(l,c.latestValues)}return xr(this.latestValues)&&bi(l,this.latestValues),l}removeTransform(o){const a=Pe();Tt(a,o);for(let l=0;l<this.path.length;l++){const u=this.path[l];if(!u.instance||!xr(u.latestValues))continue;Td(u.latestValues)&&u.updateSnapshot();const c=Pe(),d=u.measurePageBox();Tt(c,d),og(a,u.latestValues,u.snapshot?u.snapshot.layoutBox:void 0,c)}return xr(this.latestValues)&&og(a,this.latestValues),a}setTargetDelta(o){this.targetDelta=o,this.root.scheduleUpdateProjection(),this.isProjectionDirty=!0}setOptions(o){this.options={...this.options,...o,crossfade:o.crossfade!==void 0?o.crossfade:!0}}clearMeasurements(){this.scroll=void 0,this.layout=void 0,this.snapshot=void 0,this.prevTransformTemplateValue=void 0,this.targetDelta=void 0,this.target=void 0,this.isLayoutDirty=!1}forceRelativeParentToResolveTarget(){this.relativeParent&&this.relativeParent.resolvedRelativeTargetAt!==qe.timestamp&&this.relativeParent.resolveTargetDelta(!0)}resolveTargetDelta(o=!1){var a;const l=this.getLead();this.isProjectionDirty||(this.isProjectionDirty=l.isProjectionDirty),this.isTransformDirty||(this.isTransformDirty=l.isTransformDirty),this.isSharedProjectionDirty||(this.isSharedProjectionDirty=l.isSharedProjectionDirty);const u=!!this.resumingFrom||this!==l;if(!(o||u&&this.isSharedProjectionDirty||this.isProjectionDirty||!((a=this.parent)===null||a===void 0)&&a.isProjectionDirty||this.attemptToResolveRelativeTarget))return;const{layout:d,layoutId:h}=this.options;if(!(!this.layout||!(d||h))){if(this.resolvedRelativeTargetAt=qe.timestamp,!this.targetDelta&&!this.relativeTarget){const f=this.getClosestProjectingParent();f&&f.layout&&this.animationProgress!==1?(this.relativeParent=f,this.forceRelativeParentToResolveTarget(),this.relativeTarget=Pe(),this.relativeTargetOrigin=Pe(),Is(this.relativeTargetOrigin,this.layout.layoutBox,f.layout.layoutBox),Tt(this.relativeTarget,this.relativeTargetOrigin)):this.relativeParent=this.relativeTarget=void 0}if(!(!this.relativeTarget&&!this.targetDelta)){if(this.target||(this.target=Pe(),this.targetWithTransforms=Pe()),this.relativeTarget&&this.relativeTargetOrigin&&this.relativeParent&&this.relativeParent.target?(this.forceRelativeParentToResolveTarget(),TP(this.target,this.relativeTarget,this.relativeParent.target)):this.targetDelta?(this.resumingFrom?this.target=this.applyTransform(this.layout.layoutBox):Tt(this.target,this.layout.layoutBox),Nw(this.target,this.targetDelta)):Tt(this.target,this.layout.layoutBox),this.attemptToResolveRelativeTarget){this.attemptToResolveRelativeTarget=!1;const f=this.getClosestProjectingParent();f&&!!f.resumingFrom==!!this.resumingFrom&&!f.options.layoutScroll&&f.target&&this.animationProgress!==1?(this.relativeParent=f,this.forceRelativeParentToResolveTarget(),this.relativeTarget=Pe(),this.relativeTargetOrigin=Pe(),Is(this.relativeTargetOrigin,this.target,f.target),Tt(this.relativeTarget,this.relativeTargetOrigin)):this.relativeParent=this.relativeTarget=void 0}wr.resolvedTargetDeltas++}}}getClosestProjectingParent(){if(!(!this.parent||Td(this.parent.latestValues)||Ow(this.parent.latestValues)))return this.parent.isProjecting()?this.parent:this.parent.getClosestProjectingParent()}isProjecting(){return!!((this.relativeTarget||this.targetDelta||this.options.layoutRoot)&&this.layout)}calcProjection(){var o;const a=this.getLead(),l=!!this.resumingFrom||this!==a;let u=!0;if((this.isProjectionDirty||!((o=this.parent)===null||o===void 0)&&o.isProjectionDirty)&&(u=!1),l&&(this.isSharedProjectionDirty||this.isTransformDirty)&&(u=!1),this.resolvedRelativeTargetAt===qe.timestamp&&(u=!1),u)return;const{layout:c,layoutId:d}=this.options;if(this.isTreeAnimating=!!(this.parent&&this.parent.isTreeAnimating||this.currentAnimation||this.pendingAnimation),this.isTreeAnimating||(this.targetDelta=this.relativeTarget=void 0),!this.layout||!(c||d))return;Tt(this.layoutCorrected,this.layout.layoutBox);const h=this.treeScale.x,f=this.treeScale.y;LP(this.layoutCorrected,this.treeScale,this.path,l),a.layout&&!a.target&&(this.treeScale.x!==1||this.treeScale.y!==1)&&(a.target=a.layout.layoutBox);const{target:p}=a;if(!p){this.projectionTransform&&(this.projectionDelta=ki(),this.projectionTransform="none",this.scheduleRender());return}this.projectionDelta||(this.projectionDelta=ki(),this.projectionDeltaWithTransform=ki());const v=this.projectionTransform;js(this.projectionDelta,this.layoutCorrected,p,this.latestValues),this.projectionTransform=ug(this.projectionDelta,this.treeScale),(this.projectionTransform!==v||this.treeScale.x!==h||this.treeScale.y!==f)&&(this.hasProjected=!0,this.scheduleRender(),this.notifyListeners("projectionUpdate",p)),wr.recalculatedProjection++}hide(){this.isVisible=!1}show(){this.isVisible=!0}scheduleRender(o=!0){if(this.options.scheduleRender&&this.options.scheduleRender(),o){const a=this.getStack();a&&a.scheduleRender()}this.resumingFrom&&!this.resumingFrom.instance&&(this.resumingFrom=void 0)}setAnimationOrigin(o,a=!1){const l=this.snapshot,u=l?l.latestValues:{},c={...this.latestValues},d=ki();(!this.relativeParent||!this.relativeParent.options.layoutRoot)&&(this.relativeTarget=this.relativeTargetOrigin=void 0),this.attemptToResolveRelativeTarget=!a;const h=Pe(),f=l?l.source:void 0,p=this.layout?this.layout.source:void 0,v=f!==p,w=this.getStack(),m=!w||w.members.length<=1,g=!!(v&&!m&&this.options.crossfade===!0&&!this.path.some(_A));this.animationProgress=0;let y;this.mixTargetDelta=k=>{const T=k/1e3;pg(d.x,o.x,T),pg(d.y,o.y,T),this.setTargetDelta(d),this.relativeTarget&&this.relativeTargetOrigin&&this.layout&&this.relativeParent&&this.relativeParent.layout&&(Is(h,this.layout.layoutBox,this.relativeParent.layout.layoutBox),SA(this.relativeTarget,this.relativeTargetOrigin,h,T),y&&nA(this.relativeTarget,y)&&(this.isProjectionDirty=!1),y||(y=Pe()),Tt(y,this.relativeTarget)),v&&(this.animationValues=c,QP(c,u,this.latestValues,T,g,m)),this.root.scheduleUpdateProjection(),this.scheduleRender(),this.animationProgress=T},this.mixTargetDelta(this.options.layoutRoot?1e3:0)}startAnimation(o){this.notifyListeners("animationStart"),this.currentAnimation&&this.currentAnimation.stop(),this.resumingFrom&&this.resumingFrom.currentAnimation&&this.resumingFrom.currentAnimation.stop(),this.pendingAnimation&&(Tn(this.pendingAnimation),this.pendingAnimation=void 0),this.pendingAnimation=me.update(()=>{Ra.hasAnimatedSinceResize=!0,this.currentAnimation=uA(0,dg,{...o,onUpdate:a=>{this.mixTargetDelta(a),o.onUpdate&&o.onUpdate(a)},onComplete:()=>{o.onComplete&&o.onComplete(),this.completeAnimation()}}),this.resumingFrom&&(this.resumingFrom.currentAnimation=this.currentAnimation),this.pendingAnimation=void 0})}completeAnimation(){this.resumingFrom&&(this.resumingFrom.currentAnimation=void 0,this.resumingFrom.preserveOpacity=void 0);const o=this.getStack();o&&o.exitAnimationComplete(),this.resumingFrom=this.currentAnimation=this.animationValues=void 0,this.notifyListeners("animationComplete")}finishAnimation(){this.currentAnimation&&(this.mixTargetDelta&&this.mixTargetDelta(dg),this.currentAnimation.stop()),this.completeAnimation()}applyTransformsToTarget(){const o=this.getLead();let{targetWithTransforms:a,target:l,layout:u,latestValues:c}=o;if(!(!a||!l||!u)){if(this!==o&&this.layout&&u&&Uw(this.options.animationType,this.layout.layoutBox,u.layoutBox)){l=this.target||Pe();const d=bt(this.layout.layoutBox.x);l.x.min=o.target.x.min,l.x.max=l.x.min+d;const h=bt(this.layout.layoutBox.y);l.y.min=o.target.y.min,l.y.max=l.y.min+h}Tt(a,l),bi(a,c),js(this.projectionDeltaWithTransform,this.layoutCorrected,a,c)}}registerSharedNode(o,a){this.sharedNodes.has(o)||this.sharedNodes.set(o,new rA),this.sharedNodes.get(o).add(a);const u=a.options.initialPromotionConfig;a.promote({transition:u?u.transition:void 0,preserveFollowOpacity:u&&u.shouldPreserveFollowOpacity?u.shouldPreserveFollowOpacity(a):void 0})}isLead(){const o=this.getStack();return o?o.lead===this:!0}getLead(){var o;const{layoutId:a}=this.options;return a?((o=this.getStack())===null||o===void 0?void 0:o.lead)||this:this}getPrevLead(){var o;const{layoutId:a}=this.options;return a?(o=this.getStack())===null||o===void 0?void 0:o.prevLead:void 0}getStack(){const{layoutId:o}=this.options;if(o)return this.root.sharedNodes.get(o)}promote({needsReset:o,transition:a,preserveFollowOpacity:l}={}){const u=this.getStack();u&&u.promote(this,l),o&&(this.projectionDelta=void 0,this.needsReset=!0),a&&this.setOptions({transition:a})}relegate(){const o=this.getStack();return o?o.relegate(this):!1}resetRotation(){const{visualElement:o}=this.options;if(!o)return;let a=!1;const{latestValues:l}=o;if((l.rotate||l.rotateX||l.rotateY||l.rotateZ)&&(a=!0),!a)return;const u={};for(let c=0;c<cg.length;c++){const d="rotate"+cg[c];l[d]&&(u[d]=l[d],o.setStaticValue(d,0))}o.render();for(const c in u)o.setStaticValue(c,u[c]);o.scheduleRender()}getProjectionStyles(o){var a,l;if(!this.instance||this.isSVG)return;if(!this.isVisible)return cA;const u={visibility:""},c=this.getTransformTemplate();if(this.needsReset)return this.needsReset=!1,u.opacity="",u.pointerEvents=Aa(o==null?void 0:o.pointerEvents)||"",u.transform=c?c(this.latestValues,""):"none",u;const d=this.getLead();if(!this.projectionDelta||!this.layout||!d.target){const v={};return this.options.layoutId&&(v.opacity=this.latestValues.opacity!==void 0?this.latestValues.opacity:1,v.pointerEvents=Aa(o==null?void 0:o.pointerEvents)||""),this.hasProjected&&!xr(this.latestValues)&&(v.transform=c?c({},""):"none",this.hasProjected=!1),v}const h=d.animationValues||d.latestValues;this.applyTransformsToTarget(),u.transform=ug(this.projectionDeltaWithTransform,this.treeScale,h),c&&(u.transform=c(h,u.transform));const{x:f,y:p}=this.projectionDelta;u.transformOrigin=`${f.origin*100}% ${p.origin*100}% 0`,d.animationValues?u.opacity=d===this?(l=(a=h.opacity)!==null&&a!==void 0?a:this.latestValues.opacity)!==null&&l!==void 0?l:1:this.preserveOpacity?this.latestValues.opacity:h.opacityExit:u.opacity=d===this?h.opacity!==void 0?h.opacity:"":h.opacityExit!==void 0?h.opacityExit:0;for(const v in ll){if(h[v]===void 0)continue;const{correct:w,applyTo:m}=ll[v],g=u.transform==="none"?h[v]:w(h[v],d);if(m){const y=m.length;for(let k=0;k<y;k++)u[m[k]]=g}else u[v]=g}return this.options.layoutId&&(u.pointerEvents=d===this?Aa(o==null?void 0:o.pointerEvents)||"":"none"),u}clearSnapshot(){this.resumeFrom=this.snapshot=void 0}resetTree(){this.root.nodes.forEach(o=>{var a;return(a=o.currentAnimation)===null||a===void 0?void 0:a.stop()}),this.root.nodes.forEach(hg),this.root.sharedNodes.clear()}}}function hA(e){e.updateLayout()}function fA(e){var t;const n=((t=e.resumeFrom)===null||t===void 0?void 0:t.snapshot)||e.snapshot;if(e.isLead()&&e.layout&&n&&e.hasListeners("didUpdate")){const{layoutBox:r,measuredBox:i}=e.layout,{animationType:s}=e.options,o=n.source!==e.layout.source;s==="size"?Pt(d=>{const h=o?n.measuredBox[d]:n.layoutBox[d],f=bt(h);h.min=r[d].min,h.max=h.min+f}):Uw(s,n.layoutBox,r)&&Pt(d=>{const h=o?n.measuredBox[d]:n.layoutBox[d],f=bt(r[d]);h.max=h.min+f,e.relativeTarget&&!e.currentAnimation&&(e.isProjectionDirty=!0,e.relativeTarget[d].max=e.relativeTarget[d].min+f)});const a=ki();js(a,r,n.layoutBox);const l=ki();o?js(l,e.applyTransform(i,!0),n.measuredBox):js(l,r,n.layoutBox);const u=!Bw(a);let c=!1;if(!e.resumeFrom){const d=e.getClosestProjectingParent();if(d&&!d.resumeFrom){const{snapshot:h,layout:f}=d;if(h&&f){const p=Pe();Is(p,n.layoutBox,h.layoutBox);const v=Pe();Is(v,r,f.layoutBox),Fw(p,v)||(c=!0),d.options.layoutRoot&&(e.relativeTarget=v,e.relativeTargetOrigin=p,e.relativeParent=d)}}}e.notifyListeners("didUpdate",{layout:r,snapshot:n,delta:l,layoutDelta:a,hasLayoutChanged:u,hasRelativeTargetChanged:c})}else if(e.isLead()){const{onExitComplete:r}=e.options;r&&r()}e.options.transition=void 0}function pA(e){wr.totalNodes++,e.parent&&(e.isProjecting()||(e.isProjectionDirty=e.parent.isProjectionDirty),e.isSharedProjectionDirty||(e.isSharedProjectionDirty=!!(e.isProjectionDirty||e.parent.isProjectionDirty||e.parent.isSharedProjectionDirty)),e.isTransformDirty||(e.isTransformDirty=e.parent.isTransformDirty))}function mA(e){e.isProjectionDirty=e.isSharedProjectionDirty=e.isTransformDirty=!1}function gA(e){e.clearSnapshot()}function hg(e){e.clearMeasurements()}function yA(e){e.isLayoutDirty=!1}function vA(e){const{visualElement:t}=e.options;t&&t.getProps().onBeforeLayoutMeasure&&t.notify("BeforeLayoutMeasure"),e.resetTransform()}function fg(e){e.finishAnimation(),e.targetDelta=e.relativeTarget=e.target=void 0,e.isProjectionDirty=!0}function xA(e){e.resolveTargetDelta()}function wA(e){e.calcProjection()}function kA(e){e.resetRotation()}function bA(e){e.removeLeadSnapshot()}function pg(e,t,n){e.translate=we(t.translate,0,n),e.scale=we(t.scale,1,n),e.origin=t.origin,e.originPoint=t.originPoint}function mg(e,t,n,r){e.min=we(t.min,n.min,r),e.max=we(t.max,n.max,r)}function SA(e,t,n,r){mg(e.x,t.x,n.x,r),mg(e.y,t.y,n.y,r)}function _A(e){return e.animationValues&&e.animationValues.opacityExit!==void 0}const CA={duration:.45,ease:[.4,0,.1,1]},gg=e=>typeof navigator<"u"&&navigator.userAgent.toLowerCase().includes(e),yg=gg("applewebkit/")&&!gg("chrome/")?Math.round:Te;function vg(e){e.min=yg(e.min),e.max=yg(e.max)}function EA(e){vg(e.x),vg(e.y)}function Uw(e,t,n){return e==="position"||e==="preserve-aspect"&&!Cd(lg(t),lg(n),.2)}const TA=$w({attachResizeListener:(e,t)=>xn(e,"resize",t),measureScroll:()=>({x:document.documentElement.scrollLeft||document.body.scrollLeft,y:document.documentElement.scrollTop||document.body.scrollTop}),checkIsScrollRoot:()=>!0}),Gu={current:void 0},Vw=$w({measureScroll:e=>({x:e.scrollLeft,y:e.scrollTop}),defaultParent:()=>{if(!Gu.current){const e=new TA({});e.mount(window),e.setOptions({layoutScroll:!0}),Gu.current=e}return Gu.current},resetTransform:(e,t)=>{e.style.transform=t!==void 0?t:"none"},checkIsScrollRoot:e=>window.getComputedStyle(e).position==="fixed"}),PA={pan:{Feature:qP},drag:{Feature:zP,ProjectionNode:Vw,MeasureLayout:Dw}},AA=/var\((--[a-zA-Z0-9-_]+),? ?([a-zA-Z0-9 ()%#.,-]+)?\)/;function RA(e){const t=AA.exec(e);if(!t)return[,];const[,n,r]=t;return[n,r]}function Ad(e,t,n=1){const[r,i]=RA(e);if(!r)return;const s=window.getComputedStyle(t).getPropertyValue(r);if(s){const o=s.trim();return _w(o)?parseFloat(o):o}else return vd(i)?Ad(i,t,n+1):i}function OA(e,{...t},n){const r=e.current;if(!(r instanceof Element))return{target:t,transitionEnd:n};n&&(n={...n}),e.values.forEach(i=>{const s=i.get();if(!vd(s))return;const o=Ad(s,r);o&&i.set(o)});for(const i in t){const s=t[i];if(!vd(s))continue;const o=Ad(s,r);o&&(t[i]=o,n||(n={}),n[i]===void 0&&(n[i]=s))}return{target:t,transitionEnd:n}}const NA=new Set(["width","height","top","left","right","bottom","x","y","translateX","translateY"]),zw=e=>NA.has(e),jA=e=>Object.keys(e).some(zw),xg=e=>e===qr||e===Q,wg=(e,t)=>parseFloat(e.split(", ")[t]),kg=(e,t)=>(n,{transform:r})=>{if(r==="none"||!r)return 0;const i=r.match(/^matrix3d\((.+)\)$/);if(i)return wg(i[1],t);{const s=r.match(/^matrix\((.+)\)$/);return s?wg(s[1],e):0}},IA=new Set(["x","y","z"]),DA=To.filter(e=>!IA.has(e));function LA(e){const t=[];return DA.forEach(n=>{const r=e.getValue(n);r!==void 0&&(t.push([n,r.get()]),r.set(n.startsWith("scale")?1:0))}),t.length&&e.render(),t}const Ui={width:({x:e},{paddingLeft:t="0",paddingRight:n="0"})=>e.max-e.min-parseFloat(t)-parseFloat(n),height:({y:e},{paddingTop:t="0",paddingBottom:n="0"})=>e.max-e.min-parseFloat(t)-parseFloat(n),top:(e,{top:t})=>parseFloat(t),left:(e,{left:t})=>parseFloat(t),bottom:({y:e},{top:t})=>parseFloat(t)+(e.max-e.min),right:({x:e},{left:t})=>parseFloat(t)+(e.max-e.min),x:kg(4,13),y:kg(5,14)};Ui.translateX=Ui.x;Ui.translateY=Ui.y;const MA=(e,t,n)=>{const r=t.measureViewportBox(),i=t.current,s=getComputedStyle(i),{display:o}=s,a={};o==="none"&&t.setStaticValue("display",e.display||"block"),n.forEach(u=>{a[u]=Ui[u](r,s)}),t.render();const l=t.measureViewportBox();return n.forEach(u=>{const c=t.getValue(u);c&&c.jump(a[u]),e[u]=Ui[u](l,s)}),e},BA=(e,t,n={},r={})=>{t={...t},r={...r};const i=Object.keys(t).filter(zw);let s=[],o=!1;const a=[];if(i.forEach(l=>{const u=e.getValue(l);if(!e.hasValue(l))return;let c=n[l],d=ls(c);const h=t[l];let f;if(cl(h)){const p=h.length,v=h[0]===null?1:0;c=h[v],d=ls(c);for(let w=v;w<p&&h[w]!==null;w++)f?mf(ls(h[w])===f):f=ls(h[w])}else f=ls(h);if(d!==f)if(xg(d)&&xg(f)){const p=u.get();typeof p=="string"&&u.set(parseFloat(p)),typeof h=="string"?t[l]=parseFloat(h):Array.isArray(h)&&f===Q&&(t[l]=h.map(parseFloat))}else d!=null&&d.transform&&(f!=null&&f.transform)&&(c===0||h===0)?c===0?u.set(f.transform(c)):t[l]=d.transform(h):(o||(s=LA(e),o=!0),a.push(l),r[l]=r[l]!==void 0?r[l]:t[l],u.jump(h))}),a.length){const l=a.indexOf("height")>=0?window.pageYOffset:null,u=MA(t,e,a);return s.length&&s.forEach(([c,d])=>{e.getValue(c).set(d)}),e.render(),Wl&&l!==null&&window.scrollTo({top:l}),{target:u,transitionEnd:r}}else return{target:t,transitionEnd:r}};function FA(e,t,n,r){return jA(t)?BA(e,t,n,r):{target:t,transitionEnd:r}}const $A=(e,t,n,r)=>{const i=OA(e,t,r);return t=i.target,r=i.transitionEnd,FA(e,t,n,r)},Rd={current:null},qw={current:!1};function UA(){if(qw.current=!0,!!Wl)if(window.matchMedia){const e=window.matchMedia("(prefers-reduced-motion)"),t=()=>Rd.current=e.matches;e.addListener(t),t()}else Rd.current=!1}function VA(e,t,n){const{willChange:r}=t;for(const i in t){const s=t[i],o=n[i];if(ct(s))e.addValue(i,s),pl(r)&&r.add(i);else if(ct(o))e.addValue(i,$i(s,{owner:e})),pl(r)&&r.remove(i);else if(o!==s)if(e.hasValue(i)){const a=e.getValue(i);!a.hasAnimated&&a.set(s)}else{const a=e.getStaticValue(i);e.addValue(i,$i(a!==void 0?a:s,{owner:e}))}}for(const i in n)t[i]===void 0&&e.removeValue(i);return t}const bg=new WeakMap,Hw=Object.keys(uo),zA=Hw.length,Sg=["AnimationStart","AnimationComplete","Update","BeforeLayoutMeasure","LayoutMeasure","LayoutAnimationStart","LayoutAnimationComplete"],qA=of.length;class HA{constructor({parent:t,props:n,presenceContext:r,reducedMotionConfig:i,visualState:s},o={}){this.current=null,this.children=new Set,this.isVariantNode=!1,this.isControllingVariants=!1,this.shouldReduceMotion=null,this.values=new Map,this.features={},this.valueSubscriptions=new Map,this.prevMotionValues={},this.events={},this.propEventSubscriptions={},this.notifyUpdate=()=>this.notify("Update",this.latestValues),this.render=()=>{this.current&&(this.triggerBuild(),this.renderInstance(this.current,this.renderState,this.props.style,this.projection))},this.scheduleRender=()=>me.render(this.render,!1,!0);const{latestValues:a,renderState:l}=s;this.latestValues=a,this.baseTarget={...a},this.initialValues=n.initial?{...a}:{},this.renderState=l,this.parent=t,this.props=n,this.presenceContext=r,this.depth=t?t.depth+1:0,this.reducedMotionConfig=i,this.options=o,this.isControllingVariants=Kl(n),this.isVariantNode=Ax(n),this.isVariantNode&&(this.variantChildren=new Set),this.manuallyAnimateOnMount=!!(t&&t.current);const{willChange:u,...c}=this.scrapeMotionValuesFromProps(n,{});for(const d in c){const h=c[d];a[d]!==void 0&&ct(h)&&(h.set(a[d],!1),pl(u)&&u.add(d))}}scrapeMotionValuesFromProps(t,n){return{}}mount(t){this.current=t,bg.set(t,this),this.projection&&!this.projection.instance&&this.projection.mount(t),this.parent&&this.isVariantNode&&!this.isControllingVariants&&(this.removeFromVariantTree=this.parent.addVariantChild(this)),this.values.forEach((n,r)=>this.bindToMotionValue(r,n)),qw.current||UA(),this.shouldReduceMotion=this.reducedMotionConfig==="never"?!1:this.reducedMotionConfig==="always"?!0:Rd.current,this.parent&&this.parent.children.add(this),this.update(this.props,this.presenceContext)}unmount(){bg.delete(this.current),this.projection&&this.projection.unmount(),Tn(this.notifyUpdate),Tn(this.render),this.valueSubscriptions.forEach(t=>t()),this.removeFromVariantTree&&this.removeFromVariantTree(),this.parent&&this.parent.children.delete(this);for(const t in this.events)this.events[t].clear();for(const t in this.features)this.features[t].unmount();this.current=null}bindToMotionValue(t,n){const r=zr.has(t),i=n.on("change",o=>{this.latestValues[t]=o,this.props.onUpdate&&me.update(this.notifyUpdate,!1,!0),r&&this.projection&&(this.projection.isTransformDirty=!0)}),s=n.on("renderRequest",this.scheduleRender);this.valueSubscriptions.set(t,()=>{i(),s()})}sortNodePosition(t){return!this.current||!this.sortInstanceNodePosition||this.type!==t.type?0:this.sortInstanceNodePosition(this.current,t.current)}loadFeatures({children:t,...n},r,i,s){let o,a;for(let l=0;l<zA;l++){const u=Hw[l],{isEnabled:c,Feature:d,ProjectionNode:h,MeasureLayout:f}=uo[u];h&&(o=h),c(n)&&(!this.features[u]&&d&&(this.features[u]=new d(this)),f&&(a=f))}if((this.type==="html"||this.type==="svg")&&!this.projection&&o){this.projection=new o(this.latestValues,this.parent&&this.parent.projection);const{layoutId:l,layout:u,drag:c,dragConstraints:d,layoutScroll:h,layoutRoot:f}=n;this.projection.setOptions({layoutId:l,layout:u,alwaysMeasureLayout:!!c||d&&xi(d),visualElement:this,scheduleRender:()=>this.scheduleRender(),animationType:typeof u=="string"?u:"both",initialPromotionConfig:s,layoutScroll:h,layoutRoot:f})}return a}updateFeatures(){for(const t in this.features){const n=this.features[t];n.isMounted?n.update():(n.mount(),n.isMounted=!0)}}triggerBuild(){this.build(this.renderState,this.latestValues,this.options,this.props)}measureViewportBox(){return this.current?this.measureInstanceViewportBox(this.current,this.props):Pe()}getStaticValue(t){return this.latestValues[t]}setStaticValue(t,n){this.latestValues[t]=n}makeTargetAnimatable(t,n=!0){return this.makeTargetAnimatableFromInstance(t,this.props,n)}update(t,n){(t.transformTemplate||this.props.transformTemplate)&&this.scheduleRender(),this.prevProps=this.props,this.props=t,this.prevPresenceContext=this.presenceContext,this.presenceContext=n;for(let r=0;r<Sg.length;r++){const i=Sg[r];this.propEventSubscriptions[i]&&(this.propEventSubscriptions[i](),delete this.propEventSubscriptions[i]);const s=t["on"+i];s&&(this.propEventSubscriptions[i]=this.on(i,s))}this.prevMotionValues=VA(this,this.scrapeMotionValuesFromProps(t,this.prevProps),this.prevMotionValues),this.handleChildMotionValue&&this.handleChildMotionValue()}getProps(){return this.props}getVariant(t){return this.props.variants?this.props.variants[t]:void 0}getDefaultTransition(){return this.props.transition}getTransformPagePoint(){return this.props.transformPagePoint}getClosestVariantNode(){return this.isVariantNode?this:this.parent?this.parent.getClosestVariantNode():void 0}getVariantContext(t=!1){if(t)return this.parent?this.parent.getVariantContext():void 0;if(!this.isControllingVariants){const r=this.parent?this.parent.getVariantContext()||{}:{};return this.props.initial!==void 0&&(r.initial=this.props.initial),r}const n={};for(let r=0;r<qA;r++){const i=of[r],s=this.props[i];(lo(s)||s===!1)&&(n[i]=s)}return n}addVariantChild(t){const n=this.getClosestVariantNode();if(n)return n.variantChildren&&n.variantChildren.add(t),()=>n.variantChildren.delete(t)}addValue(t,n){n!==this.values.get(t)&&(this.removeValue(t),this.bindToMotionValue(t,n)),this.values.set(t,n),this.latestValues[t]=n.get()}removeValue(t){this.values.delete(t);const n=this.valueSubscriptions.get(t);n&&(n(),this.valueSubscriptions.delete(t)),delete this.latestValues[t],this.removeValueFromRenderState(t,this.renderState)}hasValue(t){return this.values.has(t)}getValue(t,n){if(this.props.values&&this.props.values[t])return this.props.values[t];let r=this.values.get(t);return r===void 0&&n!==void 0&&(r=$i(n,{owner:this}),this.addValue(t,r)),r}readValue(t){var n;return this.latestValues[t]!==void 0||!this.current?this.latestValues[t]:(n=this.getBaseTargetFromProps(this.props,t))!==null&&n!==void 0?n:this.readValueFromInstance(this.current,t,this.options)}setBaseTarget(t,n){this.baseTarget[t]=n}getBaseTarget(t){var n;const{initial:r}=this.props,i=typeof r=="string"||typeof r=="object"?(n=pf(this.props,r))===null||n===void 0?void 0:n[t]:void 0;if(r&&i!==void 0)return i;const s=this.getBaseTargetFromProps(this.props,t);return s!==void 0&&!ct(s)?s:this.initialValues[t]!==void 0&&i===void 0?void 0:this.baseTarget[t]}on(t,n){return this.events[t]||(this.events[t]=new _f),this.events[t].add(n)}notify(t,...n){this.events[t]&&this.events[t].notify(...n)}}class Ww extends HA{sortInstanceNodePosition(t,n){return t.compareDocumentPosition(n)&2?1:-1}getBaseTargetFromProps(t,n){return t.style?t.style[n]:void 0}removeValueFromRenderState(t,{vars:n,style:r}){delete n[t],delete r[t]}makeTargetAnimatableFromInstance({transition:t,transitionEnd:n,...r},{transformValues:i},s){let o=lP(r,t||{},this);if(i&&(n&&(n=i(n)),r&&(r=i(r)),o&&(o=i(o))),s){oP(this,r,o);const a=$A(this,r,o,n);n=a.transitionEnd,r=a.target}return{transition:t,transitionEnd:n,...r}}}function WA(e){return window.getComputedStyle(e)}class GA extends Ww{constructor(){super(...arguments),this.type="html"}readValueFromInstance(t,n){if(zr.has(n)){const r=xf(n);return r&&r.default||0}else{const r=WA(t),i=(jx(n)?r.getPropertyValue(n):r[n])||0;return typeof i=="string"?i.trim():i}}measureInstanceViewportBox(t,{transformPagePoint:n}){return jw(t,n)}build(t,n,r,i){uf(t,n,r,i.transformTemplate)}scrapeMotionValuesFromProps(t,n){return ff(t,n)}handleChildMotionValue(){this.childSubscription&&(this.childSubscription(),delete this.childSubscription);const{children:t}=this.props;ct(t)&&(this.childSubscription=t.on("change",n=>{this.current&&(this.current.textContent=`${n}`)}))}renderInstance(t,n,r,i){Fx(t,n,r,i)}}class KA extends Ww{constructor(){super(...arguments),this.type="svg",this.isSVGTag=!1}getBaseTargetFromProps(t,n){return t[n]}readValueFromInstance(t,n){if(zr.has(n)){const r=xf(n);return r&&r.default||0}return n=$x.has(n)?n:rf(n),t.getAttribute(n)}measureInstanceViewportBox(){return Pe()}scrapeMotionValuesFromProps(t,n){return Vx(t,n)}build(t,n,r,i){df(t,n,r,this.isSVGTag,i.transformTemplate)}renderInstance(t,n,r,i){Ux(t,n,r,i)}mount(t){this.isSVGTag=hf(t.tagName),super.mount(t)}}const JA=(e,t)=>lf(e)?new KA(t,{enableHardwareAcceleration:!1}):new GA(t,{enableHardwareAcceleration:!0}),QA={layout:{ProjectionNode:Vw,MeasureLayout:Dw}},XA={...SP,...zE,...PA,...QA},We=YC((e,t)=>RE(e,t,XA,JA));function Gw(){const e=C.useRef(!1);return nf(()=>(e.current=!0,()=>{e.current=!1}),[]),e}function YA(){const e=Gw(),[t,n]=C.useState(0),r=C.useCallback(()=>{e.current&&n(t+1)},[t]);return[C.useCallback(()=>me.postRender(r),[r]),t]}class ZA extends C.Component{getSnapshotBeforeUpdate(t){const n=this.props.childRef.current;if(n&&t.isPresent&&!this.props.isPresent){const r=this.props.sizeRef.current;r.height=n.offsetHeight||0,r.width=n.offsetWidth||0,r.top=n.offsetTop,r.left=n.offsetLeft}return null}componentDidUpdate(){}render(){return this.props.children}}function e2({children:e,isPresent:t}){const n=C.useId(),r=C.useRef(null),i=C.useRef({width:0,height:0,top:0,left:0});return C.useInsertionEffect(()=>{const{width:s,height:o,top:a,left:l}=i.current;if(t||!r.current||!s||!o)return;r.current.dataset.motionPopId=n;const u=document.createElement("style");return document.head.appendChild(u),u.sheet&&u.sheet.insertRule(`
          [data-motion-pop-id="${n}"] {
            position: absolute !important;
            width: ${s}px !important;
            height: ${o}px !important;
            top: ${a}px !important;
            left: ${l}px !important;
          }
        `),()=>{document.head.removeChild(u)}},[t]),C.createElement(ZA,{isPresent:t,childRef:r,sizeRef:i},C.cloneElement(e,{ref:r}))}const Ku=({children:e,initial:t,isPresent:n,onExitComplete:r,custom:i,presenceAffectsLayout:s,mode:o})=>{const a=zx(t2),l=C.useId(),u=C.useMemo(()=>({id:l,initial:t,isPresent:n,custom:i,onExitComplete:c=>{a.set(c,!0);for(const d of a.values())if(!d)return;r&&r()},register:c=>(a.set(c,!1),()=>a.delete(c))}),s?void 0:[n]);return C.useMemo(()=>{a.forEach((c,d)=>a.set(d,!1))},[n]),C.useEffect(()=>{!n&&!a.size&&r&&r()},[n]),o==="popLayout"&&(e=C.createElement(e2,{isPresent:n},e)),C.createElement(Hl.Provider,{value:u},e)};function t2(){return new Map}function n2(e){return C.useEffect(()=>()=>e(),[])}const kr=e=>e.key||"";function r2(e,t){e.forEach(n=>{const r=kr(n);t.set(r,n)})}function i2(e){const t=[];return C.Children.forEach(e,n=>{C.isValidElement(n)&&t.push(n)}),t}const s2=({children:e,custom:t,initial:n=!0,onExitComplete:r,exitBeforeEnter:i,presenceAffectsLayout:s=!0,mode:o="sync"})=>{const a=C.useContext(af).forceRender||YA()[0],l=Gw(),u=i2(e);let c=u;const d=C.useRef(new Map).current,h=C.useRef(c),f=C.useRef(new Map).current,p=C.useRef(!0);if(nf(()=>{p.current=!1,r2(u,f),h.current=c}),n2(()=>{p.current=!0,f.clear(),d.clear()}),p.current)return C.createElement(C.Fragment,null,c.map(g=>C.createElement(Ku,{key:kr(g),isPresent:!0,initial:n?void 0:!1,presenceAffectsLayout:s,mode:o},g)));c=[...c];const v=h.current.map(kr),w=u.map(kr),m=v.length;for(let g=0;g<m;g++){const y=v[g];w.indexOf(y)===-1&&!d.has(y)&&d.set(y,void 0)}return o==="wait"&&d.size&&(c=[]),d.forEach((g,y)=>{if(w.indexOf(y)!==-1)return;const k=f.get(y);if(!k)return;const T=v.indexOf(y);let S=g;if(!S){const P=()=>{d.delete(y);const A=Array.from(f.keys()).filter(O=>!w.includes(O));if(A.forEach(O=>f.delete(O)),h.current=u.filter(O=>{const E=kr(O);return E===y||A.includes(E)}),!d.size){if(l.current===!1)return;a(),r&&r()}};S=C.createElement(Ku,{key:kr(k),isPresent:!1,onExitComplete:P,custom:t,presenceAffectsLayout:s,mode:o},k),d.set(y,S)}c.splice(T,0,S)}),c=c.map(g=>{const y=g.key;return d.has(y)?g:C.createElement(Ku,{key:kr(g),isPresent:!0,presenceAffectsLayout:s,mode:o},g)}),C.createElement(C.Fragment,null,d.size?c:c.map(g=>C.cloneElement(g)))},Sr={calculatorRiskThresholds:`// 來自 src/domains/inventory/calculator.js
const CRITICAL_DAYS = 7;
const WARNING_DAYS = 14;
const HIGH_VOLATILITY = 0.2;`,calculateDaysToStockout:`// 來自 src/domains/inventory/calculator.js
export function calculateDaysToStockout(currentStock, dailyDemand, safetyStock = 0) {
  if (typeof currentStock !== 'number' || typeof dailyDemand !== 'number') {
    return { days: null, status: 'error', message: '輸入必須是數字' };
  }
  if (currentStock < 0) currentStock = 0;
  if (dailyDemand <= 0) {
    return { days: Infinity, status: 'safe', message: '無需求，不會缺貨' };
  }
  const availableStock = Math.max(0, currentStock - safetyStock);
  const days = availableStock / dailyDemand;
  let status;
  if (days <= CRITICAL_DAYS) status = 'critical';
  else if (days <= WARNING_DAYS) status = 'warning';
  else status = 'safe';
  return { days: Math.round(days * 10) / 10, status, message: null };
}`,bomExplodeSnippet:`// 來自 src/domains/forecast/bomCalculator.js
const MAX_BOM_DEPTH = 50;

export function explodeBOM(parentMaterial, quantity, bomIndex, opts = {}) {
  const visited = opts._visited || new Set();
  const depth = opts._depth || 0;

  if (depth > MAX_BOM_DEPTH) {
    return { error: 'MAX_DEPTH_EXCEEDED', materials: [] };
  }
  if (visited.has(parentMaterial)) {
    return { error: 'CIRCULAR_REFERENCE', materials: [] };
  }
  visited.add(parentMaterial);

  const children = bomIndex[parentMaterial] || [];
  let results = [];
  for (const child of children) {
    const needed = quantity * child.qty_per * (1 + (child.scrap_rate || 0));
    results.push({ material: child.child_material, quantity: needed, depth });
    // 遞迴展開子組件
    const sub = explodeBOM(child.child_material, needed, bomIndex, {
      _visited: new Set(visited), _depth: depth + 1
    });
    if (sub.error) return sub;
    results = results.concat(sub.materials);
  }
  return { error: null, materials: results };
}`,eventBusSnippet:`// 來自 src/services/governance/eventBus.js
class EventBus {
  constructor() {
    this._listeners = new Map();
  }
  on(event, callback) {
    if (!this._listeners.has(event)) {
      this._listeners.set(event, new Set());
    }
    this._listeners.get(event).add(callback);
    return () => this.off(event, callback); // 回傳 unsubscribe
  }
  emit(event, payload) {
    const handlers = this._listeners.get(event);
    if (handlers) handlers.forEach(fn => fn(payload));
    // wildcard: 'agent:*' 匹配 'agent:start', 'agent:done' 等
    for (const [pattern, fns] of this._listeners) {
      if (pattern.endsWith('*') && event.startsWith(pattern.slice(0, -1))) {
        fns.forEach(fn => fn(payload));
      }
    }
  }
  off(event, callback) {
    this._listeners.get(event)?.delete(callback);
  }
}`,semaphoreSnippet:`// 來自 src/services/ai-infra/aiProxyService.js
class AsyncSemaphore {
  constructor(max) {
    this._max = max;
    this._active = 0;
    this._queue = [];
  }
  async acquire(signal) {
    if (this._active < this._max) {
      this._active++;
      return;
    }
    return new Promise((resolve, reject) => {
      const waiter = { resolve, reject };
      this._queue.push(waiter);
      signal?.addEventListener('abort', () => {
        const idx = this._queue.indexOf(waiter);
        if (idx !== -1) this._queue.splice(idx, 1);
        reject(new DOMException('Aborted', 'AbortError'));
      });
    });
  }
  release() {
    this._active--;
    if (this._queue.length > 0) {
      this._active++;
      this._queue.shift().resolve();
    }
  }
}`,circuitBreakerSnippet:`// 來自 src/services/ai-infra/aiProxyService.js
const STATE = { CLOSED: 'CLOSED', OPEN: 'OPEN', HALF_OPEN: 'HALF_OPEN' };

class CircuitBreaker {
  constructor({ failureThreshold = 3, cooldownMs = 60000, windowMs = 30000 } = {}) {
    this.state = STATE.CLOSED;
    this.failures = [];
    this.failureThreshold = failureThreshold;
    this.cooldownMs = cooldownMs;
    this.windowMs = windowMs;
    this.openedAt = null;
  }
  recordSuccess() {
    if (this.state === STATE.HALF_OPEN) {
      this.state = STATE.CLOSED;
      this.failures = [];
      this.cooldownMs = 60000; // reset
    }
  }
  recordFailure() {
    const now = Date.now();
    this.failures = this.failures.filter(t => now - t < this.windowMs);
    this.failures.push(now);
    if (this.failures.length >= this.failureThreshold) {
      this.state = STATE.OPEN;
      this.openedAt = now;
    }
  }
  canRequest() {
    if (this.state === STATE.CLOSED) return true;
    if (this.state === STATE.OPEN) {
      if (Date.now() - this.openedAt >= this.cooldownMs) {
        this.state = STATE.HALF_OPEN;
        return true; // 允許一次試探
      }
      return false;
    }
    return false; // HALF_OPEN 已有一個在飛
  }
}`},o2=[{id:"1-1",name:"變數與型別",description:"學習 JavaScript 的 let / const / var 以及基本型別",xp:50,challenges:[{id:1,name:"宣告變數",type:"fill-blank",difficulty:"easy",instruction:'用 `let` 宣告一個變數 `productName`，值為 `"COMP-001"`；用 `const` 宣告 `safetyStock`，值為 `100`。',defaultCode:`// 宣告一個可以改變的變數 productName，值為 "COMP-001"
_____ productName = "COMP-001";

// 宣告一個不可改變的常數 safetyStock，值為 100
_____ safetyStock = 100;

console.log(productName, safetyStock);`,solution:`let productName = "COMP-001";
const safetyStock = 100;
console.log(productName, safetyStock);`,example:{title:"範例：let 與 const 的用法",code:`let city = "Taipei";
const PI = 3.14;
console.log(city, PI);`,output:"Taipei 3.14",explanation:"let 宣告可以改變的變數，const 宣告不可改變的常數。"},tests:[{description:'productName 等於 "COMP-001"',fn:'(ctx) => ctx.productName === "COMP-001"'},{description:"safetyStock 等於 100",fn:"(ctx) => ctx.safetyStock === 100"}],returnVars:["productName","safetyStock"]},{id:2,name:"型別判斷",type:"coding",difficulty:"easy",instruction:"寫一個函式 `getType(value)`，回傳 value 的型別字串（用 `typeof`）。",defaultCode:`function getType(value) {
  // 回傳 value 的型別
  
}

console.log(getType(42));
console.log(getType("hello"));
console.log(getType(true));`,example:{title:"範例：typeof 運算子",code:`let x = 100;
console.log(typeof x);
console.log(typeof "hello");`,output:`number
string`,explanation:'typeof 會回傳一個字串，告訴你該值的型別，例如 "number"、"string"、"boolean" 等。'},tests:[{description:'getType(42) === "number"',fn:'(ctx) => ctx.getType(42) === "number"'},{description:'getType("hi") === "string"',fn:'(ctx) => ctx.getType("hi") === "string"'},{description:'getType(true) === "boolean"',fn:'(ctx) => ctx.getType(true) === "boolean"'},{description:'getType(null) === "object"',fn:'(ctx) => ctx.getType(null) === "object"'},{description:'getType(undefined) === "undefined"',fn:'(ctx) => ctx.getType(undefined) === "undefined"'}],returnVars:["getType"]},{id:3,name:"型別轉換",type:"coding",difficulty:"medium",instruction:"寫一個函式 `parseStock(value)`，把字串或數字轉成整數。如果無法轉換回傳 `0`。",defaultCode:`function parseStock(value) {
  // 把 value 轉成整數，無法轉換回傳 0
  
}

console.log(parseStock("150"));  // 150
console.log(parseStock("abc"));  // 0
console.log(parseStock(42.7));   // 42`,example:{title:"範例：parseInt 轉換字串為整數",code:`let result = parseInt("99");
console.log(result);
console.log(parseInt("xyz"));
console.log(isNaN(parseInt("xyz")));`,output:`99
NaN
true`,explanation:"parseInt 可以把字串轉成整數，如果無法轉換會回傳 NaN。可以用 isNaN() 來檢查是否轉換失敗。"},tests:[{description:'parseStock("150") === 150',fn:'(ctx) => ctx.parseStock("150") === 150'},{description:'parseStock("abc") === 0',fn:'(ctx) => ctx.parseStock("abc") === 0'},{description:"parseStock(42.7) === 42",fn:"(ctx) => ctx.parseStock(42.7) === 42"},{description:'parseStock("") === 0',fn:'(ctx) => ctx.parseStock("") === 0'},{description:"parseStock(null) === 0",fn:"(ctx) => ctx.parseStock(null) === 0"}],returnVars:["parseStock"]}]},{id:"1-2",name:"函式與 return",description:"學習如何定義函式、參數、以及 return 的重要性",xp:50,challenges:[{id:1,name:"第一個函式",type:"coding",difficulty:"easy",instruction:"寫一個函式 `add(a, b)` 回傳兩數相加的結果。",defaultCode:`function add(a, b) {
  // 回傳 a + b
  
}`,example:{title:"範例：函式與 return",code:`function multiply(a, b) {
  return a * b;
}
console.log(multiply(3, 4));`,output:"12",explanation:"函式用 return 把結果傳回去。如果沒寫 return，函式會回傳 undefined。"},tests:[{description:"add(1, 2) === 3",fn:"(ctx) => ctx.add(1, 2) === 3"},{description:"add(0, 0) === 0",fn:"(ctx) => ctx.add(0, 0) === 0"},{description:"add(-5, 5) === 0",fn:"(ctx) => ctx.add(-5, 5) === 0"}],returnVars:["add"]},{id:2,name:"預設參數",type:"coding",difficulty:"easy",instruction:'寫一個函式 `greet(name, greeting = "你好")`，回傳 `"你好, 小明"` 這樣的格式。',defaultCode:`function greet(name, greeting = "你好") {
  // 回傳 greeting + ", " + name
  
}`,example:{title:"範例：預設參數",code:`function introduce(name, role = "工程師") {
  return name + " 是 " + role;
}
console.log(introduce("Amy"));
console.log(introduce("Bob", "設計師"));`,output:`Amy 是 工程師
Bob 是 設計師`,explanation:"參數可以給預設值，呼叫時沒傳就會用預設值，有傳就會覆蓋。"},tests:[{description:'greet("小明") === "你好, 小明"',fn:'(ctx) => ctx.greet("小明") === "你好, 小明"'},{description:'greet("DI", "嗨") === "嗨, DI"',fn:'(ctx) => ctx.greet("DI", "嗨") === "嗨, DI"'}],returnVars:["greet"]},{id:3,name:"箭頭函式與解構",type:"coding",difficulty:"medium",instruction:'用箭頭函式寫 `getStockInfo`，接收一個物件 `{ materialCode, quantity, unit }`，回傳字串 `"COMP-001: 500 PCS"`。',defaultCode:`// 用箭頭函式 + 解構參數
const getStockInfo = () => {
  // 你的程式碼
};

console.log(getStockInfo({ materialCode: "COMP-001", quantity: 500, unit: "PCS" }));`,example:{title:"範例：箭頭函式 + 解構參數",code:'const getUserInfo = ({ name, age }) => {\n  return `${name} (${age}歲)`;\n};\nconsole.log(getUserInfo({ name: "Alice", age: 25 }));',output:"Alice (25歲)",explanation:"箭頭函式的參數可以直接用 { } 解構物件，取出需要的屬性。搭配模板字串 `${}` 組合輸出。"},tests:[{description:"正常情況",fn:'(ctx) => ctx.getStockInfo({ materialCode: "COMP-001", quantity: 500, unit: "PCS" }) === "COMP-001: 500 PCS"'},{description:"不同資料",fn:'(ctx) => ctx.getStockInfo({ materialCode: "RM-002", quantity: 1000, unit: "KG" }) === "RM-002: 1000 KG"'}],returnVars:["getStockInfo"]}]},{id:"1-3",name:"條件判斷",description:"學習 if/else 與條件運算子",xp:50,challenges:[{id:1,name:"風險等級分類",type:"coding",difficulty:"easy",instruction:`寫一個函式 \`classifyRisk(days)\`，依據庫存天數回傳風險等級：
- days <= 7 → "critical"
- days <= 14 → "warning"
- 其他 → "safe"

（這就是你真實專案 calculator.js 裡的邏輯！）`,defaultCode:`// DI 專案裡的常數
const CRITICAL_DAYS = 7;
const WARNING_DAYS = 14;

function classifyRisk(days) {
  // 你的程式碼
  
}`,referenceCode:Sr.calculatorRiskThresholds,example:{title:"範例：if / else if / else",code:`function getSize(weight) {
  if (weight <= 5) return "S";
  else if (weight <= 20) return "M";
  else return "L";
}
console.log(getSize(3));
console.log(getSize(15));`,output:`S
M`,explanation:"用 if/else if/else 依條件分支回傳不同的值。注意順序很重要，先判斷最小的範圍。"},tests:[{description:'classifyRisk(3) === "critical"',fn:'(ctx) => ctx.classifyRisk(3) === "critical"'},{description:'classifyRisk(7) === "critical"',fn:'(ctx) => ctx.classifyRisk(7) === "critical"'},{description:'classifyRisk(10) === "warning"',fn:'(ctx) => ctx.classifyRisk(10) === "warning"'},{description:'classifyRisk(14) === "warning"',fn:'(ctx) => ctx.classifyRisk(14) === "warning"'},{description:'classifyRisk(30) === "safe"',fn:'(ctx) => ctx.classifyRisk(30) === "safe"'}],returnVars:["classifyRisk"]},{id:2,name:"成績分級",type:"coding",difficulty:"medium",instruction:'寫 `gradeScore(score)`：90+ → "A", 80+ → "B", 70+ → "C", 60+ → "D", 其他 → "F"。分數 < 0 或 > 100 回傳 "Invalid"。',defaultCode:`function gradeScore(score) {
  // 你的程式碼
  
}`,example:{title:"範例：多層條件判斷",code:`function tempLabel(temp) {
  if (temp < 0) return "freezing";
  else if (temp < 15) return "cold";
  else if (temp < 30) return "warm";
  else return "hot";
}
console.log(tempLabel(25));`,output:"warm",explanation:"多個 else if 可以處理多個區間，從上到下依序判斷，第一個符合的就回傳。"},tests:[{description:'gradeScore(95) === "A"',fn:'(ctx) => ctx.gradeScore(95) === "A"'},{description:'gradeScore(82) === "B"',fn:'(ctx) => ctx.gradeScore(82) === "B"'},{description:'gradeScore(71) === "C"',fn:'(ctx) => ctx.gradeScore(71) === "C"'},{description:'gradeScore(60) === "D"',fn:'(ctx) => ctx.gradeScore(60) === "D"'},{description:'gradeScore(45) === "F"',fn:'(ctx) => ctx.gradeScore(45) === "F"'},{description:'gradeScore(-5) === "Invalid"',fn:'(ctx) => ctx.gradeScore(-5) === "Invalid"'},{description:'gradeScore(105) === "Invalid"',fn:'(ctx) => ctx.gradeScore(105) === "Invalid"'}],returnVars:["gradeScore"]},{id:3,name:"三元運算子",type:"coding",difficulty:"medium",instruction:'寫 `getStockLabel(qty, safetyStock)` 用三元運算子，若 qty > safetyStock 回傳 "充足"，否則 "不足"。',defaultCode:`function getStockLabel(qty, safetyStock) {
  // 用三元運算子 (? :)
  
}`,example:{title:"範例：三元運算子 (? :)",code:`let age = 20;
let label = age >= 18 ? "成人" : "未成年";
console.log(label);`,output:"成人",explanation:"三元運算子的格式是 條件 ? 值A : 值B。條件為 true 回傳值A，false 回傳值B。比 if/else 更簡潔。"},tests:[{description:"庫存充足",fn:'(ctx) => ctx.getStockLabel(500, 100) === "充足"'},{description:"庫存不足",fn:'(ctx) => ctx.getStockLabel(50, 100) === "不足"'},{description:"剛好等於",fn:'(ctx) => ctx.getStockLabel(100, 100) === "不足"'}],returnVars:["getStockLabel"]}]},{id:"1-4",name:"物件與解構",description:"理解 JavaScript 物件，以及專案裡的資料結構",xp:50,challenges:[{id:1,name:"建立庫存物件",type:"coding",difficulty:"easy",instruction:"建立一個函式 `createInventoryItem(code, stock, demand)`，回傳物件 `{ materialCode, currentStock, dailyDemand }`。",defaultCode:`function createInventoryItem(code, stock, demand) {
  // 回傳一個物件
  
}`,example:{title:"範例：建立並回傳物件",code:`function createUser(name, age) {
  return { userName: name, userAge: age };
}
console.log(createUser("Amy", 25));`,output:'{ userName: "Amy", userAge: 25 }',explanation:"用 { key: value } 建立物件，函式參數可以當作 value 放進去。"},tests:[{description:"回傳正確物件",fn:'(ctx) => { const r = ctx.createInventoryItem("COMP-001", 500, 50); return r.materialCode === "COMP-001" && r.currentStock === 500 && r.dailyDemand === 50; }'}],returnVars:["createInventoryItem"]},{id:2,name:"解構賦值",type:"coding",difficulty:"medium",instruction:'寫 `summarizeItem(item)` 接收 `{ materialCode, currentStock, dailyDemand, safetyStock }` 物件，用解構取出屬性，回傳字串 `"COMP-001: 庫存 500, 日需求 50, 安全庫存 100"`。',defaultCode:`function summarizeItem(item) {
  // 用解構賦值取出屬性
  
}`,example:{title:"範例：解構賦值",code:'const book = { title: "JS入門", price: 350 };\nconst { title, price } = book;\nconsole.log(`${title} 售價 ${price}元`);',output:"JS入門 售價 350元",explanation:"解構賦值用 const { key1, key2 } = obj 從物件中取出屬性，變數名稱必須跟屬性名稱一樣。"},tests:[{description:"格式正確",fn:'(ctx) => ctx.summarizeItem({ materialCode: "COMP-001", currentStock: 500, dailyDemand: 50, safetyStock: 100 }) === "COMP-001: 庫存 500, 日需求 50, 安全庫存 100"'}],returnVars:["summarizeItem"]},{id:3,name:"展開運算子",type:"coding",difficulty:"medium",instruction:"寫 `updateStock(item, newStock)` 用展開運算子 `{...item}` 回傳一個新物件，只更新 `currentStock`，不修改原物件。",defaultCode:`function updateStock(item, newStock) {
  // 用 spread operator 建立新物件
  
}`,example:{title:"範例：展開運算子 {...}",code:`const original = { name: "Amy", score: 80 };
const updated = { ...original, score: 95 };
console.log(updated);
console.log(original.score);`,output:`{ name: "Amy", score: 95 }
80`,explanation:"{ ...obj, key: newValue } 會複製一份物件，再覆蓋指定的屬性。原物件不會被改變。"},tests:[{description:"更新庫存值",fn:'(ctx) => { const orig = { materialCode: "X", currentStock: 100 }; const updated = ctx.updateStock(orig, 200); return updated.currentStock === 200 && updated.materialCode === "X"; }'},{description:"不修改原物件",fn:'(ctx) => { const orig = { materialCode: "X", currentStock: 100 }; ctx.updateStock(orig, 200); return orig.currentStock === 100; }'}],returnVars:["updateStock"]}]},{id:"1-5",name:"陣列與迴圈",description:"用 map, filter, reduce 處理庫存資料",xp:50,challenges:[{id:1,name:"過濾低庫存",type:"coding",difficulty:"easy",instruction:"寫 `filterLowStock(items, threshold)` 用 `.filter()` 回傳 `currentStock < threshold` 的物件陣列。",defaultCode:`function filterLowStock(items, threshold) {
  // 用 .filter()
  
}

// 測試資料（來自你專案的 inventory_snapshots.csv）
const inventory = [
  { materialCode: "COMP-001", currentStock: 50 },
  { materialCode: "COMP-002", currentStock: 500 },
  { materialCode: "COMP-003", currentStock: 80 },
];`,example:{title:"範例：.filter() 過濾陣列",code:`const nums = [3, 8, 1, 12, 5];
const big = nums.filter(n => n > 5);
console.log(big);`,output:"[8, 12]",explanation:".filter(fn) 會回傳一個新陣列，只留下讓 fn 回傳 true 的元素。原陣列不會改變。"},tests:[{description:"過濾出低庫存",fn:'(ctx) => { const r = ctx.filterLowStock([{materialCode:"A",currentStock:50},{materialCode:"B",currentStock:500}], 100); return r.length === 1 && r[0].materialCode === "A"; }'},{description:"全部都低",fn:"(ctx) => ctx.filterLowStock([{currentStock:1},{currentStock:2}], 10).length === 2"},{description:"沒有低庫存",fn:"(ctx) => ctx.filterLowStock([{currentStock:100}], 10).length === 0"}],returnVars:["filterLowStock"]},{id:2,name:"加總庫存",type:"coding",difficulty:"medium",instruction:"寫 `totalStock(items)` 用 `.reduce()` 回傳所有 `currentStock` 的總和。",defaultCode:`function totalStock(items) {
  // 用 .reduce() 加總 currentStock
  
}`,example:{title:"範例：.reduce() 加總數字",code:`const prices = [30, 50, 20];
const total = prices.reduce((sum, p) => sum + p, 0);
console.log(total);`,output:"100",explanation:".reduce(fn, 初始值) 把陣列「縮減」成一個值。fn 的第一個參數是累積值，第二個是當前元素。"},tests:[{description:"正常加總",fn:"(ctx) => ctx.totalStock([{currentStock:100},{currentStock:200},{currentStock:300}]) === 600"},{description:"空陣列",fn:"(ctx) => ctx.totalStock([]) === 0"}],returnVars:["totalStock"]},{id:3,name:"轉換資料格式",type:"coding",difficulty:"medium",instruction:'寫 `toStockMap(items)` 用 `.reduce()` 把陣列轉成物件 `{ "COMP-001": 500, "COMP-002": 80 }`，key 是 materialCode，value 是 currentStock。',defaultCode:`function toStockMap(items) {
  // 用 .reduce() 轉成 { code: stock } 格式
  
}`,example:{title:"範例：.reduce() 把陣列轉成物件",code:`const fruits = [
  { name: "apple", qty: 3 },
  { name: "banana", qty: 5 }
];
const map = fruits.reduce((obj, f) => {
  obj[f.name] = f.qty;
  return obj;
}, {});
console.log(map);`,output:"{ apple: 3, banana: 5 }",explanation:".reduce() 不只能加總數字，也能把陣列轉成物件。初始值給 {}，每次把元素的資料放進去。"},tests:[{description:"轉換正確",fn:'(ctx) => { const r = ctx.toStockMap([{materialCode:"A",currentStock:100},{materialCode:"B",currentStock:200}]); return r.A === 100 && r.B === 200; }'},{description:"空陣列",fn:"(ctx) => Object.keys(ctx.toStockMap([])).length === 0"}],returnVars:["toStockMap"]}]},{id:"1-6",name:"Boss: 讀懂 calculator.js",description:"閱讀你真實專案的 calculateDaysToStockout 函式，理解它的邏輯並自己重寫",xp:200,isBoss:!0,challenges:[{id:1,name:"重寫 calculateDaysToStockout",type:"coding",difficulty:"hard",instruction:'參考右側的真實程式碼，自己重寫 `calculateDaysToStockout(currentStock, dailyDemand, safetyStock)`。\n\n規則：\n- 如果輸入不是數字 → `{ days: null, status: "error" }`\n- 如果 currentStock < 0 → 當作 0\n- 如果 dailyDemand <= 0 → `{ days: Infinity, status: "safe" }`\n- 否則算 `(currentStock - safetyStock) / dailyDemand`（不能是負的）\n- days <= 7 是 "critical"，<= 14 是 "warning"，其他是 "safe"',defaultCode:`const CRITICAL_DAYS = 7;
const WARNING_DAYS = 14;

function calculateDaysToStockout(currentStock, dailyDemand, safetyStock = 0) {
  // 你的程式碼
  
}`,referenceCode:Sr.calculateDaysToStockout,example:{title:"範例：結合驗證、條件分支與物件回傳",code:`function checkBattery(level) {
  if (typeof level !== "number") return { pct: null, status: "error" };
  if (level <= 0) return { pct: 0, status: "dead" };
  let status = level <= 20 ? "low" : "ok";
  return { pct: level, status };
}
console.log(checkBattery(15));`,output:'{ pct: 15, status: "low" }',explanation:"先做型別檢查，再處理邊界值，最後用條件決定 status。Boss 關的結構跟這個類似，但多了除法運算和預設參數。"},tests:[{description:"正常情況",fn:'(ctx) => { const r = ctx.calculateDaysToStockout(500, 50, 0); return r.days === 10 && r.status === "warning"; }'},{description:"扣除安全庫存",fn:'(ctx) => { const r = ctx.calculateDaysToStockout(500, 50, 100); return r.days === 8 && r.status === "warning"; }'},{description:"危急狀態",fn:'(ctx) => { const r = ctx.calculateDaysToStockout(100, 50, 0); return r.days === 2 && r.status === "critical"; }'},{description:"無需求",fn:'(ctx) => { const r = ctx.calculateDaysToStockout(100, 0); return r.days === Infinity && r.status === "safe"; }'},{description:"負庫存當作 0",fn:'(ctx) => { const r = ctx.calculateDaysToStockout(-10, 5); return r.days === 0 && r.status === "critical"; }'},{description:"輸入不是數字",fn:'(ctx) => { const r = ctx.calculateDaysToStockout("abc", 5); return r.days === null && r.status === "error"; }'},{description:"安全庫存大於現有庫存",fn:'(ctx) => { const r = ctx.calculateDaysToStockout(50, 10, 100); return r.days === 0 && r.status === "critical"; }'}],returnVars:["calculateDaysToStockout"]}]}],ln=[{id:1,name:"JavaScript 基礎島",emoji:"🏝️",description:"在這座島上，你要學會用程式碼跟電腦溝通",color:"from-emerald-500 to-teal-600",quests:o2},{id:2,name:"純函式神殿",emoji:"⛩️",description:"掌握寫出可測試、無副作用的程式碼的能力",color:"from-blue-500 to-indigo-600",quests:[{id:"2-1",name:"什麼是純函式",description:"判斷並寫出純函式",xp:50,challenges:[{id:1,name:"判斷純函式",type:"coding",difficulty:"easy",instruction:"寫一個函式 `isPure(fn)`（概念題）。以下四個函式，寫一個 `answers` 陣列，標記哪些是純函式（true/false）。\n\n1. `(a, b) => a + b`\n2. `(arr) => { arr.push(1); return arr; }`（修改了傳入的陣列）\n3. `(x) => Math.random() * x`（用了 Math.random）\n4. `(items) => items.filter(i => i > 0)`（filter 不修改原陣列）",defaultCode:`// 回傳一個陣列，標記四個函式是否為純函式
const answers = [
  // 1. (a, b) => a + b
  undefined, // 改成 true 或 false
  // 2. (arr) => { arr.push(1); return arr; }
  undefined,
  // 3. (x) => Math.random() * x
  undefined,
  // 4. (items) => items.filter(i => i > 0)
  undefined,
];`,example:{title:"範例：判斷是否為純函式",code:`// (x) => x * 2         → 純函式
// (x) => Date.now() + x → 不是（依賴外部狀態）
const demo = [true, false];`,output:"[true, false]",explanation:"純函式：不依賴外部狀態、不修改輸入、相同輸入永遠回傳相同輸出。"},tests:[{description:"函式1是純函式",fn:"(ctx) => ctx.answers[0] === true"},{description:"函式2不是純函式（修改了輸入）",fn:"(ctx) => ctx.answers[1] === false"},{description:"函式3不是純函式（用了隨機）",fn:"(ctx) => ctx.answers[2] === false"},{description:"函式4是純函式",fn:"(ctx) => ctx.answers[3] === true"}],returnVars:["answers"]},{id:2,name:"改成純函式",type:"coding",difficulty:"medium",instruction:"下面這個函式不是純函式（依賴外部變數 taxRate）。把它改成純函式，讓 taxRate 變成參數。",defaultCode:`// 改成純函式：把 taxRate 變成參數
function calculateTax(price, taxRate) {
  // 回傳 price * taxRate
  
}`,example:{title:"範例：將不純函式改成純函式",code:`// 不純：const rate = 0.1; function fee(x) { return x * rate; }
// 純：function fee(x, rate) { return x * rate; }
fee(50, 0.1); // 5`,output:"5",explanation:"把外部依賴的變數改成函式參數，就變成純函式了。"},tests:[{description:"calculateTax(100, 0.05) === 5",fn:"(ctx) => ctx.calculateTax(100, 0.05) === 5"},{description:"calculateTax(200, 0.1) === 20",fn:"(ctx) => ctx.calculateTax(200, 0.1) === 20"},{description:"calculateTax(0, 0.05) === 0",fn:"(ctx) => ctx.calculateTax(0, 0.05) === 0"}],returnVars:["calculateTax"]}]},{id:"2-2",name:"輸入驗證",description:"幫函式加上型別和範圍驗證",xp:50,challenges:[{id:1,name:"數字驗證",type:"coding",difficulty:"easy",instruction:'寫 `validateNumber(value)` — 如果 typeof value === "number" 且 !isNaN(value) 回傳 true，否則回傳 false。',defaultCode:`function validateNumber(value) {
  // 檢查是否為有效數字
  
}`,example:{title:"範例：檢查字串是否為非空",code:`function isNonEmpty(s) {
  return typeof s === "string" && s.length > 0;
}
isNonEmpty("hi"); // true`,output:"true",explanation:"先用 typeof 確認型別，再檢查內容，兩個條件都滿足才回傳 true。"},tests:[{description:"validateNumber(42) === true",fn:"(ctx) => ctx.validateNumber(42) === true"},{description:'validateNumber("42") === false',fn:'(ctx) => ctx.validateNumber("42") === false'},{description:"validateNumber(NaN) === false",fn:"(ctx) => ctx.validateNumber(NaN) === false"},{description:"validateNumber(0) === true",fn:"(ctx) => ctx.validateNumber(0) === true"},{description:"validateNumber(null) === false",fn:"(ctx) => ctx.validateNumber(null) === false"}],returnVars:["validateNumber"]},{id:2,name:"驗證折扣函式",type:"coding",difficulty:"medium",instruction:'寫 `calculateDiscount(price, rate)`：\n- price 必須是正數（> 0），否則 throw Error("price must be positive")\n- rate 必須在 0-1 之間，否則 throw Error("rate must be between 0 and 1")\n- 回傳 `price * (1 - rate)`',defaultCode:`function calculateDiscount(price, rate) {
  // 驗證 price 和 rate
  // 回傳折扣後的價格
  
}`,example:{title:"範例：帶驗證的加法函式",code:`function safeAdd(a, b) {
  if (typeof a !== "number") throw Error("a must be number");
  return a + b;
}
safeAdd(3, 4); // 7`,output:"7",explanation:"先驗證輸入，不合法就 throw Error，合法才計算回傳。"},tests:[{description:"正常折扣",fn:"(ctx) => ctx.calculateDiscount(100, 0.2) === 80"},{description:"無折扣",fn:"(ctx) => ctx.calculateDiscount(100, 0) === 100"},{description:"負價格報錯",fn:'(ctx) => { try { ctx.calculateDiscount(-10, 0.1); return false; } catch(e) { return e.message === "price must be positive"; } }'},{description:"rate 超過 1 報錯",fn:'(ctx) => { try { ctx.calculateDiscount(100, 1.5); return false; } catch(e) { return e.message === "rate must be between 0 and 1"; } }'},{description:"rate 負數報錯",fn:'(ctx) => { try { ctx.calculateDiscount(100, -0.1); return false; } catch(e) { return e.message === "rate must be between 0 and 1"; } }'}],returnVars:["calculateDiscount"]},{id:3,name:"安全的除法",type:"coding",difficulty:"medium",instruction:'寫 `safeDivide(a, b)` — 如果 a 或 b 不是數字回傳 `{ error: "invalid input", result: null }`，如果 b 是 0 回傳 `{ error: "division by zero", result: null }`，否則回傳 `{ error: null, result: a/b }`。',defaultCode:`function safeDivide(a, b) {
  // 你的程式碼
  
}`,example:{title:"範例：安全的平方根",code:`function safeSqrt(x) {
  if (typeof x !== "number") return { error: "not a number", result: null };
  if (x < 0) return { error: "negative", result: null };
  return { error: null, result: Math.sqrt(x) };
}`,output:"{ error: null, result: 3 }  // safeSqrt(9)",explanation:"用物件回傳錯誤資訊而非 throw，讓呼叫者能優雅處理錯誤。"},tests:[{description:"正常除法",fn:"(ctx) => { const r = ctx.safeDivide(10, 2); return r.error === null && r.result === 5; }"},{description:"除以零",fn:'(ctx) => ctx.safeDivide(10, 0).error === "division by zero"'},{description:"非數字輸入",fn:'(ctx) => ctx.safeDivide("a", 2).error === "invalid input"'}],returnVars:["safeDivide"]}]},{id:"2-3",name:"邊界情況",description:"處理各種邊界情況",xp:50,challenges:[{id:1,name:"數值夾限",type:"coding",difficulty:"easy",instruction:"寫 `clamp(value, min, max)` — 把 value 限制在 min 到 max 之間。如果 value < min 回傳 min，如果 value > max 回傳 max，否則回傳 value。",defaultCode:`function clamp(value, min, max) {
  // 把 value 限制在 min 到 max 之間
  
}`,example:{title:"範例：限制百分比在 0~100",code:`function limitPercent(v) {
  if (v < 0) return 0;
  if (v > 100) return 100;
  return v;
}
limitPercent(120); // 100`,output:"100",explanation:"超出上限回傳上限，低於下限回傳下限，範圍內直接回傳。"},tests:[{description:"clamp(5, 0, 10) === 5",fn:"(ctx) => ctx.clamp(5, 0, 10) === 5"},{description:"clamp(-3, 0, 10) === 0",fn:"(ctx) => ctx.clamp(-3, 0, 10) === 0"},{description:"clamp(15, 0, 10) === 10",fn:"(ctx) => ctx.clamp(15, 0, 10) === 10"},{description:"clamp(0, 0, 10) === 0",fn:"(ctx) => ctx.clamp(0, 0, 10) === 0"},{description:"clamp(10, 0, 10) === 10",fn:"(ctx) => ctx.clamp(10, 0, 10) === 10"}],returnVars:["clamp"]},{id:2,name:"健壯的庫存計算",type:"coding",difficulty:"hard",instruction:'寫 `robustStockDays(stock, demand, safety)`，處理所有邊界：\n- 任何參數不是 number 或是 NaN → `{ days: null, error: "invalid" }`\n- stock < 0 → 當作 0\n- demand <= 0 → `{ days: Infinity, error: null }`\n- safety 未傳 → 預設 0\n- 正常算 `Math.max(0, (stock - safety) / demand)` → `{ days: 結果, error: null }`',defaultCode:`function robustStockDays(stock, demand, safety = 0) {
  // 處理所有邊界情況
  
}`,example:{title:"範例：安全的速度計算",code:`function safeSpeed(dist, time) {
  if (typeof dist !== "number" || isNaN(dist)) return { speed: null, error: "invalid" };
  if (time <= 0) return { speed: Infinity, error: null };
  return { speed: dist / time, error: null };
}`,output:"{ speed: 50, error: null }  // safeSpeed(100, 2)",explanation:"先檢查型別和 NaN，再處理除以零的邊界，最後正常計算。"},tests:[{description:"正常",fn:"(ctx) => { const r = ctx.robustStockDays(100, 10); return r.days === 10 && r.error === null; }"},{description:"負庫存",fn:"(ctx) => ctx.robustStockDays(-5, 10).days === 0"},{description:"零需求",fn:"(ctx) => ctx.robustStockDays(100, 0).days === Infinity"},{description:"非數字",fn:'(ctx) => ctx.robustStockDays("abc", 10).error === "invalid"'},{description:"NaN",fn:'(ctx) => ctx.robustStockDays(NaN, 10).error === "invalid"'},{description:"安全庫存大於現有",fn:"(ctx) => ctx.robustStockDays(50, 10, 100).days === 0"}],returnVars:["robustStockDays"]}]},{id:"2-4",name:"函式組合",description:"串接多個純函式",xp:50,challenges:[{id:1,name:"兩函式組合",type:"coding",difficulty:"easy",instruction:"寫 `compose2(f, g)` — 回傳一個新函式，執行時先呼叫 g(x)，再把結果傳給 f，也就是 f(g(x))。",defaultCode:`function compose2(f, g) {
  // 回傳一個函式，做 f(g(x))
  
}`,example:{title:"範例：簡單的函式包裝",code:`function wrap(fn) {
  return (x) => fn(x);
}
const abs = wrap(Math.abs);
abs(-7); // 7`,output:"7",explanation:"回傳一個新函式，內部呼叫傳入的函式 — 這就是高階函式的基本概念。"},tests:[{description:"compose2(double, addOne)(3) === 8",fn:"(ctx) => { const double = x => x * 2; const addOne = x => x + 1; return ctx.compose2(double, addOne)(3) === 8; }"},{description:'compose2(String, Math.abs)(-5) === "5"',fn:'(ctx) => ctx.compose2(String, Math.abs)(-5) === "5"'},{description:"回傳的是函式",fn:'(ctx) => typeof ctx.compose2(x=>x, x=>x) === "function"'}],returnVars:["compose2"]},{id:2,name:"管線處理",type:"coding",difficulty:"medium",instruction:`給定庫存陣列，完成 \`processInventory(items)\` 函式：
1. 過濾掉 dailyDemand <= 0 的
2. 計算每個的 daysRemaining = currentStock / dailyDemand
3. 加上 risk 欄位：< 7 是 "critical"，< 14 是 "warning"，其他 "safe"
4. 按 daysRemaining 由小到大排序
5. 回傳結果陣列`,defaultCode:`function processInventory(items) {
  // 用 .filter().map().sort() 管線處理
  
}`,example:{title:"範例：陣列管線 filter + map + sort",code:`const nums = [3, -1, 4, -5, 2];
const result = nums
  .filter(n => n > 0)
  .map(n => n * 10)
  .sort((a, b) => a - b);
// [20, 30, 40]`,output:"[20, 30, 40]",explanation:"用 .filter().map().sort() 串接，每一步都回傳新陣列，不修改原始資料。"},tests:[{description:"過濾+計算+排序",fn:`(ctx) => {
                const items = [
                  { code: "A", currentStock: 100, dailyDemand: 50 },
                  { code: "B", currentStock: 200, dailyDemand: 10 },
                  { code: "C", currentStock: 30, dailyDemand: 0 },
                ];
                const r = ctx.processInventory(items);
                return r.length === 2 && r[0].daysRemaining === 2 && r[0].risk === "critical" && r[1].risk === "safe";
              }`},{description:"空陣列",fn:"(ctx) => ctx.processInventory([]).length === 0"}],returnVars:["processInventory"]}]},{id:"2-5",name:"寫測試",description:"用 assert 寫測試案例",xp:50,challenges:[{id:1,name:"基本相等比較",type:"coding",difficulty:"easy",instruction:"寫 `isEqual(a, b)` — 用 `===` 比較兩個值，回傳 true 或 false。",defaultCode:`function isEqual(a, b) {
  // 用 === 比較
  
}`,example:{title:"範例：大於比較函式",code:`function isGreater(a, b) {
  return a > b;
}
isGreater(5, 3); // true
isGreater(2, 7); // false`,output:"true, false",explanation:"用比較運算子直接回傳布林值，簡潔明瞭。"},tests:[{description:"isEqual(1, 1) === true",fn:"(ctx) => ctx.isEqual(1, 1) === true"},{description:"isEqual(1, 2) === false",fn:"(ctx) => ctx.isEqual(1, 2) === false"},{description:'isEqual("a", "a") === true',fn:'(ctx) => ctx.isEqual("a", "a") === true'},{description:'isEqual(1, "1") === false（嚴格比較）',fn:'(ctx) => ctx.isEqual(1, "1") === false'},{description:"isEqual(null, undefined) === false",fn:"(ctx) => ctx.isEqual(null, undefined) === false"}],returnVars:["isEqual"]},{id:2,name:"測試框架",type:"coding",difficulty:"medium",instruction:"實作一個簡易測試函式 `assertEqual(actual, expected)` — 如果相等回傳 true，不相等回傳 false。要能比較物件（用 JSON.stringify）。然後用它測試一個 `add(a,b)` 函式。",defaultCode:`function assertEqual(actual, expected) {
  // 比較兩個值是否相等（支援物件比較）
  
}

function add(a, b) { return a + b; }

// 測試結果
const results = [
  assertEqual(add(1, 2), 3),
  assertEqual(add(0, 0), 0),
  assertEqual(add(-1, 1), 0),
];`,example:{title:"範例：簡易 check 函式",code:`function check(actual, expected) {
  return JSON.stringify(actual) === JSON.stringify(expected);
}
check([1,2], [1,2]); // true
check({x:1}, {x:2}); // false`,output:"true, false",explanation:"用 JSON.stringify 把物件轉成字串再比較，就能比較物件內容是否相同。"},tests:[{description:"數字比較正確",fn:"(ctx) => ctx.assertEqual(3, 3) === true"},{description:"數字比較錯誤",fn:"(ctx) => ctx.assertEqual(3, 4) === false"},{description:"物件比較",fn:"(ctx) => ctx.assertEqual({a:1}, {a:1}) === true"},{description:"物件不同",fn:"(ctx) => ctx.assertEqual({a:1}, {a:2}) === false"},{description:"所有測試通過",fn:"(ctx) => ctx.results.every(r => r === true)"}],returnVars:["assertEqual","results"]}]},{id:"2-6",name:"Boss: BOM 遞迴展開",description:"自己實作遞迴 + 環形偵測",xp:200,isBoss:!0,challenges:[{id:1,name:"BOM 遞迴展開",type:"coding",difficulty:"hard",instruction:'實作 `explodeBOM(item, qty, bomTable)` 遞迴展開 BOM。\n\n- bomTable 是 `[{ parent, child, qtyPer }]` 陣列\n- 回傳 `Map<string, number>` — 零件名稱 → 總需求量\n- 如果偵測到循環引用，throw Error("circular")\n- 最大深度 10 層，超過 throw Error("max depth")',defaultCode:`function explodeBOM(item, qty, bomTable, depth = 0, visited = new Set()) {
  const result = new Map();

  // 1. 檢查深度
  // 2. 檢查循環
  // 3. 找子件：bomTable.filter(row => row.parent === item)
  // 4. 如果沒有子件，記錄 result.set(item, qty)
  // 5. 對每個子件遞迴展開，合併結果

  return result;
}

const bomTable = [
  { parent: "bike", child: "frame", qtyPer: 1 },
  { parent: "bike", child: "wheel", qtyPer: 2 },
  { parent: "frame", child: "tube", qtyPer: 3 },
  { parent: "wheel", child: "rim", qtyPer: 1 },
  { parent: "wheel", child: "tire", qtyPer: 1 },
];`,example:{title:"範例：遞迴計算資料夾大小",code:`function totalSize(folder, tree) {
  const children = tree[folder] || [];
  if (children.length === 0) return 1;
  return children.reduce((sum, c) => sum + totalSize(c, tree), 0);
}
totalSize("root", { root: ["a","b"], a: [], b: ["c"], c: [] }); // 3`,output:"3",explanation:"遞迴展開：沒有子節點回傳 1，有子節點就遞迴加總。BOM 展開邏輯類似。"},referenceCode:Sr.bomExplodeSnippet,tests:[{description:"展開 1 台 bike",fn:'(ctx) => { const r = ctx.explodeBOM("bike", 1, ctx.bomTable); return r.get("tube") === 3 && r.get("rim") === 2 && r.get("tire") === 2; }'},{description:"展開 2 台",fn:'(ctx) => { const r = ctx.explodeBOM("bike", 2, ctx.bomTable); return r.get("tube") === 6 && r.get("rim") === 4; }'},{description:"循環偵測",fn:'(ctx) => { try { ctx.explodeBOM("A", 1, [{parent:"A",child:"B",qtyPer:1},{parent:"B",child:"A",qtyPer:1}]); return false; } catch(e) { return e.message === "circular"; } }'},{description:"深度限制",fn:'(ctx) => { const deep = []; for(let i=0;i<15;i++) deep.push({parent:"L"+i,child:"L"+(i+1),qtyPer:1}); try { ctx.explodeBOM("L0", 1, deep); return false; } catch(e) { return e.message === "max depth"; } }'}],returnVars:["explodeBOM","bomTable"]}]}]},{id:3,name:"SQL 地下城",emoji:"🏰",description:"107 個 migration 構成了這個系統的記憶",color:"from-purple-500 to-violet-600",quests:[{id:"3-1",name:"SELECT 基礎",description:"學習用 JS 模擬 SQL 查詢",xp:50,challenges:[{id:1,name:"模擬 SELECT",type:"coding",difficulty:"easy",instruction:'寫 `selectColumns(rows, columns)` — 從物件陣列中只取出指定欄位。\n例如 `selectColumns([{a:1,b:2,c:3}], ["a","c"])` → `[{a:1,c:3}]`',defaultCode:`function selectColumns(rows, columns) {
  // 用 .map() 只取指定欄位
  
}`,example:{title:"範例：從物件中挑選欄位",code:`const row = {name: "Bob", age: 30, city: "TPE"};
const picked = {name: row.name};
// picked → {name: "Bob"}`,output:'{name: "Bob"}',explanation:"用指定的 key 從物件中取值，組成新物件。"},tests:[{description:"取出指定欄位",fn:'(ctx) => { const r = ctx.selectColumns([{a:1,b:2,c:3}],["a","c"]); return r[0].a === 1 && r[0].c === 3 && r[0].b === undefined; }'},{description:"多筆資料",fn:'(ctx) => ctx.selectColumns([{x:1,y:2},{x:3,y:4}],["x"]).length === 2'}],returnVars:["selectColumns"]},{id:2,name:"模擬 ORDER BY",type:"coding",difficulty:"easy",instruction:'寫 `orderBy(rows, column, direction)` — direction 是 "ASC" 或 "DESC"。',defaultCode:`function orderBy(rows, column, direction = "ASC") {
  // 排序（不修改原陣列）
  
}`,example:{title:"範例：陣列排序",code:`const nums = [3, 1, 2];
const sorted = [...nums].sort((a, b) => a - b);
// sorted → [1, 2, 3]`,output:"[1, 2, 3]",explanation:"用 spread 複製陣列後再 sort，不會改到原本的。"},tests:[{description:"升冪排序",fn:'(ctx) => { const r = ctx.orderBy([{v:3},{v:1},{v:2}],"v","ASC"); return r[0].v === 1 && r[2].v === 3; }'},{description:"降冪排序",fn:'(ctx) => { const r = ctx.orderBy([{v:3},{v:1},{v:2}],"v","DESC"); return r[0].v === 3; }'},{description:"不修改原陣列",fn:'(ctx) => { const orig = [{v:3},{v:1}]; ctx.orderBy(orig,"v"); return orig[0].v === 3; }'}],returnVars:["orderBy"]}]},{id:"3-2",name:"WHERE + JOIN",description:"過濾與合併資料",xp:50,challenges:[{id:1,name:"模擬 WHERE",type:"coding",difficulty:"easy",instruction:"寫 `where(rows, conditionFn)` — 回傳符合條件的列。跟 filter 一樣但命名成 SQL 風格。",defaultCode:`function where(rows, conditionFn) {
  // 過濾
  
}`,example:{title:"範例：用 filter 過濾陣列",code:`const items = [1, 2, 3, 4, 5];
const big = items.filter(x => x > 3);
// big → [4, 5]`,output:"[4, 5]",explanation:"filter 會回傳所有讓條件函式回傳 true 的元素。"},tests:[{description:"過濾",fn:"(ctx) => ctx.where([{stock:50},{stock:200}], r => r.stock < 100).length === 1"}],returnVars:["where"]},{id:2,name:"模擬 INNER JOIN",type:"coding",difficulty:"medium",instruction:"寫 `innerJoin(left, right, leftKey, rightKey)` — 回傳兩邊都有配對的合併結果（用 spread 合併物件）。",defaultCode:`function innerJoin(left, right, leftKey, rightKey) {
  // 對 left 每一筆，找 right 中 rightKey 相同的，合併
  
}`,example:{title:"範例：合併兩個物件",code:`const a = {id: 1, name: "Alice"};
const b = {id: 1, score: 95};
const merged = {...a, ...b};
// merged → {id: 1, name: "Alice", score: 95}`,output:'{id: 1, name: "Alice", score: 95}',explanation:"用 spread 把兩個物件的欄位合在一起。"},tests:[{description:"正常 JOIN",fn:'(ctx) => { const r = ctx.innerJoin([{id:1,name:"A"}],[{id:1,price:10}],"id","id"); return r.length === 1 && r[0].name === "A" && r[0].price === 10; }'},{description:"沒配到的不出現",fn:'(ctx) => ctx.innerJoin([{id:1},{id:2}],[{id:1}],"id","id").length === 1'}],returnVars:["innerJoin"]}]},{id:"3-3",name:"GROUP BY + 聚合",description:"分組統計",xp:50,challenges:[{id:1,name:"計數分組",type:"coding",difficulty:"easy",instruction:'寫 `countBy(rows, key)` — 回傳一個物件，key 是分組值，value 是該組的數量。\n例如 `countBy([{type:"A"},{type:"B"},{type:"A"}], "type")` → `{A: 2, B: 1}`',defaultCode:`function countBy(rows, key) {
  // 用 reduce 計算每個分組的數量
  
}`,example:{title:"範例：用 reduce 累加計數",code:`const letters = ["a", "b", "a"];
const counts = letters.reduce((acc, l) => {
  acc[l] = (acc[l] || 0) + 1; return acc;
}, {});
// counts → {a: 2, b: 1}`,output:"{a: 2, b: 1}",explanation:"reduce 逐一遍歷，用物件累計每個值出現的次數。"},tests:[{description:"計數正確",fn:'(ctx) => { const r = ctx.countBy([{t:"A"},{t:"B"},{t:"A"}],"t"); return r.A === 2 && r.B === 1; }'},{description:"空陣列",fn:'(ctx) => Object.keys(ctx.countBy([],"t")).length === 0'},{description:"單一分組",fn:'(ctx) => ctx.countBy([{x:"a"},{x:"a"},{x:"a"}],"x").a === 3'}],returnVars:["countBy"]},{id:2,name:"模擬 GROUP BY",type:"coding",difficulty:"medium",instruction:'寫 `groupBy(rows, key)` — 回傳一個物件，key 是分組值，value 是該組的列陣列。\n例如 `groupBy([{type:"A",v:1},{type:"B",v:2},{type:"A",v:3}], "type")` → `{ A: [{...},{...}], B: [{...}] }`',defaultCode:`function groupBy(rows, key) {
  // 用 reduce 分組
  
}`,example:{title:"範例：把陣列元素分組",code:`const words = ["hi", "ok", "hey"];
const byLen = {};
words.forEach(w => {
  const k = w.length;
  byLen[k] = byLen[k] || [];
  byLen[k].push(w);
});
// byLen → {2: ["hi", "ok"], 3: ["hey"]}`,output:'{2: ["hi", "ok"], 3: ["hey"]}',explanation:"用 key 值當物件的屬性名，把相同 key 的元素放進同一個陣列。"},tests:[{description:"分組正確",fn:'(ctx) => { const r = ctx.groupBy([{t:"A",v:1},{t:"B",v:2},{t:"A",v:3}],"t"); return r.A.length === 2 && r.B.length === 1; }'},{description:"空陣列",fn:'(ctx) => Object.keys(ctx.groupBy([],"t")).length === 0'}],returnVars:["groupBy"]},{id:3,name:"聚合函式",type:"coding",difficulty:"medium",instruction:'寫 `aggregate(rows, column, fn)` — fn 可以是 "SUM"、"AVG"、"COUNT"、"MAX"、"MIN"。',defaultCode:`function aggregate(rows, column, fn) {
  const values = rows.map(r => r[column]);
  // 根據 fn 計算
  
}`,example:{title:"範例：陣列求和與最大值",code:`const vals = [5, 10, 15];
const sum = vals.reduce((a, b) => a + b, 0);
const max = Math.max(...vals);
// sum → 30, max → 15`,output:"sum = 30, max = 15",explanation:"用 reduce 做加總，用 Math.max 找最大值。"},tests:[{description:"SUM",fn:'(ctx) => ctx.aggregate([{v:10},{v:20},{v:30}],"v","SUM") === 60'},{description:"AVG",fn:'(ctx) => ctx.aggregate([{v:10},{v:20},{v:30}],"v","AVG") === 20'},{description:"COUNT",fn:'(ctx) => ctx.aggregate([{v:10},{v:20}],"v","COUNT") === 2'},{description:"MAX",fn:'(ctx) => ctx.aggregate([{v:10},{v:30},{v:20}],"v","MAX") === 30'},{description:"MIN",fn:'(ctx) => ctx.aggregate([{v:10},{v:30},{v:20}],"v","MIN") === 10'}],returnVars:["aggregate"]}]},{id:"3-4",name:"INSERT + UPDATE",description:"寫入與修改資料",xp:50,challenges:[{id:1,name:"插入資料",type:"coding",difficulty:"easy",instruction:"寫 `insertRow(table, row)` — table 是陣列（模擬資料表），row 是物件。回傳新的陣列（不修改原陣列），把 row 加到最後面，並自動加上 `id` 欄位（取目前最大 id + 1，若空表則 id=1）。",defaultCode:`function insertRow(table, row) {
  // 不修改原陣列
  // 自動加 id
  
}`,example:{title:"範例：不修改原陣列地新增元素",code:`const arr = [1, 2];
const newArr = [...arr, 3];
// arr → [1, 2]  newArr → [1, 2, 3]`,output:"[1, 2, 3]",explanation:"用 spread 建立新陣列，原陣列不會被改動。"},tests:[{description:"插入後長度+1",fn:'(ctx) => ctx.insertRow([{id:1,name:"A"}],{name:"B"}).length === 2'},{description:"自動 id",fn:'(ctx) => ctx.insertRow([{id:1,name:"A"}],{name:"B"})[1].id === 2'},{description:"空表 id=1",fn:'(ctx) => ctx.insertRow([],{name:"C"})[0].id === 1'},{description:"不修改原陣列",fn:'(ctx) => { const t=[{id:1}]; ctx.insertRow(t,{name:"X"}); return t.length === 1; }'}],returnVars:["insertRow"]},{id:2,name:"更新資料",type:"coding",difficulty:"medium",instruction:"寫 `updateRows(table, condition, updates)` — condition 是 `{field, value}` 表示哪些列要更新。updates 是物件表示要更新的欄位。回傳新的陣列（不修改原陣列）。",defaultCode:`function updateRows(table, condition, updates) {
  // 找到符合 condition 的列，套用 updates
  // 回傳新陣列
  
}`,example:{title:"範例：用 map 有條件地更新物件",code:`const rows = [{id: 1, ok: false}, {id: 2, ok: true}];
const updated = rows.map(r =>
  r.id === 1 ? {...r, ok: true} : r
);
// updated[0].ok → true`,output:"[{id: 1, ok: true}, {id: 2, ok: true}]",explanation:"用 map 遍歷，符合條件的用 spread 產生新物件並覆蓋欄位。"},tests:[{description:"更新匹配的列",fn:'(ctx) => { const r = ctx.updateRows([{id:1,status:"pending"},{id:2,status:"done"}],{field:"status",value:"pending"},{status:"shipped"}); return r[0].status === "shipped" && r[1].status === "done"; }'},{description:"不修改原陣列",fn:'(ctx) => { const t=[{id:1,status:"A"}]; ctx.updateRows(t,{field:"status",value:"A"},{status:"B"}); return t[0].status === "A"; }'},{description:"無匹配不變",fn:'(ctx) => { const r = ctx.updateRows([{id:1,x:1}],{field:"x",value:99},{x:0}); return r[0].x === 1; }'}],returnVars:["updateRows"]}]},{id:"3-5",name:"RPC 函式",description:"理解 Supabase RPC",xp:50,challenges:[{id:1,name:"簡單函式呼叫",type:"coding",difficulty:"easy",instruction:"寫 `callFunction(name, fns)` — fns 是 `{fnName: fn}` 的物件。如果 name 存在於 fns 中，呼叫 fns[name]() 並回傳結果；否則回傳 null。",defaultCode:`function callFunction(name, fns) {
  // 如果 fns 中有 name，呼叫並回傳結果，否則回傳 null
  
}`,example:{title:"範例：動態呼叫物件中的函式",code:`const actions = { sayHi: () => "Hi!" };
const key = "sayHi";
const result = actions[key]();
// result → "Hi!"`,output:'"Hi!"',explanation:"用方括號語法從物件中取出函式並呼叫。"},tests:[{description:"呼叫存在的函式",fn:'(ctx) => ctx.callFunction("greet", {greet: () => "hello"}) === "hello"'},{description:"呼叫不存在的函式",fn:'(ctx) => ctx.callFunction("missing", {greet: () => "hello"}) === null'},{description:"回傳數字",fn:'(ctx) => ctx.callFunction("getNum", {getNum: () => 42}) === 42'}],returnVars:["callFunction"]},{id:2,name:"模擬 RPC 呼叫",type:"coding",difficulty:"medium",instruction:'寫 `createRPC(functions)` — functions 是 `{fnName: fn}` 的物件。回傳一個 `rpc(name, params)` 函式：\n- 如果 name 不在 functions 裡，回傳 `{error: "FUNCTION_NOT_FOUND"}`\n- 否則呼叫對應函式並回傳 `{data: result}`',defaultCode:`function createRPC(functions) {
  return function rpc(name, params) {
    // 查找並呼叫
    
  };
}`,example:{title:"範例：回傳函式的函式（閉包）",code:`function makeGreeter(greeting) {
  return (name) => greeting + " " + name;
}
const hi = makeGreeter("Hello");
// hi("World") → "Hello World"`,output:'"Hello World"',explanation:"外層函式回傳內層函式，內層能存取外層的變數。"},tests:[{description:"呼叫存在的函式",fn:'(ctx) => { const rpc = ctx.createRPC({add: (p) => p.a + p.b}); return rpc("add",{a:3,b:4}).data === 7; }'},{description:"找不到函式",fn:'(ctx) => { const rpc = ctx.createRPC({}); return rpc("unknown",{}).error === "FUNCTION_NOT_FOUND"; }'},{description:"多個函式",fn:'(ctx) => { const rpc = ctx.createRPC({sum:(p)=>p.x+p.y, mul:(p)=>p.x*p.y}); return rpc("sum",{x:2,y:3}).data === 5 && rpc("mul",{x:2,y:3}).data === 6; }'}],returnVars:["createRPC"]},{id:3,name:"帶驗證的 RPC",type:"coding",difficulty:"hard",instruction:'寫 `createSecureRPC(functions, allowList)` — allowList 是允許呼叫的函式名稱陣列。回傳 `rpc(name, params)`：\n- 如果 name 不在 allowList 中，回傳 `{error: "PERMISSION_DENIED"}`\n- 如果 name 不在 functions 中，回傳 `{error: "FUNCTION_NOT_FOUND"}`\n- 否則回傳 `{data: result}`',defaultCode:`function createSecureRPC(functions, allowList) {
  return function rpc(name, params) {
    
  };
}`,example:{title:"範例：用 includes 檢查權限",code:`const allowed = ["read", "write"];
const action = "delete";
const ok = allowed.includes(action);
// ok → false`,output:"false",explanation:"先用 includes 檢查是否在白名單中，再決定要不要執行。"},tests:[{description:"允許的函式",fn:'(ctx) => { const rpc = ctx.createSecureRPC({add:(p)=>p.a+p.b},["add"]); return rpc("add",{a:1,b:2}).data === 3; }'},{description:"未授權",fn:'(ctx) => { const rpc = ctx.createSecureRPC({secret:()=>42},[]); return rpc("secret",{}).error === "PERMISSION_DENIED"; }'},{description:"授權但不存在",fn:'(ctx) => { const rpc = ctx.createSecureRPC({},["ghost"]); return rpc("ghost",{}).error === "FUNCTION_NOT_FOUND"; }'}],returnVars:["createSecureRPC"]}]},{id:"3-6",name:"Boss: 即時查詢挑戰",description:"在 DuckDB 上跑真實查詢",xp:200,isBoss:!0,challenges:[{id:1,name:"完整查詢引擎",type:"coding",difficulty:"hard",instruction:'寫一個 `query(table, options)` 函式，options 可以包含：\n- `select`: 欄位名稱陣列（預設全部）\n- `where`: `{field, op, value}` — op 可以是 "=", ">", "<", ">=", "<="\n- `orderBy`: `{field, direction}` — direction 是 "ASC" 或 "DESC"\n- `limit`: 數字\n\n全部組合起來使用！',defaultCode:`function query(table, options = {}) {
  let result = [...table];
  
  // 1. WHERE 過濾
  
  // 2. ORDER BY 排序
  
  // 3. SELECT 投影
  
  // 4. LIMIT 限制
  
  return result;
}`,referenceCode:`// 在真實專案中，這些邏輯由 DuckDB / Supabase 處理
// 但理解底層原理能幫助你寫出更好的查詢`,example:{title:"範例：鏈式處理陣列",code:`const data = [{n: 3}, {n: 1}, {n: 4}, {n: 1}];
const result = data
  .filter(r => r.n > 1)
  .sort((a, b) => a.n - b.n)
  .slice(0, 2);
// result → [{n: 3}, {n: 4}]`,output:"[{n: 3}, {n: 4}]",explanation:"先 filter 過濾、再 sort 排序、最後 slice 限制筆數，就像 SQL 的 WHERE + ORDER BY + LIMIT。"},tests:[{description:"WHERE 過濾",fn:'(ctx) => { const t=[{id:1,v:10},{id:2,v:20},{id:3,v:30}]; return ctx.query(t,{where:{field:"v",op:">",value:15}}).length === 2; }'},{description:"ORDER BY DESC",fn:'(ctx) => { const t=[{id:1,v:10},{id:2,v:30},{id:3,v:20}]; const r=ctx.query(t,{orderBy:{field:"v",direction:"DESC"}}); return r[0].v===30 && r[1].v===20; }'},{description:"SELECT 投影",fn:'(ctx) => { const t=[{id:1,name:"A",v:10}]; const r=ctx.query(t,{select:["name"]}); return r[0].name==="A" && r[0].id===undefined; }'},{description:"LIMIT",fn:"(ctx) => ctx.query([{id:1},{id:2},{id:3}],{limit:2}).length === 2"},{description:"組合查詢",fn:'(ctx) => { const t=[{id:1,v:10},{id:2,v:30},{id:3,v:20},{id:4,v:40}]; const r=ctx.query(t,{where:{field:"v",op:">=",value:20},orderBy:{field:"v",direction:"ASC"},select:["v"],limit:2}); return r.length===2 && r[0].v===20 && r[1].v===30; }'}],returnVars:["query"]}]}]},{id:4,name:"React 前線",emoji:"⚔️",description:"199 個 component 構成了使用者看到的一切",color:"from-cyan-500 to-blue-600",quests:[{id:"4-1",name:"JSX 基礎",description:"讀懂 component 結構",xp:50,challenges:[{id:1,name:"建立元素",type:"coding",difficulty:"easy",instruction:"寫 `createElement(tag, props, children)` — 模擬 React.createElement。回傳 `{type: tag, props: {...props, children}}`。如果 children 是 undefined 就不加。",defaultCode:`function createElement(tag, props, children) {
  const element = { type: tag, props: { ...props } };
  if (children !== undefined) {
    element.props.children = children;
  }
  return element;
}`,example:{title:"範例：建立簡單物件結構",code:`function makeNode(name, value) {
  return { name, data: value };
}
console.log(makeNode("p", 42));`,output:'{ name: "p", data: 42 }',explanation:"函式接收參數，組合成物件後回傳，概念與 createElement 相同。"},tests:[{description:"建立 div",fn:'(ctx) => { const e = ctx.createElement("div",{className:"card"},"Hello"); return e.type==="div" && e.props.className==="card" && e.props.children==="Hello"; }'},{description:"無 children",fn:'(ctx) => ctx.createElement("br",{}).props.children === undefined'},{description:"巢狀結構",fn:'(ctx) => { const child = ctx.createElement("span",{},"text"); const parent = ctx.createElement("div",{},child); return parent.props.children.type === "span"; }'}],returnVars:["createElement"]},{id:2,name:"解析 JSX 結構",type:"coding",difficulty:"medium",instruction:"寫 `countElements(tree)` — 遞迴計算虛擬 DOM 樹中有多少個元素節點。tree 是 `{type, props: {children}}` 結構，children 可以是：物件（單個子元素）、陣列（多個子元素）、字串（文字節點，不算）、或 undefined。",defaultCode:`function countElements(tree) {
  if (!tree || typeof tree === "string") return 0;
  let count = 1; // 自己
  const children = tree.props?.children;
  // 遞迴計算子元素
  
  return count;
}`,example:{title:"範例：遞迴計算巢狀深度",code:`function depth(node) {
  if (!node || !node.child) return 1;
  return 1 + depth(node.child);
}
console.log(depth({child:{child:null}}));`,output:"2",explanation:"遞迴走訪巢狀結構並計數，與遍歷虛擬 DOM 樹的概念類似。"},tests:[{description:"單一元素",fn:'(ctx) => ctx.countElements({type:"div",props:{}}) === 1'},{description:"有子元素",fn:'(ctx) => ctx.countElements({type:"div",props:{children:{type:"span",props:{}}}}) === 2'},{description:"陣列子元素",fn:'(ctx) => ctx.countElements({type:"div",props:{children:[{type:"p",props:{}},{type:"p",props:{}}]}}) === 3'},{description:"文字節點不算",fn:'(ctx) => ctx.countElements({type:"div",props:{children:"hello"}}) === 1'}],returnVars:["countElements"]}]},{id:"4-2",name:"Props 與 State",description:"改一個 component 的行為",xp:50,challenges:[{id:1,name:"Props 合併",type:"coding",difficulty:"easy",instruction:"寫 `mergeProps(defaultProps, userProps)` — 用 userProps 覆蓋 defaultProps 中同名的屬性。回傳新物件，不修改原物件。",defaultCode:`function mergeProps(defaultProps, userProps) {
  
}`,example:{title:"範例：用 spread 合併物件",code:`const a = { x: 1, y: 2 };
const b = { y: 3, z: 4 };
console.log({ ...a, ...b });`,output:"{ x: 1, y: 3, z: 4 }",explanation:"後面的物件會覆蓋前面同名的屬性，這就是 Props 合併的核心概念。"},tests:[{description:"覆蓋預設值",fn:'(ctx) => { const r = ctx.mergeProps({size:"md",color:"blue"},{color:"red"}); return r.size==="md" && r.color==="red"; }'},{description:"不修改原物件",fn:"(ctx) => { const d={a:1}; ctx.mergeProps(d,{a:2}); return d.a === 1; }"},{description:"新增屬性",fn:"(ctx) => ctx.mergeProps({a:1},{b:2}).b === 2"}],returnVars:["mergeProps"]},{id:2,name:"模擬 useState",type:"coding",difficulty:"medium",instruction:"寫 `createState(initialValue)` — 回傳 `[getter, setter]`。getter() 回傳目前的值，setter(newValue) 更新值。",defaultCode:`function createState(initialValue) {
  let value = initialValue;
  function getter() {
    // 回傳目前值
  }
  function setter(newValue) {
    // 更新值
  }
  return [getter, setter];
}`,example:{title:"範例：閉包保存狀態",code:`function makeCounter() {
  let n = 0;
  return { get: () => n, inc: () => n++ };
}
const c = makeCounter();
c.inc(); console.log(c.get());`,output:"1",explanation:"用閉包把變數藏在函式內部，外部透過方法存取，與 useState 原理相同。"},tests:[{description:"取得初始值",fn:"(ctx) => { const [get] = ctx.createState(42); return get() === 42; }"},{description:"更新值",fn:"(ctx) => { const [get, set] = ctx.createState(0); set(10); return get() === 10; }"},{description:"多次更新",fn:'(ctx) => { const [get, set] = ctx.createState("a"); set("b"); set("c"); return get() === "c"; }'}],returnVars:["createState"]}]},{id:"4-3",name:"useEffect 與生命週期",description:"修復一個 bug",xp:50,challenges:[{id:1,name:"淺比較陣列",type:"coding",difficulty:"easy",instruction:"寫 `shallowEqual(arr1, arr2)` — 比較兩個陣列是否長度相同且每個元素用 === 比較都相等。回傳 true 或 false。",defaultCode:`function shallowEqual(arr1, arr2) {
  // 比較兩個陣列是否淺相等
  
}`,example:{title:"範例：比較兩個字串是否相同",code:`function eq(a, b) {
  return a === b;
}
console.log(eq("hi", "hi"), eq("hi", "ho"));`,output:"true false",explanation:"用 === 嚴格比較兩個值；淺比較陣列就是對每個元素做一樣的事。"},tests:[{description:"相同陣列",fn:"(ctx) => ctx.shallowEqual([1,2,3], [1,2,3]) === true"},{description:"不同長度",fn:"(ctx) => ctx.shallowEqual([1,2], [1,2,3]) === false"},{description:"不同元素",fn:"(ctx) => ctx.shallowEqual([1,2,3], [1,2,4]) === false"},{description:"空陣列",fn:"(ctx) => ctx.shallowEqual([], []) === true"},{description:"嚴格比較",fn:'(ctx) => ctx.shallowEqual([1], ["1"]) === false'}],returnVars:["shallowEqual"]},{id:2,name:"模擬 useEffect",type:"coding",difficulty:"hard",instruction:`寫 \`createEffect(callback, deps)\` — 模擬 useEffect 的依賴比較：
- 回傳 \`{shouldRun, cleanup}\` 物件
- 第一次呼叫永遠 shouldRun=true
- 之後比較 deps 陣列（淺比較），有改變才 shouldRun=true
- 如果 deps 是 undefined，每次都 shouldRun=true
- 如果 deps 是空陣列 []，只有第一次 shouldRun=true`,defaultCode:`function createEffectTracker() {
  let prevDeps = undefined;
  let isFirst = true;
  
  return function check(deps) {
    if (isFirst) {
      isFirst = false;
      prevDeps = deps;
      return { shouldRun: true };
    }
    
    // 沒給 deps → 每次都執行
    if (deps === undefined) {
      return { shouldRun: true };
    }
    
    // 空陣列 → 只執行一次
    // 比較每個 dep
    
    prevDeps = deps;
    return { shouldRun: false };
  };
}`,example:{title:"範例：追蹤值是否改變",code:`let prev = null;
function changed(val) {
  const diff = val !== prev;
  prev = val;
  return diff;
}
console.log(changed(1), changed(1), changed(2));`,output:"true false true",explanation:"記住上次的值，跟新值比較決定是否有變化，這就是 useEffect 依賴追蹤的核心。"},tests:[{description:"首次執行",fn:"(ctx) => { const check = ctx.createEffectTracker(); return check([1]).shouldRun === true; }"},{description:"deps 不變→不執行",fn:"(ctx) => { const check = ctx.createEffectTracker(); check([1,2]); return check([1,2]).shouldRun === false; }"},{description:"deps 變了→執行",fn:"(ctx) => { const check = ctx.createEffectTracker(); check([1]); return check([2]).shouldRun === true; }"},{description:"無 deps→每次執行",fn:"(ctx) => { const check = ctx.createEffectTracker(); check(); return check().shouldRun === true; }"},{description:"空陣列→只一次",fn:"(ctx) => { const check = ctx.createEffectTracker(); check([]); return check([]).shouldRun === false; }"}],returnVars:["createEffectTracker"]}]},{id:"4-4",name:"Context 與全域狀態",description:"追蹤資料流",xp:50,challenges:[{id:1,name:"閉包盒子",type:"coding",difficulty:"easy",instruction:"寫 `createBox(value)` — 用閉包回傳一個物件 `{get(), set(v)}`。get() 回傳目前值，set(v) 更新值。",defaultCode:`function createBox(value) {
  // 用閉包保存 value
  return {
    get() {
      // 回傳目前值
    },
    set(v) {
      // 更新值
    }
  };
}`,example:{title:"範例：閉包封裝私有變數",code:`function secret(val) {
  return { peek: () => val };
}
console.log(secret(99).peek());`,output:"99",explanation:"閉包讓函式記住建立時的變數，外部只能透過回傳的方法存取。"},tests:[{description:"取得初始值",fn:"(ctx) => ctx.createBox(42).get() === 42"},{description:"更新值",fn:"(ctx) => { const box = ctx.createBox(1); box.set(2); return box.get() === 2; }"},{description:"多次更新",fn:'(ctx) => { const box = ctx.createBox("a"); box.set("b"); box.set("c"); return box.get() === "c"; }'},{description:"獨立實例",fn:"(ctx) => { const b1 = ctx.createBox(1); const b2 = ctx.createBox(2); return b1.get() === 1 && b2.get() === 2; }"}],returnVars:["createBox"]},{id:2,name:"模擬 Context",type:"coding",difficulty:"medium",instruction:"寫 `createContext(defaultValue)` — 回傳一個物件 `{Provider, useContext}`：\n- `Provider(value)` 設定 context 的當前值\n- `useContext()` 取得當前值，如果沒有 Provider 設過值就回傳 defaultValue",defaultCode:`function createContext(defaultValue) {
  let current = defaultValue;
  return {
    Provider(value) {
      // 設定值
    },
    useContext() {
      // 取得值
    }
  };
}`,example:{title:"範例：全域變數讀寫",code:`let theme = "light";
function setTheme(t) { theme = t; }
function getTheme() { return theme; }
setTheme("dark");
console.log(getTheme());`,output:"dark",explanation:"用函式包裝全域變數的讀寫，與 Context 的 Provider/useContext 模式相似。"},tests:[{description:"預設值",fn:'(ctx) => { const c = ctx.createContext("default"); return c.useContext() === "default"; }'},{description:"Provider 設值",fn:"(ctx) => { const c = ctx.createContext(0); c.Provider(42); return c.useContext() === 42; }"},{description:"多次更新",fn:'(ctx) => { const c = ctx.createContext("a"); c.Provider("b"); c.Provider("c"); return c.useContext() === "c"; }'}],returnVars:["createContext"]},{id:3,name:"模擬 useReducer",type:"coding",difficulty:"hard",instruction:"寫 `createStore(reducer, initialState)` — reducer 是 `(state, action) => newState`。回傳 `{getState, dispatch}`：\n- `getState()` 回傳目前 state\n- `dispatch(action)` 用 reducer 計算新 state 並更新",defaultCode:`function createStore(reducer, initialState) {
  let state = initialState;
  return {
    getState() {
      
    },
    dispatch(action) {
      
    }
  };
}`,example:{title:"範例：用函式計算新狀態",code:`function apply(state, fn) {
  return fn(state);
}
console.log(apply(5, s => s * 2));`,output:"10",explanation:"把「如何更新狀態」交給外部函式決定，這就是 reducer 的核心概念。"},tests:[{description:"初始狀態",fn:"(ctx) => { const s = ctx.createStore((s,a)=>s, {count:0}); return s.getState().count === 0; }"},{description:"dispatch 更新",fn:'(ctx) => { const s = ctx.createStore((s,a)=>a.type==="INC"?{count:s.count+1}:s, {count:0}); s.dispatch({type:"INC"}); return s.getState().count === 1; }'},{description:"多次 dispatch",fn:"(ctx) => { const s = ctx.createStore((s,a)=>({count:s.count+a.payload}), {count:0}); s.dispatch({payload:5}); s.dispatch({payload:3}); return s.getState().count === 8; }"}],returnVars:["createStore"]}]},{id:"4-5",name:"條件渲染與列表",description:"寫一個風險列表 component",xp:50,challenges:[{id:1,name:"條件渲染邏輯",type:"coding",difficulty:"easy",instruction:'寫 `renderStatus(item)` — item 有 `{name, stock, threshold}` 欄位。回傳：\n- stock <= 0 → `{text: "缺貨", level: "critical"}`\n- stock <= threshold → `{text: "低庫存", level: "warning"}`\n- 否則 → `{text: "正常", level: "safe"}`',defaultCode:`function renderStatus(item) {
  
}`,example:{title:"範例：根據溫度回傳狀態",code:`function tempLabel(t) {
  if (t > 35) return "hot";
  if (t > 20) return "warm";
  return "cold";
}
console.log(tempLabel(40));`,output:"hot",explanation:"用 if/else 根據數值區間回傳不同標籤，跟條件渲染邏輯一模一樣。"},tests:[{description:"缺貨",fn:'(ctx) => { const r = ctx.renderStatus({name:"A",stock:0,threshold:10}); return r.text==="缺貨" && r.level==="critical"; }'},{description:"低庫存",fn:'(ctx) => { const r = ctx.renderStatus({name:"B",stock:5,threshold:10}); return r.text==="低庫存" && r.level==="warning"; }'},{description:"正常",fn:'(ctx) => { const r = ctx.renderStatus({name:"C",stock:100,threshold:10}); return r.text==="正常" && r.level==="safe"; }'}],returnVars:["renderStatus"]},{id:2,name:"列表處理",type:"coding",difficulty:"medium",instruction:'寫 `renderList(items, filterLevel)` — items 是 `[{name, stock, threshold}]` 陣列。filterLevel 可以是 "all", "warning", "critical"。回傳：\n- "all" → 全部項目加上狀態\n- "warning" → 只回傳 warning 和 critical\n- "critical" → 只回傳 critical\n\n每項回傳 `{name, ...renderStatus(item)}`',defaultCode:`function renderStatus(item) {
  if (item.stock <= 0) return { text: "缺貨", level: "critical" };
  if (item.stock <= item.threshold) return { text: "低庫存", level: "warning" };
  return { text: "正常", level: "safe" };
}

function renderList(items, filterLevel) {
  // 加上狀態後過濾
  
}`,example:{title:"範例：過濾陣列再加工",code:`const nums = [1, 2, 3, 4, 5];
const big = nums.filter(n => n > 3).map(n => n * 10);
console.log(big);`,output:"[40, 50]",explanation:"先 filter 篩選，再 map 轉換，這是列表處理的標準流程。"},tests:[{description:"all 回傳全部",fn:'(ctx) => ctx.renderList([{name:"A",stock:100,threshold:10},{name:"B",stock:5,threshold:10}],"all").length === 2'},{description:"warning 過濾",fn:'(ctx) => { const r = ctx.renderList([{name:"A",stock:100,threshold:10},{name:"B",stock:5,threshold:10},{name:"C",stock:0,threshold:10}],"warning"); return r.length === 2; }'},{description:"critical 過濾",fn:'(ctx) => { const r = ctx.renderList([{name:"A",stock:100,threshold:10},{name:"B",stock:5,threshold:10},{name:"C",stock:0,threshold:10}],"critical"); return r.length === 1 && r[0].name === "C"; }'}],returnVars:["renderList"]}]},{id:"4-6",name:"Boss: 從零寫 Dashboard Card",description:"完整 component + 樣式",xp:200,isBoss:!0,challenges:[{id:1,name:"完整 Dashboard 資料處理",type:"coding",difficulty:"hard",instruction:"寫 `createDashboard(inventoryData)` — inventoryData 是 `[{name, stock, dailyDemand, threshold, unitCost}]`。回傳：\n```\n{\n  totalItems: 總品項數,\n  totalValue: 總庫存價值 (stock × unitCost 的加總),\n  criticalItems: 缺貨品項名稱陣列,\n  warningItems: 低庫存品項名稱陣列 (stock <= threshold 但 > 0),\n  avgDaysToStockout: 平均可用天數 (stock / dailyDemand，忽略 dailyDemand=0 的品項)，四捨五入到小數第一位,\n  riskScore: criticalItems 數量 / totalItems 的百分比，四捨五入到整數\n}\n```",defaultCode:`function createDashboard(inventoryData) {
  const result = {
    totalItems: 0,
    totalValue: 0,
    criticalItems: [],
    warningItems: [],
    avgDaysToStockout: 0,
    riskScore: 0,
  };
  
  // 你的程式碼
  
  return result;
}`,referenceCode:`// 在真實 DI 專案中，InventoryDashboard.jsx 會呼叫
// calculator.js 的函式來取得這些資料
// 這裡你要自己實作底層邏輯`,example:{title:"範例：統計陣列基本資訊",code:`const prices = [10, 20, 30];
const total = prices.reduce((s, p) => s + p, 0);
const avg = total / prices.length;
console.log(total, avg);`,output:"60 20",explanation:"用 reduce 加總、算平均，Dashboard 就是把這些統計組合在一起。"},tests:[{description:"基本統計",fn:'(ctx) => { const d = ctx.createDashboard([{name:"A",stock:100,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:0,dailyDemand:5,threshold:10,unitCost:100}]); return d.totalItems === 2 && d.totalValue === 5000; }'},{description:"缺貨分類",fn:'(ctx) => { const d = ctx.createDashboard([{name:"A",stock:0,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:5,dailyDemand:5,threshold:10,unitCost:100}]); return d.criticalItems[0]==="A" && d.warningItems[0]==="B"; }'},{description:"平均天數",fn:'(ctx) => { const d = ctx.createDashboard([{name:"A",stock:100,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:50,dailyDemand:5,threshold:10,unitCost:100}]); return d.avgDaysToStockout === 10; }'},{description:"風險分數",fn:'(ctx) => { const d = ctx.createDashboard([{name:"A",stock:0,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:100,dailyDemand:5,threshold:10,unitCost:100}]); return d.riskScore === 50; }'}],returnVars:["createDashboard"]}]}]},{id:5,name:"Agent 深淵",emoji:"🌀",description:"AI Agent 怎麼思考和行動",color:"from-orange-500 to-red-600",quests:[{id:"5-1",name:"Async/Await",description:"理解非同步程式設計",xp:50,challenges:[{id:1,name:"Promise 基礎",type:"coding",difficulty:"easy",instruction:'寫 `delay(ms)` 回傳一個 Promise，在 ms 毫秒後 resolve 字串 "done"。',defaultCode:`function delay(ms) {
  // 回傳一個 Promise
  return new Promise((resolve) => {
    // 你的程式碼
  });
}`,example:{title:"範例：建立一個立即 resolve 的 Promise",code:`const p = new Promise(resolve => resolve("hi"));
p.then(v => console.log(v));`,output:"hi",explanation:"Promise 建構時傳入 resolve 函式，呼叫它就會把值傳給 .then()。"},tests:[{description:"回傳 Promise",fn:"(ctx) => ctx.delay(10) instanceof Promise"},{description:'resolve "done"',fn:'(ctx) => ctx.delay(10).then(v => v === "done")'}],returnVars:["delay"]},{id:2,name:"執行順序",type:"coding",difficulty:"medium",instruction:"寫 `getOrder()` — 模擬非同步執行順序。回傳一個陣列記錄執行順序。\n\n規則：同步程式碼先執行，Promise.resolve().then() 裡的後執行。",defaultCode:`function getOrder() {
  const order = [];
  order.push("sync1");
  Promise.resolve().then(() => order.push("micro"));
  order.push("sync2");
  // 回傳的是「同步程式碼跑完後」的順序
  return order;
}`,example:{title:"範例：同步 vs 非同步順序",code:`console.log("A");
setTimeout(() => console.log("B"), 0);
console.log("C");`,output:`A
C
B`,explanation:"同步程式碼（A、C）一定先跑完，非同步回呼（B）排在後面。"},tests:[{description:"同步先執行",fn:'(ctx) => { const r = ctx.getOrder(); return r[0] === "sync1" && r[1] === "sync2"; }'},{description:"微任務還沒跑",fn:"(ctx) => ctx.getOrder().length === 2"}],returnVars:["getOrder"]}]},{id:"5-2",name:"Pub/Sub 模式",description:"自己寫 EventBus",xp:50,challenges:[{id:1,name:"回呼清單",type:"coding",difficulty:"easy",instruction:"寫 `createCallbackList()` — 回傳一個物件 `{add(fn), run(data)}`。add(fn) 把函式加到內部陣列，run(data) 依序呼叫所有已加入的函式並傳入 data。",defaultCode:`function createCallbackList() {
  const callbacks = [];
  return {
    add(fn) {
      // 把 fn 加入 callbacks
    },
    run(data) {
      // 依序呼叫所有 callback
    }
  };
}`,example:{title:"範例：陣列存函式並依序呼叫",code:`const fns = [x => x + 1, x => x * 2];
fns.forEach(fn => console.log(fn(5)));`,output:`6
10`,explanation:"把函式存進陣列，之後遍歷呼叫，這就是回呼清單的基本原理。"},tests:[{description:"加入並執行",fn:"(ctx) => { const list = ctx.createCallbackList(); let result = 0; list.add(d => result = d); list.run(42); return result === 42; }"},{description:"多個 callback",fn:"(ctx) => { const list = ctx.createCallbackList(); let a=0,b=0; list.add(d => a=d); list.add(d => b=d*2); list.run(5); return a===5 && b===10; }"},{description:"無 callback 不報錯",fn:"(ctx) => { const list = ctx.createCallbackList(); list.run(1); return true; }"}],returnVars:["createCallbackList"]},{id:2,name:"實作 EventBus",type:"coding",difficulty:"medium",instruction:"實作一個 EventBus class，支援：\n- `on(event, callback)` — 訂閱，回傳取消訂閱函式\n- `emit(event, data)` — 發送事件\n- `off(event, callback)` — 取消訂閱",defaultCode:`class EventBus {
  constructor() {
    this._listeners = new Map();
  }
  on(event, callback) {
    // 訂閱事件，回傳 unsubscribe 函式
    
  }
  emit(event, data) {
    // 觸發所有訂閱者
    
  }
  off(event, callback) {
    // 取消訂閱
    
  }
}`,referenceCode:Sr.eventBusSnippet,example:{title:"範例：用 Map 儲存多組回呼",code:`const m = new Map();
m.set("click", [() => console.log("clicked")]);
m.get("click").forEach(fn => fn());`,output:"clicked",explanation:"用事件名稱當 key、回呼陣列當 value，就是 EventBus 的儲存方式。"},tests:[{description:"基本訂閱+發送",fn:'(ctx) => { const bus = new ctx.EventBus(); let received = null; bus.on("test", d => received = d); bus.emit("test", 42); return received === 42; }'},{description:"取消訂閱",fn:'(ctx) => { const bus = new ctx.EventBus(); let count = 0; const unsub = bus.on("x", () => count++); bus.emit("x"); unsub(); bus.emit("x"); return count === 1; }'},{description:"多個訂閱者",fn:'(ctx) => { const bus = new ctx.EventBus(); let a=0,b=0; bus.on("e",()=>a++); bus.on("e",()=>b++); bus.emit("e"); return a===1 && b===1; }'},{description:"off 取消",fn:'(ctx) => { const bus = new ctx.EventBus(); let c=0; const fn=()=>c++; bus.on("e",fn); bus.off("e",fn); bus.emit("e"); return c===0; }'}],returnVars:["EventBus"]}]},{id:"5-3",name:"Semaphore 並發控制",description:"限制同時執行的數量",xp:50,challenges:[{id:1,name:"計數器",type:"coding",difficulty:"easy",instruction:"寫 `createCounter(max)` — 回傳物件 `{increment(), decrement(), isFull()}`。increment() 讓計數 +1（不超過 max），decrement() 讓計數 -1（不低於 0），isFull() 回傳計數是否已達 max。",defaultCode:`function createCounter(max) {
  let count = 0;
  return {
    increment() {
      // count + 1，但不超過 max
    },
    decrement() {
      // count - 1，但不低於 0
    },
    isFull() {
      // 是否達到 max
    }
  };
}`,example:{title:"範例：簡單的上下限數值",code:`let n = 0;
function up() { n = Math.min(n + 1, 3); }
function down() { n = Math.max(n - 1, 0); }
up(); up(); console.log(n);`,output:"2",explanation:"用 Math.min/max 限制數值範圍，計數器就是用這個技巧。"},tests:[{description:"初始不滿",fn:"(ctx) => ctx.createCounter(3).isFull() === false"},{description:"增到滿",fn:"(ctx) => { const c = ctx.createCounter(2); c.increment(); c.increment(); return c.isFull() === true; }"},{description:"不超過 max",fn:"(ctx) => { const c = ctx.createCounter(1); c.increment(); c.increment(); c.decrement(); return c.isFull() === false; }"},{description:"不低於 0",fn:"(ctx) => { const c = ctx.createCounter(3); c.decrement(); c.increment(); return c.isFull() === false; }"}],returnVars:["createCounter"]},{id:2,name:"實作 Semaphore",type:"coding",difficulty:"medium",instruction:"實作 `AsyncSemaphore` class：\n- `constructor(max)` — 最大並發數\n- `async acquire()` — 取得位子（如果滿了就等）\n- `release()` — 釋放位子",defaultCode:`class AsyncSemaphore {
  constructor(max) {
    this._max = max;
    this._active = 0;
    this._queue = [];
  }
  async acquire() {
    // 如果 _active < _max，直接 _active++ 回傳
    // 否則 new Promise 等待
    
  }
  release() {
    // _active--，如果有人在等就讓下一個進
    
  }
}`,referenceCode:Sr.semaphoreSnippet,example:{title:"範例：用 Promise 排隊",code:`let busy = false;
async function enter() {
  if (!busy) { busy = true; return; }
  // 否則等待...
}
enter(); console.log(busy);`,output:"true",explanation:"用旗標記錄是否有空位，沒有空位就等待，這是 Semaphore 的簡化版。"},tests:[{description:"基本 acquire/release",fn:"(ctx) => { const s = new ctx.AsyncSemaphore(2); s.acquire(); s.acquire(); return s._active === 2; }"},{description:"release 後 active 減少",fn:"(ctx) => { const s = new ctx.AsyncSemaphore(1); s.acquire(); s.release(); return s._active === 0; }"}],returnVars:["AsyncSemaphore"]}]},{id:"5-4",name:"Circuit Breaker",description:"實作三態熔斷器",xp:50,challenges:[{id:1,name:"簡易狀態機",type:"coding",difficulty:"easy",instruction:"寫 `createStateMachine(initialState, transitions)` — transitions 是 `{state: {action: nextState}}` 格式。回傳 `{getState(), transition(action)}`。transition 根據目前狀態和 action 切換到下一個狀態；如果找不到對應的 transition 就不變。",defaultCode:`function createStateMachine(initialState, transitions) {
  let state = initialState;
  return {
    getState() {
      // 回傳目前狀態
    },
    transition(action) {
      // 根據 transitions 切換狀態
    }
  };
}`,example:{title:"範例：用物件定義轉換規則",code:`const rules = { red: { next: "green" }, green: { next: "red" } };
let s = "red";
s = rules[s].next;
console.log(s);`,output:"green",explanation:"用物件描述「在某狀態下，某動作會轉到哪個新狀態」，這就是狀態機。"},tests:[{description:"初始狀態",fn:'(ctx) => ctx.createStateMachine("idle", {}).getState() === "idle"'},{description:"狀態轉換",fn:'(ctx) => { const sm = ctx.createStateMachine("idle", {idle:{start:"running"}, running:{stop:"idle"}}); sm.transition("start"); return sm.getState() === "running"; }'},{description:"無效 action 不變",fn:'(ctx) => { const sm = ctx.createStateMachine("idle", {idle:{start:"running"}}); sm.transition("invalid"); return sm.getState() === "idle"; }'},{description:"連續轉換",fn:'(ctx) => { const sm = ctx.createStateMachine("a", {a:{go:"b"},b:{go:"c"}}); sm.transition("go"); sm.transition("go"); return sm.getState() === "c"; }'}],returnVars:["createStateMachine"]},{id:2,name:"三態狀態機",type:"coding",difficulty:"medium",instruction:"實作 CircuitBreaker class：\n- 初始狀態 CLOSED\n- `recordFailure()` — 記錄失敗，3 次失敗進入 OPEN\n- `recordSuccess()` — 如果在 HALF_OPEN 狀態，回到 CLOSED\n- `canRequest()` — CLOSED 回 true；OPEN 且冷卻時間到了進 HALF_OPEN 回 true；否則 false",defaultCode:`class CircuitBreaker {
  constructor(threshold = 3) {
    this.state = "CLOSED";
    this.failures = 0;
    this.threshold = threshold;
  }
  recordFailure() {
    // 記錄失敗
    
  }
  recordSuccess() {
    // HALF_OPEN → CLOSED
    
  }
  canRequest() {
    // 判斷能不能發請求
    
  }
}`,referenceCode:Sr.circuitBreakerSnippet,example:{title:"範例：累計失敗次數切換狀態",code:`let fails = 0;
let open = false;
function fail() { fails++; if (fails >= 3) open = true; }
fail(); fail(); fail();
console.log(open);`,output:"true",explanation:"累計失敗超過門檻就「斷開」，這就是 Circuit Breaker 的核心邏輯。"},tests:[{description:"初始是 CLOSED",fn:'(ctx) => new ctx.CircuitBreaker().state === "CLOSED"'},{description:"3 次失敗變 OPEN",fn:'(ctx) => { const cb = new ctx.CircuitBreaker(3); cb.recordFailure(); cb.recordFailure(); cb.recordFailure(); return cb.state === "OPEN"; }'},{description:"OPEN 時 canRequest 是 false",fn:"(ctx) => { const cb = new ctx.CircuitBreaker(1); cb.recordFailure(); return cb.canRequest() === false; }"},{description:"CLOSED 時 canRequest 是 true",fn:"(ctx) => new ctx.CircuitBreaker().canRequest() === true"}],returnVars:["CircuitBreaker"]}]},{id:"5-5",name:"ReAct Loop",description:"理解思考行動觀察迴圈",xp:50,challenges:[{id:1,name:"解析工具呼叫",type:"coding",difficulty:"easy",instruction:'寫 `parseToolCalls(text)` — 找出 text 中所有 `[toolName]` 格式的工具名稱，回傳一個工具名稱的陣列。例如 `parseToolCalls("用 [search] 和 [calc] 處理")` → `["search", "calc"]`。',defaultCode:`function parseToolCalls(text) {
  // 找出所有 [toolName] 並回傳名稱陣列
  
}`,example:{title:"範例：用正則取出中括號內容",code:`const text = "use [search] here";
const m = text.match(/\\[(\\w+)\\]/g);
console.log(m);`,output:'["[search]"]',explanation:"用正則表達式 /\\[\\w+\\]/g 匹配方括號中的文字，再擷取名稱。"},tests:[{description:"找到工具",fn:'(ctx) => { const r = ctx.parseToolCalls("用 [search] 找資料"); return r.length === 1 && r[0] === "search"; }'},{description:"多個工具",fn:'(ctx) => { const r = ctx.parseToolCalls("[fetch] 然後 [calc]"); return r.length === 2 && r[0] === "fetch" && r[1] === "calc"; }'},{description:"沒有工具",fn:'(ctx) => ctx.parseToolCalls("沒有工具標記").length === 0'}],returnVars:["parseToolCalls"]},{id:2,name:"思考-行動-觀察",type:"coding",difficulty:"medium",instruction:'寫 `reactStep(state, tools)` — 模擬 ReAct 迴圈的一步：\n- state 有 `{goal, observations, history}` — observations 是上次行動的結果字串\n- tools 是 `{toolName: fn}` 物件\n- 回傳 `{thought, action, result}`\n\n規則：\n- thought: 如果 observations 包含 goal 中的關鍵資訊，thought = "找到答案了"\n- action: 如果還沒找到答案，呼叫 tools 中第一個工具（按 Object.keys 順序）\n- result: 工具回傳的值，或如果已找到答案則為 observations',defaultCode:`function reactStep(state, tools) {
  const { goal, observations, history } = state;
  
  // 判斷是否已經找到答案
  // 如果 observations 包含 "ANSWER:" 就表示找到了
  
  // 還沒找到 → 呼叫工具
  const toolNames = Object.keys(tools);
  
  return {
    thought: "",
    action: "",
    result: ""
  };
}`,example:{title:"範例：根據條件選擇動作",code:`function decide(info) {
  if (info.includes("ANSWER:")) return "done";
  return "keep_searching";
}
console.log(decide("ANSWER: 42"));`,output:"done",explanation:"根據觀察結果判斷下一步動作，這就是 ReAct 迴圈中「思考」的簡化版。"},tests:[{description:"呼叫工具",fn:'(ctx) => { const r = ctx.reactStep({goal:"找庫存",observations:"",history:[]},{search:()=>"庫存: 100"}); return r.action === "search" && r.result === "庫存: 100"; }'},{description:"找到答案",fn:'(ctx) => { const r = ctx.reactStep({goal:"找庫存",observations:"ANSWER: 100",history:[]},{search:()=>"x"}); return r.thought === "找到答案了"; }'},{description:"結果傳遞",fn:'(ctx) => { const r = ctx.reactStep({goal:"x",observations:"ANSWER: done",history:[]},{}); return r.result === "ANSWER: done"; }'}],returnVars:["reactStep"]}]},{id:"5-6",name:"Boss: 自己寫一個 Mini Agent",description:"完整的 tool-calling agent",xp:200,isBoss:!0,challenges:[{id:1,name:"工具調度 Agent",type:"coding",difficulty:"hard",instruction:"寫 `createAgent(tools)` — tools 是 `{name: fn}` 物件。回傳一個 `run(task)` 函式：\n\n`run(task)` 的邏輯：\n1. 解析 task 字串，找出其中提到的工具名稱（task 會包含 `[toolName]` 格式）\n2. 按順序呼叫找到的工具，每個工具的輸入是 task\n3. 收集所有結果到陣列\n4. 回傳 `{task, steps: [{tool, result}], finalAnswer}` — finalAnswer 是最後一個工具的結果",defaultCode:`function createAgent(tools) {
  const toolNames = Object.keys(tools);
  
  return function run(task) {
    const steps = [];
    
    // 找出 task 中提到的 [toolName]
    // 按順序呼叫，收集結果
    
    return {
      task,
      steps,
      finalAnswer: steps.length > 0 ? steps[steps.length - 1].result : null
    };
  };
}`,referenceCode:Sr.reactLoopSnippet,example:{title:"範例：從字典呼叫函式",code:`const tools = { add: (a, b) => a + b };
const name = "add";
console.log(tools[name](3, 4));`,output:"7",explanation:"用字串當 key 查找並呼叫對應函式，Agent 的工具調度就是這個模式。"},tests:[{description:"單工具呼叫",fn:'(ctx) => { const agent = ctx.createAgent({search:(t)=>"found:42"}); const r = agent.run("請用 [search] 找資料"); return r.steps.length === 1 && r.steps[0].tool === "search" && r.finalAnswer === "found:42"; }'},{description:"多工具呼叫",fn:'(ctx) => { const agent = ctx.createAgent({fetch:(t)=>"data",calc:(t)=>"result"}); const r = agent.run("[fetch] 然後 [calc]"); return r.steps.length === 2 && r.finalAnswer === "result"; }'},{description:"無匹配工具",fn:'(ctx) => { const agent = ctx.createAgent({search:()=>"x"}); const r = agent.run("沒有工具標記"); return r.steps.length === 0 && r.finalAnswer === null; }'},{description:"task 保留",fn:'(ctx) => { const agent = ctx.createAgent({}); return agent.run("hello").task === "hello"; }'}],returnVars:["createAgent"]}]}]},{id:6,name:"供應鏈商業案例",emoji:"📊",description:"技術只是手段，理解業務才是價值所在",color:"from-amber-500 to-orange-600",quests:[{id:"6-1",name:"需求預測",description:"實作移動平均預測",xp:50,challenges:[{id:1,name:"移動平均",type:"coding",difficulty:"easy",instruction:"寫 `movingAverage(data, window)` — 取最後 window 筆資料的平均值。",defaultCode:`function movingAverage(data, window) {
  // 取最後 window 筆的平均
  
}`,example:{title:"範例：取陣列最後 N 個元素的平均",code:`const arr = [10, 20, 30, 40];
const last2 = arr.slice(-2);
console.log(last2.reduce((a,b) => a+b, 0) / last2.length);`,output:"35",explanation:"用 slice(-N) 取最後 N 個，再加總除以數量就是平均，移動平均的核心。"},tests:[{description:"4 期平均",fn:"(ctx) => ctx.movingAverage([100,120,90,110], 4) === 105"},{description:"2 期平均",fn:"(ctx) => ctx.movingAverage([100,120,90,110], 2) === 100"},{description:"單期",fn:"(ctx) => ctx.movingAverage([100,120,90,110], 1) === 110"}],returnVars:["movingAverage"]},{id:2,name:"預測誤差",type:"coding",difficulty:"medium",instruction:"寫 `mae(actual, predicted)` — 計算 Mean Absolute Error（平均絕對誤差）。",defaultCode:`function mae(actual, predicted) {
  // |actual[0]-predicted[0]| + ... / n
  
}`,example:{title:"範例：計算兩數差的絕對值",code:`const actual = 10;
const predicted = 13;
console.log(Math.abs(actual - predicted));`,output:"3",explanation:"Math.abs 取絕對值，MAE 就是把所有差的絕對值加起來再平均。"},tests:[{description:"完全準確",fn:"(ctx) => ctx.mae([10,20,30],[10,20,30]) === 0"},{description:"有誤差",fn:"(ctx) => ctx.mae([10,20,30],[12,18,33]) === 3"}],returnVars:["mae"]}]},{id:"6-2",name:"安全庫存策略",description:"計算最佳安全庫存",xp:50,challenges:[{id:1,name:"標準差",type:"coding",difficulty:"easy",instruction:"寫 `stdDev(data)` — 計算母體標準差。公式：先算平均值 μ，再算每個值與 μ 的差的平方的平均，最後開根號。結果四捨五入到小數第二位。",defaultCode:`function stdDev(data) {
  // 1. 算平均值
  // 2. 算方差（每個值與平均的差的平方的平均）
  // 3. 開根號
  // 4. 四捨五入到小數第二位
  
}`,example:{title:"範例：計算方差",code:`const data = [4, 6];
const mean = (4 + 6) / 2; // 5
const variance = ((4-5)**2 + (6-5)**2) / 2;
console.log(variance);`,output:"1",explanation:"方差是每個值與平均的差的平方的平均；標準差就是方差開根號。"},tests:[{description:"基本計算",fn:"(ctx) => ctx.stdDev([2, 4, 4, 4, 5, 5, 7, 9]) === 2"},{description:"全部相同",fn:"(ctx) => ctx.stdDev([5, 5, 5, 5]) === 0"},{description:"兩個值",fn:"(ctx) => ctx.stdDev([0, 10]) === 5"}],returnVars:["stdDev"]},{id:2,name:"安全庫存公式",type:"coding",difficulty:"medium",instruction:"寫 `safetyStock(zScore, demandStdDev, leadTimeDays)` — 公式：`z × σ × √LT`。結果四捨五入到整數。",defaultCode:`function safetyStock(zScore, demandStdDev, leadTimeDays) {
  // z × σ × √LT，四捨五入
  
}`,example:{title:"範例：簡單的乘法公式",code:`const z = 1.65;
const sigma = 10;
const lt = 4;
console.log(Math.round(z * sigma * Math.sqrt(lt)));`,output:"33",explanation:"z x sigma x sqrt(LT) 就是安全庫存公式，最後四捨五入。"},tests:[{description:"95% 服務水準",fn:"(ctx) => ctx.safetyStock(1.65, 20, 7) === 87"},{description:"99% 服務水準",fn:"(ctx) => ctx.safetyStock(2.33, 20, 7) === 123"},{description:"短前置時間",fn:"(ctx) => ctx.safetyStock(1.65, 10, 1) === 17"}],returnVars:["safetyStock"]}]},{id:"6-3",name:"BOM 成本分析",description:"展開 BOM 算總成本",xp:50,challenges:[{id:1,name:"點積",type:"coding",difficulty:"easy",instruction:"寫 `sumProducts(quantities, prices)` — 計算兩個等長陣列的點積（dot product），也就是 quantities[0]*prices[0] + quantities[1]*prices[1] + ...。",defaultCode:`function sumProducts(quantities, prices) {
  // 計算點積
  
}`,example:{title:"範例：兩個陣列對應相乘再加總",code:`const a = [2, 3];
const b = [5, 10];
console.log(a[0]*b[0] + a[1]*b[1]);`,output:"40",explanation:"對應位置相乘後加總就是點積，可以用 reduce 簡化。"},tests:[{description:"基本計算",fn:"(ctx) => ctx.sumProducts([3, 2], [10, 20]) === 70"},{description:"空陣列",fn:"(ctx) => ctx.sumProducts([], []) === 0"},{description:"單一元素",fn:"(ctx) => ctx.sumProducts([5], [10]) === 50"}],returnVars:["sumProducts"]},{id:2,name:"產品成本計算",type:"coding",difficulty:"medium",instruction:"寫 `productCost(components, priceMap)` — components 是 `[{material, quantity}]`，priceMap 是 `{material: unitPrice}`。回傳總成本。",defaultCode:`function productCost(components, priceMap) {
  // 加總每個零件的 quantity × unitPrice
  
}`,example:{title:"範例：查表計算總價",code:`const items = [{name:"A", qty:2}];
const prices = {A: 15};
console.log(items[0].qty * prices[items[0].name]);`,output:"30",explanation:"從價格表查出單價再乘以數量，對所有零件做一遍就是產品成本。"},tests:[{description:"計算正確",fn:'(ctx) => ctx.productCost([{material:"A",quantity:3},{material:"B",quantity:2}],{A:10,B:20}) === 70'},{description:"空零件",fn:"(ctx) => ctx.productCost([],{}) === 0"},{description:"找不到價格當 0",fn:'(ctx) => ctx.productCost([{material:"X",quantity:5}],{}) === 0'}],returnVars:["productCost"]}]},{id:"6-4",name:"風險量化",description:"用機率算風險分數",xp:50,challenges:[{id:1,name:"風險分數",type:"coding",difficulty:"easy",instruction:"寫 `riskScore(probability, impactAmount)` — 回傳 probability × impactAmount。",defaultCode:`function riskScore(probability, impactAmount) {
  
}`,example:{title:"範例：機率乘以影響",code:`const prob = 0.5;
const impact = 200;
console.log(prob * impact);`,output:"100",explanation:"風險分數 = 發生機率 x 影響金額，概念很直觀。"},tests:[{description:"基本計算",fn:"(ctx) => ctx.riskScore(0.3, 500000) === 150000"},{description:"零機率",fn:"(ctx) => ctx.riskScore(0, 1000000) === 0"}],returnVars:["riskScore"]},{id:2,name:"風險排序",type:"coding",difficulty:"medium",instruction:"寫 `rankRisks(items)` — items 是 `[{name, probability, impact}]`，回傳按風險分數（probability × impact）由高到低排序的陣列，每項加上 `riskScore` 欄位。",defaultCode:`function rankRisks(items) {
  // 加上 riskScore 並排序
  
}`,example:{title:"範例：依分數排序物件",code:`const arr = [{n:"X",s:30},{n:"Y",s:50}];
arr.sort((a,b) => b.s - a.s);
console.log(arr[0].n);`,output:"Y",explanation:"用 sort 依照分數由高到低排序，風險排序就是先算分再排。"},tests:[{description:"排序正確",fn:'(ctx) => { const r = ctx.rankRisks([{name:"A",probability:0.1,impact:1000},{name:"B",probability:0.5,impact:500}]); return r[0].name === "B" && r[0].riskScore === 250; }'}],returnVars:["rankRisks"]}]},{id:"6-5",name:"場景模擬",description:"如果原料漲價 20%...",xp:50,challenges:[{id:1,name:"克隆並修改",type:"coding",difficulty:"easy",instruction:"寫 `cloneAndModify(obj, key, newValue)` — 回傳一個新物件，跟 obj 一樣但把 key 對應的值改成 newValue。不修改原物件。",defaultCode:`function cloneAndModify(obj, key, newValue) {
  // 回傳新物件，修改 key 的值
  
}`,example:{title:"範例：用 spread 複製再修改",code:`const obj = { a: 1, b: 2 };
const copy = { ...obj, a: 99 };
console.log(copy, obj.a);`,output:"{ a: 99, b: 2 } 1",explanation:"展開運算子建立淺拷貝，修改不影響原物件。"},tests:[{description:"修改值",fn:'(ctx) => { const r = ctx.cloneAndModify({a:1, b:2}, "a", 10); return r.a === 10 && r.b === 2; }'},{description:"不修改原物件",fn:'(ctx) => { const orig = {x:1}; ctx.cloneAndModify(orig, "x", 2); return orig.x === 1; }'},{description:"新增欄位",fn:'(ctx) => ctx.cloneAndModify({a:1}, "b", 2).b === 2'}],returnVars:["cloneAndModify"]},{id:2,name:"What-If 分析",type:"coding",difficulty:"medium",instruction:"寫 `whatIf(base, changes)` — base 是 `{dailyDemand, unitPrice, leadTimeDays}`，changes 是 `[{field, percentage}]`。回傳調整後的新物件（不修改原物件）。percentage 表示增減百分比，例如 20 表示 +20%。",defaultCode:`function whatIf(base, changes) {
  // 複製 base，套用 changes
  
}`,example:{title:"範例：按百分比調整數值",code:`let price = 100;
const pct = 20; // +20%
price = price * (1 + pct / 100);
console.log(price);`,output:"120",explanation:"百分比調整公式：原值 x (1 + percentage/100)，What-If 就是套用多個這樣的調整。"},tests:[{description:"需求增加 50%",fn:'(ctx) => { const r = ctx.whatIf({dailyDemand:100,unitPrice:10,leadTimeDays:7},[{field:"dailyDemand",percentage:50}]); return r.dailyDemand === 150; }'},{description:"價格降低 20%",fn:'(ctx) => { const r = ctx.whatIf({dailyDemand:100,unitPrice:10,leadTimeDays:7},[{field:"unitPrice",percentage:-20}]); return r.unitPrice === 8; }'},{description:"不修改原物件",fn:'(ctx) => { const b = {dailyDemand:100,unitPrice:10,leadTimeDays:7}; ctx.whatIf(b,[{field:"dailyDemand",percentage:50}]); return b.dailyDemand === 100; }'},{description:"多個調整",fn:'(ctx) => { const r = ctx.whatIf({dailyDemand:100,unitPrice:10,leadTimeDays:7},[{field:"dailyDemand",percentage:50},{field:"unitPrice",percentage:20}]); return r.dailyDemand === 150 && r.unitPrice === 12; }'}],returnVars:["whatIf"]}]},{id:"6-6",name:"Boss: 完整商業簡報",description:"給數據分析做決策建議",xp:200,isBoss:!0,challenges:[{id:1,name:"商業決策報告",type:"coding",difficulty:"hard",instruction:`寫 \`generateReport(data)\` — data 是：
\`\`\`
{
  products: [{name, stock, dailyDemand, unitCost, threshold, leadTimeDays}],
  budget: 可用預算
}
\`\`\`
回傳決策報告物件：
\`\`\`
{
  summary: { totalProducts, totalValue, avgDaysToStockout },
  critical: [缺貨品項名稱],
  recommendations: [{product, action, reason, cost}],
  totalCost: 建議方案的總成本
}
\`\`\`

建議規則：
- stock=0 的品項 → action:"緊急補貨", reason:"已缺貨", cost = dailyDemand × leadTimeDays × unitCost
- stock <= threshold 的品項 → action:"補貨", reason:"低於安全庫存", cost = threshold × unitCost
- 如果 totalCost > budget，只保留成本最低的建議直到預算內`,defaultCode:`function generateReport(data) {
  const { products, budget } = data;
  
  const summary = {
    totalProducts: products.length,
    totalValue: 0,
    avgDaysToStockout: 0
  };
  
  const critical = [];
  let recommendations = [];
  
  // 分析每個產品
  
  // 如果超出預算，按成本排序只保留預算內的
  
  let totalCost = recommendations.reduce((s, r) => s + r.cost, 0);
  
  return { summary, critical, recommendations, totalCost };
}`,referenceCode:`// 在真實 DI 專案中，這類報告由 AI Agent 根據
// calculator.js 和 bomCalculator.js 的結果自動生成
// 你正在學習背後的決策邏輯`,example:{title:"範例：彙整陣列成摘要物件",code:`const items = [{v:10},{v:20},{v:30}];
const summary = {
  count: items.length,
  total: items.reduce((s,i) => s + i.v, 0)
};
console.log(summary);`,output:"{ count: 3, total: 60 }",explanation:"遍歷資料算出各種統計，組合成報告物件，商業決策報告就是更完整的版本。"},tests:[{description:"基本統計",fn:'(ctx) => { const r = ctx.generateReport({products:[{name:"A",stock:100,dailyDemand:10,unitCost:5,threshold:20,leadTimeDays:3},{name:"B",stock:0,dailyDemand:5,unitCost:10,threshold:10,leadTimeDays:5}],budget:10000}); return r.summary.totalProducts === 2; }'},{description:"識別缺貨",fn:'(ctx) => { const r = ctx.generateReport({products:[{name:"X",stock:0,dailyDemand:10,unitCost:5,threshold:20,leadTimeDays:3}],budget:10000}); return r.critical.includes("X"); }'},{description:"緊急補貨建議",fn:'(ctx) => { const r = ctx.generateReport({products:[{name:"X",stock:0,dailyDemand:10,unitCost:5,threshold:20,leadTimeDays:3}],budget:10000}); return r.recommendations[0].action === "緊急補貨" && r.recommendations[0].cost === 150; }'},{description:"預算限制",fn:'(ctx) => { const r = ctx.generateReport({products:[{name:"A",stock:0,dailyDemand:100,unitCost:100,threshold:50,leadTimeDays:10},{name:"B",stock:5,dailyDemand:1,unitCost:10,threshold:10,leadTimeDays:3}],budget:200}); return r.totalCost <= 200; }'}],returnVars:["generateReport"]}]}]}];function Kw(e){return ln.find(t=>t.id===Number(e))}function Cf(e){for(const t of ln){const n=t.quests.find(r=>r.id===e);if(n)return n}return null}function a2(e,t){const n=Cf(e);return n&&n.challenges.find(r=>r.id===Number(t))||null}function _g(){const[e,t]=C.useState(1),{questStatus:n,challengeStatus:r,isWorldUnlocked:i,isQuestUnlocked:s}=Ki(),o=c=>{var d,h,f;if((d=n[c.id])!=null&&d.completed)return"completed";for(let p=1;p<=(((h=c.challenges)==null?void 0:h.length)||0);p++)if((f=r[`${c.id}-${p}`])!=null&&f.completed)return"in-progress";return s(c.id)?"available":"locked"},a=c=>{switch(c){case"completed":return x.jsx(al,{className:"w-5 h-5 text-emerald-400"});case"in-progress":return x.jsx(vm,{className:"w-5 h-5 text-brand-primary animate-pulse"});case"available":return x.jsx(vm,{className:"w-5 h-5 text-slate-400"});default:return x.jsx(xm,{className:"w-5 h-5 text-slate-500"})}},l=c=>{switch(c){case"completed":return"border-emerald-500/30 bg-emerald-500/10";case"in-progress":return"border-brand-primary/50 bg-brand-primary/10";case"available":return"border-slate-600 bg-slate-800/80 hover:border-brand-primary/30";default:return"border-slate-700 bg-slate-800/50 opacity-60 pointer-events-none"}},u=c=>{const d=c.quests.length,h=c.quests.filter(f=>{var p;return(p=n[f.id])==null?void 0:p.completed}).length;return{completed:h,total:d,pct:d>0?Math.round(h/d*100):0}};return x.jsxs("div",{className:"max-w-6xl mx-auto p-6",children:[x.jsxs("div",{className:"mb-8",children:[x.jsx("h2",{className:"text-3xl font-bold text-white mb-2",children:"關卡地圖"}),x.jsx("p",{className:"text-slate-400",children:"選擇一個世界開始你的學習之旅"})]}),x.jsx("div",{className:"grid gap-4",children:ln.map((c,d)=>{const h=e===c.id,f=i(c.id),p=u(c);return x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},transition:{delay:d*.08},className:`rounded-xl border-2 overflow-hidden transition-all duration-300 ${h?"border-slate-600":"border-slate-800 hover:border-slate-700"}`,children:[x.jsxs("button",{onClick:()=>t(h?null:c.id),className:"w-full p-6 flex items-center gap-4 text-left",children:[x.jsx("div",{className:`w-14 h-14 rounded-xl bg-gradient-to-br ${c.color} flex items-center justify-center text-2xl shadow-lg ${f?"":"opacity-40 grayscale"}`,children:c.emoji}),x.jsxs("div",{className:"flex-1",children:[x.jsx("h3",{className:`text-xl font-bold ${f?"text-white":"text-slate-500"}`,children:c.name}),x.jsx("p",{className:`text-sm mt-1 ${f?"text-slate-400":"text-slate-600"}`,children:c.description}),f&&p.completed>0&&x.jsxs("div",{className:"flex items-center gap-2 mt-2",children:[x.jsx("div",{className:"flex-1 h-1.5 bg-slate-700 rounded-full max-w-[200px]",children:x.jsx("div",{className:"h-full bg-brand-primary rounded-full transition-all",style:{width:`${p.pct}%`}})}),x.jsxs("span",{className:"text-xs text-slate-500",children:[p.completed,"/",p.total]})]})]}),!f&&x.jsx(xm,{className:"w-5 h-5 text-slate-600"})]}),h&&f&&x.jsx(We.div,{initial:{height:0,opacity:0},animate:{height:"auto",opacity:1},exit:{height:0,opacity:0},className:"border-t border-slate-800",children:x.jsxs("div",{className:"p-6 grid gap-3",children:[x.jsxs(Fe,{to:`/di-quest/lesson/${c.id}`,className:"flex items-center gap-4 p-4 rounded-lg border border-brand-primary/30 bg-brand-primary/5 hover:bg-brand-primary/10 transition-colors",children:[x.jsx("div",{className:"w-8 h-8 rounded-full bg-brand-primary/20 flex items-center justify-center",children:x.jsx("span",{className:"text-brand-primary text-sm",children:"📖"})}),x.jsx("span",{className:"flex-1 font-medium text-brand-primary",children:"閱讀講義"}),x.jsx("span",{className:"text-slate-500 text-sm",children:"先讀再練"})]}),c.quests.map((v,w)=>{const m=o(v),g=v.challenges&&v.challenges.length>0,y=g?`/di-quest/quest/${c.id}/${v.id}`:"#";return x.jsxs(Fe,{to:y,onClick:k=>{(!g||m==="locked")&&k.preventDefault()},className:`flex items-center gap-4 p-4 rounded-lg border transition-all duration-200 ${m!=="locked"&&g?"hover:scale-[1.02] cursor-pointer":"cursor-default"} ${l(m)}`,children:[x.jsx("div",{className:"w-8 h-8 rounded-full bg-slate-900 flex items-center justify-center text-sm font-mono text-slate-400",children:w+1}),a(m),x.jsx("span",{className:`flex-1 font-medium ${m==="locked"?"text-slate-500":"text-white"}`,children:v.name}),!g&&m!=="locked"&&x.jsx("span",{className:"px-2 py-1 bg-slate-700/50 text-slate-500 text-xs rounded",children:"開發中"}),v.isBoss&&x.jsx("span",{className:"px-2 py-1 bg-red-500/20 text-red-400 text-xs rounded font-bold",children:"BOSS"}),x.jsxs("span",{className:"text-slate-500 text-sm",children:[v.xp," XP"]})]},v.id)})]})})]},c.id)})})]})}function l2(){var a,l,u;const{worldId:e,questId:t}=ef(),{challengeStatus:n,questStatus:r}=Ki(),i=Kw(e),s=Cf(t);if(!s||!i)return x.jsxs("div",{className:"max-w-4xl mx-auto p-6 text-center py-20",children:[x.jsx("p",{className:"text-slate-500 text-lg",children:"找不到這個關卡"}),x.jsx(Fe,{to:"/di-quest/map",className:"btn-primary inline-block mt-4",children:"返回地圖"})]});const o=(a=r[t])==null?void 0:a.completed;return x.jsxs("div",{className:"max-w-4xl mx-auto p-6",children:[x.jsxs(Fe,{to:"/di-quest/map",className:"inline-flex items-center gap-2 text-slate-400 hover:text-white mb-6 transition-colors",children:[x.jsx(tf,{className:"w-4 h-4"}),"返回地圖"]}),x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},className:"card mb-6",children:[x.jsxs("div",{className:"flex items-start justify-between mb-4",children:[x.jsxs("div",{children:[x.jsxs("div",{className:"flex items-center gap-2 mb-1",children:[x.jsx("span",{className:"text-2xl",children:i.emoji}),x.jsxs("span",{className:"text-slate-500 text-sm",children:["World ",e]}),s.isBoss&&x.jsx("span",{className:"px-2 py-0.5 bg-red-500/20 text-red-400 text-xs rounded font-bold",children:"BOSS"})]}),x.jsx("h1",{className:"text-3xl font-bold text-white mt-1",children:s.name})]}),x.jsxs("div",{className:"flex items-center gap-2 px-3 py-2 bg-brand-primary/20 rounded-lg",children:[x.jsx(Cx,{className:"w-5 h-5 text-brand-primary"}),x.jsxs("span",{className:"text-brand-primary font-bold",children:[s.xp," XP"]})]})]}),x.jsx("p",{className:"text-slate-300 text-lg",children:s.description}),o&&x.jsxs("div",{className:"mt-4 flex items-center gap-2 text-emerald-400",children:[x.jsx(al,{className:"w-5 h-5"}),x.jsx("span",{className:"font-medium",children:"已完成"})]})]}),x.jsx(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},transition:{delay:.1},className:"card mb-6 border-brand-primary/30 bg-brand-primary/5",children:x.jsxs("div",{className:"flex items-center justify-between",children:[x.jsxs("div",{className:"flex items-center gap-4",children:[x.jsx("div",{className:"w-12 h-12 rounded-lg bg-brand-primary/20 flex items-center justify-center",children:x.jsx(jr,{className:"w-6 h-6 text-brand-primary"})}),x.jsxs("div",{children:[x.jsx("h2",{className:"text-white font-bold text-lg",children:"先讀講義"}),x.jsxs("p",{className:"text-slate-400 text-sm",children:["在開始挑戰之前，先閱讀 ",i.name," 的完整教材"]})]})]}),x.jsxs(Fe,{to:`/di-quest/lesson/${e}`,className:"flex items-center gap-2 px-6 py-3 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors font-medium",children:[x.jsx(jr,{className:"w-4 h-4"}),"開始閱讀"]})]})}),x.jsxs("div",{className:"grid gap-4 mb-6",children:[x.jsxs("h2",{className:"text-xl font-bold text-white flex items-center gap-2",children:[x.jsx(yd,{className:"w-5 h-5 text-brand-secondary"}),"挑戰列表"]}),s.challenges&&s.challenges.length>0?s.challenges.map((c,d)=>{const h=`${t}-${c.id}`,f=n[h],p=f==null?void 0:f.completed;return x.jsx(We.div,{initial:{opacity:0,x:-20},animate:{opacity:1,x:0},transition:{delay:.2+d*.08},children:x.jsxs(Fe,{to:`/di-quest/arena/${e}/${t}/${c.id}`,className:"card flex items-center gap-4 hover:border-brand-primary/50 transition-colors group",children:[x.jsx("div",{className:`w-12 h-12 rounded-lg flex items-center justify-center text-xl font-bold transition-colors ${p?"bg-emerald-500/20 text-emerald-400":"bg-slate-800 text-slate-400 group-hover:bg-brand-primary/20 group-hover:text-brand-primary"}`,children:p?x.jsx(al,{className:"w-6 h-6"}):d+1}),x.jsxs("div",{className:"flex-1",children:[x.jsx("h3",{className:"text-white font-medium group-hover:text-brand-primary transition-colors",children:c.name}),x.jsxs("div",{className:"flex items-center gap-3 mt-1",children:[x.jsx("span",{className:`text-xs px-2 py-0.5 rounded ${c.difficulty==="easy"?"bg-emerald-500/20 text-emerald-400":c.difficulty==="medium"?"bg-yellow-500/20 text-yellow-400":"bg-red-500/20 text-red-400"}`,children:c.difficulty==="easy"?"簡單":c.difficulty==="medium"?"中等":"困難"}),x.jsx("span",{className:"text-slate-500 text-sm",children:c.type}),(f==null?void 0:f.earnedXp)&&x.jsxs("span",{className:"text-brand-accent text-xs",children:["+",f.earnedXp," XP"]})]})]}),x.jsx(yd,{className:"w-5 h-5 text-slate-500 group-hover:text-brand-primary transition-colors"})]})},c.id)}):x.jsxs("div",{className:"card text-center py-12",children:[x.jsx("p",{className:"text-slate-500",children:"這個關卡的挑戰內容還在開發中"}),x.jsx("p",{className:"text-slate-600 text-sm mt-2",children:"你可以先閱讀講義學習相關概念"}),x.jsx(Fe,{to:`/di-quest/lesson/${e}`,className:"btn-primary inline-block mt-4",children:"閱讀講義"})]})]}),s.isBoss&&((u=(l=s.challenges)==null?void 0:l[0])==null?void 0:u.referenceCode)&&x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},transition:{delay:.5},className:"card",children:[x.jsxs("h3",{className:"text-white font-medium flex items-center gap-2 mb-3",children:[x.jsx(Sx,{className:"w-5 h-5 text-brand-accent"}),"真實程式碼參考"]}),x.jsx("pre",{className:"bg-slate-900 rounded-lg p-4 text-sm text-slate-300 overflow-x-auto font-mono",children:s.challenges[0].referenceCode})]})]})}function Cg(e,t){(t==null||t>e.length)&&(t=e.length);for(var n=0,r=Array(t);n<t;n++)r[n]=e[n];return r}function u2(e){if(Array.isArray(e))return e}function c2(e,t,n){return(t=y2(t))in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function d2(e,t){var n=e==null?null:typeof Symbol<"u"&&e[Symbol.iterator]||e["@@iterator"];if(n!=null){var r,i,s,o,a=[],l=!0,u=!1;try{if(s=(n=n.call(e)).next,t!==0)for(;!(l=(r=s.call(n)).done)&&(a.push(r.value),a.length!==t);l=!0);}catch(c){u=!0,i=c}finally{try{if(!l&&n.return!=null&&(o=n.return(),Object(o)!==o))return}finally{if(u)throw i}}return a}}function h2(){throw new TypeError(`Invalid attempt to destructure non-iterable instance.
In order to be iterable, non-array objects must have a [Symbol.iterator]() method.`)}function Eg(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter(function(i){return Object.getOwnPropertyDescriptor(e,i).enumerable})),n.push.apply(n,r)}return n}function Tg(e){for(var t=1;t<arguments.length;t++){var n=arguments[t]!=null?arguments[t]:{};t%2?Eg(Object(n),!0).forEach(function(r){c2(e,r,n[r])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):Eg(Object(n)).forEach(function(r){Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(n,r))})}return e}function f2(e,t){if(e==null)return{};var n,r,i=p2(e,t);if(Object.getOwnPropertySymbols){var s=Object.getOwnPropertySymbols(e);for(r=0;r<s.length;r++)n=s[r],t.indexOf(n)===-1&&{}.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}function p2(e,t){if(e==null)return{};var n={};for(var r in e)if({}.hasOwnProperty.call(e,r)){if(t.indexOf(r)!==-1)continue;n[r]=e[r]}return n}function m2(e,t){return u2(e)||d2(e,t)||v2(e,t)||h2()}function g2(e,t){if(typeof e!="object"||!e)return e;var n=e[Symbol.toPrimitive];if(n!==void 0){var r=n.call(e,t);if(typeof r!="object")return r;throw new TypeError("@@toPrimitive must return a primitive value.")}return(t==="string"?String:Number)(e)}function y2(e){var t=g2(e,"string");return typeof t=="symbol"?t:t+""}function v2(e,t){if(e){if(typeof e=="string")return Cg(e,t);var n={}.toString.call(e).slice(8,-1);return n==="Object"&&e.constructor&&(n=e.constructor.name),n==="Map"||n==="Set"?Array.from(e):n==="Arguments"||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)?Cg(e,t):void 0}}function x2(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function Pg(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter(function(i){return Object.getOwnPropertyDescriptor(e,i).enumerable})),n.push.apply(n,r)}return n}function Ag(e){for(var t=1;t<arguments.length;t++){var n=arguments[t]!=null?arguments[t]:{};t%2?Pg(Object(n),!0).forEach(function(r){x2(e,r,n[r])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):Pg(Object(n)).forEach(function(r){Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(n,r))})}return e}function w2(){for(var e=arguments.length,t=new Array(e),n=0;n<e;n++)t[n]=arguments[n];return function(r){return t.reduceRight(function(i,s){return s(i)},r)}}function xs(e){return function t(){for(var n=this,r=arguments.length,i=new Array(r),s=0;s<r;s++)i[s]=arguments[s];return i.length>=e.length?e.apply(this,i):function(){for(var o=arguments.length,a=new Array(o),l=0;l<o;l++)a[l]=arguments[l];return t.apply(n,[].concat(i,a))}}}function gl(e){return{}.toString.call(e).includes("Object")}function k2(e){return!Object.keys(e).length}function ho(e){return typeof e=="function"}function b2(e,t){return Object.prototype.hasOwnProperty.call(e,t)}function S2(e,t){return gl(t)||tr("changeType"),Object.keys(t).some(function(n){return!b2(e,n)})&&tr("changeField"),t}function _2(e){ho(e)||tr("selectorType")}function C2(e){ho(e)||gl(e)||tr("handlerType"),gl(e)&&Object.values(e).some(function(t){return!ho(t)})&&tr("handlersType")}function E2(e){e||tr("initialIsRequired"),gl(e)||tr("initialType"),k2(e)&&tr("initialContent")}function T2(e,t){throw new Error(e[t]||e.default)}var P2={initialIsRequired:"initial state is required",initialType:"initial state should be an object",initialContent:"initial state shouldn't be an empty object",handlerType:"handler should be an object or a function",handlersType:"all handlers should be a functions",selectorType:"selector should be a function",changeType:"provided value of changes should be an object",changeField:'it seams you want to change a field in the state which is not specified in the "initial" state',default:"an unknown error accured in `state-local` package"},tr=xs(T2)(P2),ia={changes:S2,selector:_2,handler:C2,initial:E2};function A2(e){var t=arguments.length>1&&arguments[1]!==void 0?arguments[1]:{};ia.initial(e),ia.handler(t);var n={current:e},r=xs(N2)(n,t),i=xs(O2)(n),s=xs(ia.changes)(e),o=xs(R2)(n);function a(){var u=arguments.length>0&&arguments[0]!==void 0?arguments[0]:function(c){return c};return ia.selector(u),u(n.current)}function l(u){w2(r,i,s,o)(u)}return[a,l]}function R2(e,t){return ho(t)?t(e.current):t}function O2(e,t){return e.current=Ag(Ag({},e.current),t),t}function N2(e,t,n){return ho(t)?t(e.current):Object.keys(n).forEach(function(r){var i;return(i=t[r])===null||i===void 0?void 0:i.call(t,e.current[r])}),n}var j2={create:A2},I2={paths:{vs:"https://cdn.jsdelivr.net/npm/monaco-editor@0.55.1/min/vs"}};function D2(e){return function t(){for(var n=this,r=arguments.length,i=new Array(r),s=0;s<r;s++)i[s]=arguments[s];return i.length>=e.length?e.apply(this,i):function(){for(var o=arguments.length,a=new Array(o),l=0;l<o;l++)a[l]=arguments[l];return t.apply(n,[].concat(i,a))}}}function L2(e){return{}.toString.call(e).includes("Object")}function M2(e){return e||Rg("configIsRequired"),L2(e)||Rg("configType"),e.urls?(B2(),{paths:{vs:e.urls.monacoBase}}):e}function B2(){console.warn(Jw.deprecation)}function F2(e,t){throw new Error(e[t]||e.default)}var Jw={configIsRequired:"the configuration object is required",configType:"the configuration object should be an object",default:"an unknown error accured in `@monaco-editor/loader` package",deprecation:`Deprecation warning!
    You are using deprecated way of configuration.

    Instead of using
      monaco.config({ urls: { monacoBase: '...' } })
    use
      monaco.config({ paths: { vs: '...' } })

    For more please check the link https://github.com/suren-atoyan/monaco-loader#config
  `},Rg=D2(F2)(Jw),$2={config:M2},U2=function(){for(var t=arguments.length,n=new Array(t),r=0;r<t;r++)n[r]=arguments[r];return function(i){return n.reduceRight(function(s,o){return o(s)},i)}};function Qw(e,t){return Object.keys(t).forEach(function(n){t[n]instanceof Object&&e[n]&&Object.assign(t[n],Qw(e[n],t[n]))}),Tg(Tg({},e),t)}var V2={type:"cancelation",msg:"operation is manually canceled"};function Ju(e){var t=!1,n=new Promise(function(r,i){e.then(function(s){return t?i(V2):r(s)}),e.catch(i)});return n.cancel=function(){return t=!0},n}var z2=["monaco"],q2=j2.create({config:I2,isInitialized:!1,resolve:null,reject:null,monaco:null}),Xw=m2(q2,2),Oo=Xw[0],Yl=Xw[1];function H2(e){var t=$2.config(e),n=t.monaco,r=f2(t,z2);Yl(function(i){return{config:Qw(i.config,r),monaco:n}})}function W2(){var e=Oo(function(t){var n=t.monaco,r=t.isInitialized,i=t.resolve;return{monaco:n,isInitialized:r,resolve:i}});if(!e.isInitialized){if(Yl({isInitialized:!0}),e.monaco)return e.resolve(e.monaco),Ju(Qu);if(window.monaco&&window.monaco.editor)return Yw(window.monaco),e.resolve(window.monaco),Ju(Qu);U2(G2,J2)(Q2)}return Ju(Qu)}function G2(e){return document.body.appendChild(e)}function K2(e){var t=document.createElement("script");return e&&(t.src=e),t}function J2(e){var t=Oo(function(r){var i=r.config,s=r.reject;return{config:i,reject:s}}),n=K2("".concat(t.config.paths.vs,"/loader.js"));return n.onload=function(){return e()},n.onerror=t.reject,n}function Q2(){var e=Oo(function(n){var r=n.config,i=n.resolve,s=n.reject;return{config:r,resolve:i,reject:s}}),t=window.require;t.config(e.config),t(["vs/editor/editor.main"],function(n){var r=n.m||n;Yw(r),e.resolve(r)},function(n){e.reject(n)})}function Yw(e){Oo().monaco||Yl({monaco:e})}function X2(){return Oo(function(e){var t=e.monaco;return t})}var Qu=new Promise(function(e,t){return Yl({resolve:e,reject:t})}),Zw={config:H2,init:W2,__getMonacoInstance:X2},Y2={wrapper:{display:"flex",position:"relative",textAlign:"initial"},fullWidth:{width:"100%"},hide:{display:"none"}},Xu=Y2,Z2={container:{display:"flex",height:"100%",width:"100%",justifyContent:"center",alignItems:"center"}},eR=Z2;function tR({children:e}){return rn.createElement("div",{style:eR.container},e)}var nR=tR,rR=nR;function iR({width:e,height:t,isEditorReady:n,loading:r,_ref:i,className:s,wrapperProps:o}){return rn.createElement("section",{style:{...Xu.wrapper,width:e,height:t},...o},!n&&rn.createElement(rR,null,r),rn.createElement("div",{ref:i,style:{...Xu.fullWidth,...!n&&Xu.hide},className:s}))}var sR=iR,e1=C.memo(sR);function oR(e){C.useEffect(e,[])}var t1=oR;function aR(e,t,n=!0){let r=C.useRef(!0);C.useEffect(r.current||!n?()=>{r.current=!1}:e,t)}var gt=aR;function Ds(){}function Si(e,t,n,r){return lR(e,r)||uR(e,t,n,r)}function lR(e,t){return e.editor.getModel(n1(e,t))}function uR(e,t,n,r){return e.editor.createModel(t,n,r?n1(e,r):void 0)}function n1(e,t){return e.Uri.parse(t)}function cR({original:e,modified:t,language:n,originalLanguage:r,modifiedLanguage:i,originalModelPath:s,modifiedModelPath:o,keepCurrentOriginalModel:a=!1,keepCurrentModifiedModel:l=!1,theme:u="light",loading:c="Loading...",options:d={},height:h="100%",width:f="100%",className:p,wrapperProps:v={},beforeMount:w=Ds,onMount:m=Ds}){let[g,y]=C.useState(!1),[k,T]=C.useState(!0),S=C.useRef(null),P=C.useRef(null),A=C.useRef(null),O=C.useRef(m),E=C.useRef(w),L=C.useRef(!1);t1(()=>{let M=Zw.init();return M.then(U=>(P.current=U)&&T(!1)).catch(U=>(U==null?void 0:U.type)!=="cancelation"&&console.error("Monaco initialization: error:",U)),()=>S.current?J():M.cancel()}),gt(()=>{if(S.current&&P.current){let M=S.current.getOriginalEditor(),U=Si(P.current,e||"",r||n||"text",s||"");U!==M.getModel()&&M.setModel(U)}},[s],g),gt(()=>{if(S.current&&P.current){let M=S.current.getModifiedEditor(),U=Si(P.current,t||"",i||n||"text",o||"");U!==M.getModel()&&M.setModel(U)}},[o],g),gt(()=>{let M=S.current.getModifiedEditor();M.getOption(P.current.editor.EditorOption.readOnly)?M.setValue(t||""):t!==M.getValue()&&(M.executeEdits("",[{range:M.getModel().getFullModelRange(),text:t||"",forceMoveMarkers:!0}]),M.pushUndoStop())},[t],g),gt(()=>{var M,U;(U=(M=S.current)==null?void 0:M.getModel())==null||U.original.setValue(e||"")},[e],g),gt(()=>{let{original:M,modified:U}=S.current.getModel();P.current.editor.setModelLanguage(M,r||n||"text"),P.current.editor.setModelLanguage(U,i||n||"text")},[n,r,i],g),gt(()=>{var M;(M=P.current)==null||M.editor.setTheme(u)},[u],g),gt(()=>{var M;(M=S.current)==null||M.updateOptions(d)},[d],g);let B=C.useCallback(()=>{var X;if(!P.current)return;E.current(P.current);let M=Si(P.current,e||"",r||n||"text",s||""),U=Si(P.current,t||"",i||n||"text",o||"");(X=S.current)==null||X.setModel({original:M,modified:U})},[n,t,i,e,r,s,o]),K=C.useCallback(()=>{var M;!L.current&&A.current&&(S.current=P.current.editor.createDiffEditor(A.current,{automaticLayout:!0,...d}),B(),(M=P.current)==null||M.editor.setTheme(u),y(!0),L.current=!0)},[d,u,B]);C.useEffect(()=>{g&&O.current(S.current,P.current)},[g]),C.useEffect(()=>{!k&&!g&&K()},[k,g,K]);function J(){var U,X,I,$;let M=(U=S.current)==null?void 0:U.getModel();a||((X=M==null?void 0:M.original)==null||X.dispose()),l||((I=M==null?void 0:M.modified)==null||I.dispose()),($=S.current)==null||$.dispose()}return rn.createElement(e1,{width:f,height:h,isEditorReady:g,loading:c,_ref:A,className:p,wrapperProps:v})}var dR=cR;C.memo(dR);function hR(e){let t=C.useRef();return C.useEffect(()=>{t.current=e},[e]),t.current}var fR=hR,sa=new Map;function pR({defaultValue:e,defaultLanguage:t,defaultPath:n,value:r,language:i,path:s,theme:o="light",line:a,loading:l="Loading...",options:u={},overrideServices:c={},saveViewState:d=!0,keepCurrentModel:h=!1,width:f="100%",height:p="100%",className:v,wrapperProps:w={},beforeMount:m=Ds,onMount:g=Ds,onChange:y,onValidate:k=Ds}){let[T,S]=C.useState(!1),[P,A]=C.useState(!0),O=C.useRef(null),E=C.useRef(null),L=C.useRef(null),B=C.useRef(g),K=C.useRef(m),J=C.useRef(),M=C.useRef(r),U=fR(s),X=C.useRef(!1),I=C.useRef(!1);t1(()=>{let N=Zw.init();return N.then(q=>(O.current=q)&&A(!1)).catch(q=>(q==null?void 0:q.type)!=="cancelation"&&console.error("Monaco initialization: error:",q)),()=>E.current?_():N.cancel()}),gt(()=>{var q,b,ee,de;let N=Si(O.current,e||r||"",t||i||"",s||n||"");N!==((q=E.current)==null?void 0:q.getModel())&&(d&&sa.set(U,(b=E.current)==null?void 0:b.saveViewState()),(ee=E.current)==null||ee.setModel(N),d&&((de=E.current)==null||de.restoreViewState(sa.get(s))))},[s],T),gt(()=>{var N;(N=E.current)==null||N.updateOptions(u)},[u],T),gt(()=>{!E.current||r===void 0||(E.current.getOption(O.current.editor.EditorOption.readOnly)?E.current.setValue(r):r!==E.current.getValue()&&(I.current=!0,E.current.executeEdits("",[{range:E.current.getModel().getFullModelRange(),text:r,forceMoveMarkers:!0}]),E.current.pushUndoStop(),I.current=!1))},[r],T),gt(()=>{var q,b;let N=(q=E.current)==null?void 0:q.getModel();N&&i&&((b=O.current)==null||b.editor.setModelLanguage(N,i))},[i],T),gt(()=>{var N;a!==void 0&&((N=E.current)==null||N.revealLine(a))},[a],T),gt(()=>{var N;(N=O.current)==null||N.editor.setTheme(o)},[o],T);let $=C.useCallback(()=>{var N;if(!(!L.current||!O.current)&&!X.current){K.current(O.current);let q=s||n,b=Si(O.current,r||e||"",t||i||"",q||"");E.current=(N=O.current)==null?void 0:N.editor.create(L.current,{model:b,automaticLayout:!0,...u},c),d&&E.current.restoreViewState(sa.get(q)),O.current.editor.setTheme(o),a!==void 0&&E.current.revealLine(a),S(!0),X.current=!0}},[e,t,n,r,i,s,u,c,d,o,a]);C.useEffect(()=>{T&&B.current(E.current,O.current)},[T]),C.useEffect(()=>{!P&&!T&&$()},[P,T,$]),M.current=r,C.useEffect(()=>{var N,q;T&&y&&((N=J.current)==null||N.dispose(),J.current=(q=E.current)==null?void 0:q.onDidChangeModelContent(b=>{I.current||y(E.current.getValue(),b)}))},[T,y]),C.useEffect(()=>{if(T){let N=O.current.editor.onDidChangeMarkers(q=>{var ee;let b=(ee=E.current.getModel())==null?void 0:ee.uri;if(b&&q.find(de=>de.path===b.path)){let de=O.current.editor.getModelMarkers({resource:b});k==null||k(de)}});return()=>{N==null||N.dispose()}}return()=>{}},[T,k]);function _(){var N,q;(N=J.current)==null||N.dispose(),h?d&&sa.set(s,E.current.saveViewState()):(q=E.current.getModel())==null||q.dispose(),E.current.dispose()}return rn.createElement(e1,{width:f,height:p,isEditorReady:T,loading:l,_ref:L,className:v,wrapperProps:w})}var mR=pR,gR=C.memo(mR),yR=gR;const vR=`
# World 1：JavaScript 基礎島

> **目標：** 學完後你能讀懂專案裡的 \`calculator.js\`，並自己從零寫出一個類似的模組
> **時間：** 約 4 天

---

## Day 1：變數、函式、條件判斷

### 1.1 什麼是程式？

程式就是一份「給電腦看的食譜」。你告訴電腦一步一步要做什麼，它照做。

打開你的終端機（Terminal），輸入 \`node\` 進入 JavaScript 互動模式。跟著打：

\`\`\`javascript
// 這是一行註解，電腦會忽略它。// 後面的文字是給人看的。
\`\`\`

---

### 1.2 變數 — 幫資料取名字

變數就是一個「名牌」，你把一個資料貼上名牌，之後就可以用名字找到它。

\`\`\`javascript
// 用 const 宣告一個「不會改變」的變數
const myName = 'Louis';
const age = 22;
const isStudent = true;

// 用 let 宣告一個「可能會改」的變數
let score = 85;
score = 90; // 可以改

// 印出來看看
console.log(myName);    // 印出: Louis
console.log(age);       // 印出: 22
console.log(score);     // 印出: 90
\`\`\`

**三種基本資料型別：**

| 型別 | 例子 | 說明 |
|------|------|------|
| \`string\` 字串 | \`'hello'\`、\`"世界"\` | 用引號包起來的文字 |
| \`number\` 數字 | \`42\`、\`3.14\`、\`-5\` | 整數或小數 |
| \`boolean\` 布林 | \`true\`、\`false\` | 只有兩個值：是 / 否 |

**為什麼有 const 和 let 兩種？**

\`const\` = constant（常數）。宣告之後**不能**再改它的值。適合用在「這個值不應該被改掉」的情況。

\`let\` = 可變的。宣告之後**可以**改。適合用在「這個值會在過程中改變」的情況，例如分數、計數器。

**經驗法則：** 預設用 \`const\`，除非你確定需要改值才用 \`let\`。

> **練習 1：** 宣告三個變數：你的名字、你的年齡、你是不是學生。然後用 \`console.log\` 印出來。

---

### 1.3 函式 — 可以重複使用的食譜

函式就是一段「打包好的程式碼」，你給它一些材料（參數），它做完事情後把結果還給你（回傳值）。

\`\`\`javascript
// 定義一個函式：計算兩個數字的加總
function add(a, b) {
  return a + b;
}

// 使用這個函式
const result = add(3, 5);
console.log(result); // 印出: 8

// 你可以重複使用它
console.log(add(10, 20)); // 印出: 30
console.log(add(1, 1));   // 印出: 2
\`\`\`

拆解一下：
- \`function\` — 告訴電腦「我要定義一個函式」
- \`add\` — 函式的名字
- \`(a, b)\` — 參數（材料），呼叫時傳進來的值
- \`return a + b\` — 回傳值（做出來的菜）
- \`add(3, 5)\` — 呼叫函式，把 3 和 5 傳進去

**沒有 return 會怎樣？** 函式會回傳 \`undefined\`（未定義）。這是新手最常犯的錯之一：

\`\`\`javascript
function badAdd(a, b) {
  a + b; // 算了但沒 return！
}
console.log(badAdd(3, 5)); // 印出: undefined（不是 8！）
\`\`\`

**另一種寫法（箭頭函式）：**

\`\`\`javascript
// 跟上面的 add 完全一樣，只是寫法不同
const add = (a, b) => {
  return a + b;
};

// 如果只有一行 return，可以更簡短
const add = (a, b) => a + b;
\`\`\`

箭頭函式在你的 DI 專案裡到處都是。兩種寫法效果一樣，箭頭函式比較簡潔。

**預設參數：**

\`\`\`javascript
// safetyStock 如果沒傳，預設是 0
function calculateDays(stock, demand, safetyStock = 0) {
  return (stock - safetyStock) / demand;
}

calculateDays(100, 10);     // safetyStock 用預設的 0 → 10
calculateDays(100, 10, 20); // safetyStock = 20 → 8
\`\`\`

你的專案 \`calculator.js\` 裡就用了這招：\`safetyStock = 0\`。

> **練習 2：** 寫一個函式 \`multiply(a, b)\`，回傳兩個數字的乘積。測試 \`multiply(4, 5)\` 應該得到 20。

---

### 1.4 條件判斷 — 讓程式做決定

\`\`\`javascript
function checkTemperature(temp) {
  if (temp > 37.5) {
    return '發燒了！';
  } else if (temp > 36) {
    return '體溫正常';
  } else {
    return '體溫偏低';
  }
}

console.log(checkTemperature(38));   // 印出: 發燒了！
console.log(checkTemperature(36.5)); // 印出: 體溫正常
console.log(checkTemperature(35));   // 印出: 體溫偏低
\`\`\`

拆解：
- \`if (條件)\` — 如果條件成立（true），就執行大括號裡的程式碼
- \`else if (另一個條件)\` — 否則，如果這個條件成立
- \`else\` — 以上都不成立時

**比較運算子：**

| 符號 | 意思 | 例子 |
|------|------|------|
| \`>\` | 大於 | \`5 > 3\` → true |
| \`<\` | 小於 | \`5 < 3\` → false |
| \`>=\` | 大於等於 | \`5 >= 5\` → true |
| \`<=\` | 小於等於 | \`4 <= 5\` → true |
| \`===\` | 等於 | \`5 === 5\` → true |
| \`!==\` | 不等於 | \`5 !== 3\` → true |

**三元運算子 — if/else 的簡寫：**

\`\`\`javascript
// 這一行
const label = days > 14 ? '安全' : '危險';

// 等同於這五行
let label;
if (days > 14) {
  label = '安全';
} else {
  label = '危險';
}
\`\`\`

> **練習 3：** 寫 \`gradeScore(score)\`，根據分數回傳 A/B/C/D/F。分數不在 0-100 之間回傳 \`"Invalid"\`。

---

### 1.5 物件 — 把相關資料打包在一起

\`\`\`javascript
// 一個庫存品項的資料（來自你專案的 inventory_snapshots.csv）
const item = {
  materialCode: 'COMP-001',
  currentStock: 500,
  dailyDemand: 50,
  safetyStock: 100,
};

// 取出資料
console.log(item.materialCode);  // 'COMP-001'
console.log(item.currentStock);  // 500
\`\`\`

**解構賦值 — 從物件中取出欄位的簡寫：**

\`\`\`javascript
// 完整寫法
const code = item.materialCode;
const stock = item.currentStock;

// 解構寫法（效果完全一樣，只是更簡潔）
const { materialCode, currentStock } = item;

// 函式參數也可以解構
function describe({ materialCode, currentStock }) {
  return materialCode + ': ' + currentStock + ' 個';
}
describe(item); // 'COMP-001: 500 個'
\`\`\`

**展開運算子（Spread Operator）— 複製物件：**

\`\`\`javascript
// 建立一個新物件，跟 item 一樣但 currentStock 不同
const updated = { ...item, currentStock: 450 };

// item 不會被改到（不可變性！）
console.log(item.currentStock);    // 還是 500
console.log(updated.currentStock); // 450
\`\`\`

這在 React 和你的專案裡**到處都是**。\`{ ...item, xxx: newValue }\` 表示「複製 item，但覆蓋 xxx」。

> **練習 4：** 建立一個物件代表 COMP-001。寫一個函式 \`daysUntilEmpty(item)\`，用解構取出 currentStock 和 dailyDemand，算出幾天後用完。

---

### 1.6 陣列 — 一堆資料的清單

\`\`\`javascript
const inventory = [
  { materialCode: 'COMP-001', currentStock: 500, dailyDemand: 50 },
  { materialCode: 'COMP-002', currentStock: 80,  dailyDemand: 30 },
  { materialCode: 'COMP-003', currentStock: 200, dailyDemand: 10 },
];

// 取第一筆
console.log(inventory[0].materialCode); // 'COMP-001'

// 陣列長度
console.log(inventory.length); // 3
\`\`\`

**三大陣列方法（你專案裡用最多的）：**

\`\`\`javascript
// filter — 過濾出符合條件的
const lowStock = inventory.filter(item => item.currentStock < 100);
// → [{ materialCode: 'COMP-002', ... }]

// map — 把每一筆轉換成新的格式
const codes = inventory.map(item => item.materialCode);
// → ['COMP-001', 'COMP-002', 'COMP-003']

// reduce — 把所有東西「折疊」成一個值
const totalStock = inventory.reduce((sum, item) => sum + item.currentStock, 0);
// → 780
\`\`\`

\`reduce\` 比較難懂，拆解一下：

\`\`\`javascript
inventory.reduce((累加器, 目前這筆) => 累加器 + 目前這筆.currentStock, 初始值);

// 第一輪：sum = 0,   item = COMP-001 → 0 + 500 = 500
// 第二輪：sum = 500,  item = COMP-002 → 500 + 80 = 580
// 第三輪：sum = 580,  item = COMP-003 → 580 + 200 = 780
// 結果：780
\`\`\`

**for 迴圈：**

\`\`\`javascript
for (const item of inventory) {
  console.log(item.materialCode + ': ' + item.currentStock);
}
\`\`\`

> **練習 5：** 用 \`filter\` 找出庫存天數低於 7 天的品項（用 currentStock / dailyDemand 算天數）。

---

### Day 1 總結

你學了六個概念：**變數、函式、條件判斷、物件、陣列、迴圈**。這就是 \`calculator.js\` 用到的全部基礎，沒有更多了。

---

## Day 2：讀懂 calculator.js

### 2.1 常數定義

\`\`\`javascript
// 來自你的專案 src/domains/inventory/calculator.js
export const RISK_THRESHOLDS = {
  CRITICAL_DAYS: 7,
  WARNING_DAYS: 14,
  HIGH_VOLATILITY: 0.2,
};
\`\`\`

**為什麼要把數字放在常數裡？** 假設老闆說「把緊急的標準從 7 天改成 5 天」，你只需要改 \`CRITICAL_DAYS: 5\`。如果直接寫 \`7\`，你得找遍所有出現 \`7\` 的地方——很容易漏改。

**\`export\` 是什麼？** 表示「允許其他檔案引入這個東西」。就像餐廳菜單上有的菜才能點。

**工廠函式（在 ERROR_MESSAGES 裡）：**

\`\`\`javascript
export const ERROR_MESSAGES = {
  INVALID_NUMBER: (name) => \\\`\\\${name} must be a valid number\\\`,
};

ERROR_MESSAGES.INVALID_NUMBER('currentStock')
// → "currentStock must be a valid number"
\`\`\`

一個模板就能產生各種錯誤訊息。

---

### 2.2 calculateDaysToStockout — 逐行解讀

**輸入驗證：**

\`\`\`javascript
if (typeof currentStock !== 'number' || isNaN(currentStock)) {
  throw new Error(ERROR_MESSAGES.INVALID_NUMBER('currentStock'));
}
\`\`\`

- \`typeof x !== 'number'\` → x 的型別不是數字
- \`||\` → 或者
- \`isNaN(x)\` → x 是 NaN（Not a Number）
- \`throw new Error(...)\` → 丟出錯誤，程式中斷

**為什麼要驗證？** 如果傳了 \`"abc"\`，\`"abc" / 10\` 得到 \`NaN\`。程式不會報錯但結果是錯的。有驗證就會直接告訴你問題在哪。

**邊界情況：**

\`\`\`javascript
if (currentStock < 0) return { days: 0, status: 'critical' };     // 負庫存 = 已經沒貨
if (currentStock < safetyStock) return { days: 0, status: 'critical' }; // 低於安全水位
if (dailyDemand <= 0) return { days: Infinity, status: 'ok' };    // 沒人用 = 永遠不斷
\`\`\`

**核心計算：**

\`\`\`javascript
const availableStock = currentStock - safetyStock;
const days = availableStock / dailyDemand;

let status;
if (days < RISK_THRESHOLDS.CRITICAL_DAYS) status = 'critical';
else if (days < RISK_THRESHOLDS.WARNING_DAYS) status = 'warning';
else status = 'ok';

return { days: Math.max(0, days), status };
\`\`\`

\`Math.max(0, days)\` 確保天數不是負數。

---

### 2.3 calculateInventoryRisk — 函式組合

\`\`\`javascript
export function calculateInventoryRisk(position) {
  const { currentStock, safetyStock, dailyDemand, leadTimeDays, demandVolatility } = position;

  const stockout = calculateDaysToStockout(currentStock, dailyDemand, safetyStock);
  const probability = calculateStockoutProbability(stockout.days, leadTimeDays, demandVolatility);
  const urgency = calculateUrgencyScore(stockout.days);

  return { daysToStockout: stockout.days, probability, urgencyScore: urgency, riskLevel: ... };
}
\`\`\`

這就是**函式組合**：每個小函式只做一件事，大函式把它們串起來。讀起來像自然語言：「先算天數，再算機率，再算緊迫度」。

---

## Day 3：自己動手寫

### 作業

1. 建立 \`my-practice/calculator.js\`
2. 自己實作 \`calculateDaysToStockout\`（不看原始碼）
3. 在 \`calculator.test.js\` 裡寫至少 10 個測試
4. 額外挑戰：自己寫 \`calculateEOQ\`（最佳訂購量）

---

## Day 4：BOM 展開 + 遞迴

### 什麼是 BOM？

BOM = Bill of Materials = 物料清單。

\`\`\`
腳踏車 (1台)
├── 車架 (1個)
│   ├── 鋼管 (3根)
│   └── 焊接件 (6個)
├── 前輪 (1個)
│   ├── 輪圈 (1個)
│   └── 輪胎 (1個)
└── 後輪 (1個)
    ├── 輪圈 (1個)
    └── 輪胎 (1個)
\`\`\`

BOM Explosion = 把這棵樹攤平，算出每個零件總共需要多少。

### 什麼是遞迴？

函式呼叫自己。先看階乘：

\`\`\`javascript
function factorial(n) {
  if (n <= 1) return 1;        // 終止條件
  return n * factorial(n - 1); // 遞迴
}
// factorial(5) = 5 × 4 × 3 × 2 × 1 = 120
\`\`\`

BOM 展開也是遞迴：「腳踏車需要什麼零件？」→ 看第一層 → 每個子件再問「它需要什麼？」→ 直到沒有子件。

### 循環偵測

如果 A 需要 B，B 又需要 A，遞迴會無限跑下去。解法：用 \`Set\` 記錄已走訪的品項。

\`\`\`javascript
function explode(item, qty, visited = new Set()) {
  if (visited.has(item)) return { error: 'CIRCULAR_REFERENCE' };
  visited.add(item);
  // ...遞迴展開...
}
\`\`\`

---

## 附錄：JavaScript 語法速查表

| 語法 | 例子 | 說明 |
|------|------|------|
| 變數 | \`const x = 10\` | 不可改 |
| 變數 | \`let y = 20\` | 可改 |
| 函式 | \`function f(a) { return a; }\` | 宣告函式 |
| 箭頭 | \`(a, b) => a + b\` | 簡寫 |
| 條件 | \`if (x > 0) {} else {}\` | 判斷 |
| 三元 | \`x > 0 ? 'yes' : 'no'\` | 簡寫 if |
| 物件 | \`{ name: 'a', age: 1 }\` | 鍵值對 |
| 解構 | \`const { name } = obj\` | 取值 |
| 展開 | \`{ ...obj, name: 'b' }\` | 複製+覆蓋 |
| 陣列 | \`[1, 2, 3]\` | 清單 |
| filter | \`arr.filter(x => x > 2)\` | 過濾 |
| map | \`arr.map(x => x * 2)\` | 轉換 |
| reduce | \`arr.reduce((s, x) => s + x, 0)\` | 折疊 |
| for of | \`for (const x of arr) {}\` | 迴圈 |
| typeof | \`typeof 42 → 'number'\` | 檢查型別 |
| Math | \`Math.max, Math.min, Math.round, Math.sqrt\` | 數學 |
`,xR=`
# World 2：純函式神殿

> **目標：** 理解純函式、輸入驗證、邊界處理、函式組合、自動化測試，最後挑戰 BOM 遞迴展開
> **對應專案：** \`src/domains/inventory/calculator.js\`、\`src/domains/forecast/bomCalculator.js\`
> **學完後你能：** 寫出可測試、無副作用、能處理各種意外輸入的函式

---

## 2-1：什麼是純函式（Pure Function）

### 比喻：販賣機 vs 餐廳服務生

想像一台販賣機：你投 10 元硬幣、按「可樂」按鈕，它**永遠**給你一罐可樂。不會因為心情不好給你果汁，也不會偷偷拿走旁邊的零錢。這就是純函式。

相比之下，餐廳服務生可能會說「今天可樂賣完了，幫你換果汁」，還會把你的餐費記到帳單上。它的行為取決於外部狀態，還會改變外部狀態。這就是「不純」的函式。

### 兩條黃金規則

**規則 1：相同的輸入，永遠得到相同的輸出。**

\`\`\`javascript
// ✅ 純函式 — 同樣的輸入永遠回傳同樣的結果
function add(a, b) {
  return a + b;
}
add(3, 5); // 永遠是 8，今天是 8，明天也是 8

// ❌ 不純 — 結果取決於外部狀態
let bonus = 10;
function addWithBonus(a, b) {
  return a + b + bonus; // bonus 可能被別人改掉
}
addWithBonus(3, 5); // 現在是 18
bonus = 50;
addWithBonus(3, 5); // 變成 58 了！同樣的輸入，不同的結果
\`\`\`

**規則 2：不產生副作用（Side Effect）。**

副作用 = 修改外面的東西、存資料庫、發 API 請求、印東西到螢幕上、改傳進來的參數...

\`\`\`javascript
// ✅ 純函式 — 只算東西，不做別的
function classifyRisk(days) {
  if (days < 7) return 'critical';
  if (days < 14) return 'warning';
  return 'safe';
}

// ❌ 不純 — 修改了外部變數
let totalCritical = 0;
function classifyAndCount(days) {
  if (days < 7) {
    totalCritical++; // 副作用！改了外面的東西
    return 'critical';
  }
  return 'safe';
}

// ❌ 不純 — 修改了傳入的陣列
function addItem(arr, item) {
  arr.push(item); // 修改了原陣列！呼叫者的陣列被改了
  return arr;
}

// ✅ 改成純函式 — 回傳新陣列
function addItemPure(arr, item) {
  return [...arr, item]; // 不改原陣列，回傳新的
}
\`\`\`

### 常見的副作用陷阱

| 副作用類型 | 例子 | 為什麼不純 |
|-----------|------|-----------|
| 修改外部變數 | \`counter++\` | 函式外面的值被改了 |
| 修改輸入參數 | \`arr.push(x)\`、\`obj.name = 'new'\` | 呼叫者的資料被改了 |
| 呼叫 API | \`fetch('/api/data')\` | 結果取決於網路和伺服器狀態 |
| 讀取時間 | \`Date.now()\`、\`new Date()\` | 每次呼叫結果不同 |
| 隨機數 | \`Math.random()\` | 每次呼叫結果不同 |
| 印出東西 | \`console.log()\` | 嚴格說也是副作用 |
| 讀寫檔案 | \`fs.readFile()\` | 外部資源 |

### 為什麼純函式重要？

| 好處 | 說明 |
|------|------|
| 好測試 | 不需要準備環境，直接 input → output |
| 好理解 | 看函式簽名就知道它做什麼 |
| 好組合 | 小純函式可以像積木一樣拼成大函式 |
| 不怕並行 | 不修改共享狀態，不會有競爭條件 |
| 好快取 | 同樣的輸入一定同樣的輸出，可以存結果 |

### 真實專案：calculator.js

打開 \`src/domains/inventory/calculator.js\`，開頭就寫了：

> *所有函數都是 Pure Functions：給定相同的輸入就會產生相同的輸出，沒有任何副作用。*

這整個檔案裡的函式：
- 不存取資料庫
- 不呼叫 API
- 不修改全域變數
- 不讀取 \`Date.now()\` 或 \`Math.random()\`

所以它們非常容易測試和維護。你改了一個公式，跑一下測試就知道有沒有壞掉。

\`\`\`javascript
// calculator.js 裡的 classifyRisk 就是典型的純函式
function classifyRisk(days) {
  if (days < RISK_THRESHOLDS.CRITICAL_DAYS) return 'critical';
  if (days < RISK_THRESHOLDS.WARNING_DAYS) return 'warning';
  return 'ok';
}
// RISK_THRESHOLDS 是常數，不會被修改，所以仍然是純函式
\`\`\`

### 進階：常數引用算不算不純？

你可能會問：\`classifyRisk\` 讀了外部的 \`RISK_THRESHOLDS\`，算不算不純？

答案：如果那個外部值是**不會改變的常數**（用 \`const\` 宣告、永遠不被修改），那它在語意上等同於直接寫死在函式裡，仍然算純函式。真正的問題是**可變的**外部狀態。

> **練習（對應挑戰 1）：** 判斷以下哪些是純函式：
> 1. \`(a, b) => a + b\`
> 2. \`(arr) => { arr.push(1); return arr; }\`
> 3. \`(x) => Math.random() * x\`
> 4. \`(items) => items.filter(i => i > 0)\`
>
> 提示：\`push\` 會修改原陣列，\`filter\` 會回傳新陣列。

> **練習（對應挑戰 2）：** 把一個依賴外部變數的函式改成純函式——讓外部依賴變成參數：
> \`\`\`javascript
> // 不純的版本
> let taxRate = 0.05;
> function calculateTax(price) {
>   return price * taxRate; // 依賴外部 taxRate
> }
>
> // 改成純函式：
> function calculateTax(price, taxRate) {
>   return price * taxRate; // taxRate 從參數傳入
> }
> \`\`\`

---

## 2-2：輸入驗證（Input Validation）

### 為什麼要驗證？

JavaScript 是一個「寬容到危險」的語言。很多錯誤不會報錯，只會給你一個荒謬的結果：

\`\`\`javascript
function divide(a, b) {
  return a / b;
}

divide(10, 0);       // Infinity（不是你想要的）
divide(10, "hello"); // NaN（壞掉的數字，但不報錯！）
divide(null, 5);     // 0（null 被轉成 0）
divide(undefined, 5); // NaN
divide("10", "2");   // 5（字串居然可以除？JavaScript 幫你轉了）
\`\`\`

程式不報錯但結果是錯的——這是最危險的情況。想像你的庫存計算結果是 NaN，然後它被存到資料庫裡。等你發現問題的時候，可能已經過了三天。

**原則：寧可報錯也不要給錯的結果。**

### typeof 和 isNaN 的搭配使用

\`\`\`javascript
typeof 42         // 'number'
typeof 'hello'    // 'string'
typeof true       // 'boolean'
typeof undefined  // 'undefined'
typeof null       // 'object'（歷史遺留的 bug！）
typeof NaN        // 'number'（NaN 的 typeof 居然是 number！）
typeof []         // 'object'
typeof {}         // 'object'

isNaN(NaN)        // true
isNaN(42)         // false
isNaN('hello')    // true（會先嘗試轉換成數字）

Number.isNaN(NaN)     // true（更嚴格，推薦）
Number.isNaN('hello') // false（不會自動轉換）
\`\`\`

所以檢查一個值「是不是有效的數字」需要**兩個條件一起**：

\`\`\`javascript
// typeof !== 'number' → 排除字串、布林、null、undefined 等
// isNaN(x) → 排除 NaN（NaN 的 typeof 是 'number' 但它不是有效的數字）
function isValidNumber(x) {
  return typeof x === 'number' && !isNaN(x);
}

isValidNumber(42);        // true
isValidNumber(0);         // true
isValidNumber(-3.14);     // true
isValidNumber(NaN);       // false
isValidNumber('42');      // false
isValidNumber(undefined); // false
\`\`\`

### 真實專案：calculator.js 的驗證策略

\`\`\`javascript
// calculator.js 這樣做驗證
// 1. 檢查型別 + NaN
if (typeof currentStock !== 'number' || isNaN(currentStock)) {
  throw new Error('currentStock must be a valid number');
}

// 2. 檢查業務邏輯範圍
if (dailyDemand < 0) {
  throw new Error('dailyDemand cannot be negative');
}
\`\`\`

注意它用了 \`throw new Error(...)\`——直接丟出錯誤，程式中斷。這是因為型別錯誤是**程式設計錯誤**，不是使用者的錯，應該在開發階段就被發現。

### 驗證結果的兩種風格

| 風格 | 做法 | 適合場景 |
|------|------|---------|
| throw Error | 丟出錯誤，程式中斷 | 程式設計錯誤（傳錯型別） |
| 回傳錯誤物件 | \`{ error: '...', result: null }\` | 可預期的失敗（除以零、查無資料） |
| 預設值 | \`safetyStock = 0\` | 可以合理猜測的參數 |
| 靜默修正 | \`if (x < 0) x = 0\` | 不影響正確性的修正 |

在你的挑戰裡，\`safeDivide\` 就是用「回傳錯誤物件」的風格：

\`\`\`javascript
// 回傳物件而不是 throw，讓呼叫者可以優雅地處理錯誤
function safeDivide(a, b) {
  if (typeof a !== 'number' || isNaN(a) || typeof b !== 'number' || isNaN(b)) {
    return { error: 'invalid input', result: null };
  }
  if (b === 0) {
    return { error: 'division by zero', result: null };
  }
  return { error: null, result: a / b };
}

// 使用時：
const r = safeDivide(10, 0);
if (r.error) {
  console.log('出錯了：' + r.error);
} else {
  console.log('結果：' + r.result);
}
\`\`\`

### 常見錯誤

\`\`\`javascript
// ❌ 只檢查 typeof，漏掉 NaN
if (typeof x !== 'number') throw new Error('not a number');
// NaN 會通過這個檢查！

// ❌ 只檢查 isNaN，漏掉非數字型別
if (isNaN(x)) throw new Error('not a number');
// isNaN('hello') 是 true，但 isNaN(null) 是 false！
// null 被自動轉成 0，所以 isNaN(null) === false

// ✅ 兩個條件都要
if (typeof x !== 'number' || isNaN(x)) throw new Error('not a number');
\`\`\`

> **練習（對應挑戰 1）：** 寫 \`calculateDiscount(price, rate)\`，驗證 price 是正數、rate 在 0-1 之間。
>
> **練習（對應挑戰 2）：** 寫 \`safeDivide(a, b)\`，回傳 \`{ error, result }\` 物件而不是 throw。

---

## 2-3：邊界情況（Edge Cases）

### 什麼是邊界情況？

「不尋常但有可能發生」的輸入。正常情況只是冰山一角——水面下藏著各種奇怪的輸入。

想像你寫了一個計算庫存天數的函式。正常情況下，庫存 500、日需求 50，答案是 10 天。但現實世界會丟給你各種驚喜：

\`\`\`
正常情況：
  calculateDays(500, 50) → 10 天 ✅

邊界情況：
  calculateDays(0, 50)    → 0 天（庫存是零）
  calculateDays(-10, 50)  → ？（負庫存？退貨太多？）
  calculateDays(500, 0)   → ？（沒有需求？除以零！）
  calculateDays(500, -5)  → ？（負需求？客戶在退貨？）
  calculateDays(NaN, 50)  → ？（壞掉的輸入）
  calculateDays(50, 50)   → 1 天（剛好用完，明天就斷貨）
  calculateDays(Infinity, 50) → ？（無限庫存？系統錯誤？）
\`\`\`

### 邊界情況清單（通用）

| 類型 | 例子 | 你應該做什麼 |
|------|------|-------------|
| 零 | \`0\`, \`""\`, \`[]\` | 除以零？空陣列跑 reduce？ |
| 負數 | \`-1\`, \`-0.5\` | 業務上有意義嗎？ |
| 極大值 | \`Infinity\`, \`Number.MAX_SAFE_INTEGER\` | 會溢出嗎？ |
| 空值 | \`null\`, \`undefined\` | 忘了傳參數？ |
| 錯誤型別 | \`"abc"\`, \`true\`, \`{}\` | 型別檢查 |
| 邊界值 | 剛好等於門檻 | \`<\` vs \`<=\`，差一個bug |
| 特殊浮點數 | \`0.1 + 0.2 !== 0.3\` | 浮點數精度問題 |

### 真實專案：calculator.js 怎麼處理

\`\`\`javascript
// 負庫存 → 當作 0，已經沒貨了
if (currentStock < 0) return { days: 0, status: 'critical' };

// 庫存低於安全水位 → 也是 0
if (currentStock < safetyStock) return { days: 0, status: 'critical' };

// 零或負需求 → 永遠不會用完
if (dailyDemand <= 0) return { days: Infinity, status: 'ok' };
\`\`\`

注意它的**處理順序**很重要：先處理負庫存，再處理安全水位，最後處理零需求。如果順序反了，可能會漏掉某些情況。

### clamp 函式：一個經典的邊界處理範例

\`clamp\` 把一個值限制在 min 和 max 之間。看起來簡單，但有一個陷阱：

\`\`\`javascript
// 基本版
function clamp(value, min, max) {
  return Math.max(min, Math.min(max, value));
}

clamp(15, 0, 10);  // 10（超過上限，壓回來）
clamp(-5, 0, 10);  // 0（低於下限，拉上來）
clamp(5, 0, 10);   // 5（在範圍內，不動）

// 但是如果 min > max 呢？
clamp(5, 10, 0);   // ？這個行為是未定義的！
\`\`\`

健壯的版本應該處理 \`min > max\` 的情況：

\`\`\`javascript
function clamp(value, min, max) {
  if (min > max) {
    // 方法 1：交換
    [min, max] = [max, min];
    // 方法 2：丟錯誤
    // throw new Error('min must be <= max');
  }
  return Math.max(min, Math.min(max, value));
}
\`\`\`

### safeDivide：完整的邊界處理

挑戰裡你會遇到的 \`safeDivide\` 要處理：

\`\`\`javascript
function safeDivide(a, b) {
  // 邊界 1：型別檢查（NaN、字串、布林...）
  if (typeof a !== 'number' || isNaN(a)) return { error: 'invalid input', result: null };
  if (typeof b !== 'number' || isNaN(b)) return { error: 'invalid input', result: null };

  // 邊界 2：除以零
  if (b === 0) return { error: 'division by zero', result: null };

  // 正常路徑
  return { error: null, result: a / b };
}
\`\`\`

### 用「列表法」系統性地找邊界

寫任何函式之前，先列出一張表：

| 輸入 | 預期結果 | 為什麼 |
|------|---------|--------|
| \`(100, 10, 0)\` | \`{ days: 10 }\` | 正常情況 |
| \`(-5, 10, 0)\` | \`{ days: 0 }\` | 負庫存當作零 |
| \`(100, 0, 0)\` | \`{ days: Infinity }\` | 沒有需求 |
| \`(NaN, 10, 0)\` | \`{ error: "invalid" }\` | 無效輸入 |
| \`(50, 10, 100)\` | \`{ days: 0 }\` | 安全庫存比現有庫存多 |

這張表後面就是你的測試案例。

> **練習（對應挑戰）：** 寫 \`robustStockDays(stock, demand, safety = 0)\`，處理所有上面列的邊界情況。

---

## 2-4：函式組合（Function Composition）

### 小函式 → 大函式

函式組合的核心思想：**每個函式只做一件事，然後像積木一樣拼起來。**

\`\`\`javascript
// 三個小函式，各做一件事
function calculateDays(stock, demand) {
  return demand <= 0 ? Infinity : stock / demand;
}

function classifyRisk(days) {
  if (days < 7) return 'critical';
  if (days < 14) return 'warning';
  return 'safe';
}

function formatResult(days, risk) {
  return { daysRemaining: Math.round(days), risk };
}

// 一個大函式把它們串起來
function assessItem(item) {
  const days = calculateDays(item.currentStock, item.dailyDemand);
  const risk = classifyRisk(days);
  return formatResult(days, risk);
}
\`\`\`

好處：
- 每個小函式都可以**單獨測試**（不需要準備整個庫存物件）
- 改一個算法**不影響**其他部分（改風險門檻只動 classifyRisk）
- 讀起來像自然語言：「算天數、分級風險、格式化結果」

### 管線模式（Pipeline）

管線就是一連串的轉換，前一步的輸出是下一步的輸入。在 JavaScript 裡，陣列方法天然就是管線：

\`\`\`javascript
// 把多個轉換串在一起
const result = inventory
  .filter(item => item.dailyDemand > 0)              // 1. 過濾掉零需求
  .map(item => ({                                      // 2. 計算天數
    ...item,
    daysRemaining: item.currentStock / item.dailyDemand,
  }))
  .map(item => ({                                      // 3. 分類風險
    ...item,
    risk: item.daysRemaining < 7 ? 'critical'
        : item.daysRemaining < 14 ? 'warning'
        : 'safe',
  }))
  .filter(item => item.risk !== 'safe')               // 4. 只要有風險的
  .sort((a, b) => a.daysRemaining - b.daysRemaining); // 5. 按天數排序
\`\`\`

每一步都是一個純函式轉換，結果流向下一步。

### 自己寫一個 pipe 函式

pipe 是函式組合的通用工具——它接收多個函式，回傳一個新函式，依序執行：

\`\`\`javascript
function pipe(...fns) {
  return function(input) {
    let result = input;
    for (const fn of fns) {
      result = fn(result);
    }
    return result;
  };
}

// 使用
const double = x => x * 2;
const addTen = x => x + 10;
const toString = x => '結果：' + x;

const transform = pipe(double, addTen, toString);
transform(5); // '結果：20'  (5 → 10 → 20 → '結果：20')
\`\`\`

### 真實專案：calculator.js 的組合模式

\`\`\`javascript
// calculateInventoryRisk 就是把三個小函式組合起來
export function calculateInventoryRisk(position) {
  const { currentStock, safetyStock, dailyDemand, leadTimeDays, demandVolatility } = position;

  // 第一層：算天數
  const stockout = calculateDaysToStockout(currentStock, dailyDemand, safetyStock);
  // 第二層：算機率
  const probability = calculateStockoutProbability(stockout.days, leadTimeDays, demandVolatility);
  // 第三層：算緊迫度
  const urgency = calculateUrgencyScore(stockout.days);

  return { daysToStockout: stockout.days, probability, urgencyScore: urgency };
}
\`\`\`

每一層都可以單獨測試，改一個不影響其他。

### processInventory：你的挑戰預覽

挑戰會要求你寫一個 \`processInventory(items)\` 管線，包含 filter → map → map → sort。用上面學到的技巧：

\`\`\`javascript
function processInventory(items) {
  return items
    .filter(item => item.dailyDemand > 0)        // 過濾
    .map(item => ({                                // 計算天數
      ...item,
      daysRemaining: item.currentStock / item.dailyDemand,
    }))
    .map(item => ({                                // 加上風險分級
      ...item,
      risk: item.daysRemaining < 7 ? 'critical'
          : item.daysRemaining < 14 ? 'warning'
          : 'safe',
    }))
    .sort((a, b) => a.daysRemaining - b.daysRemaining);
}
\`\`\`

> **練習（對應挑戰）：** 自己寫 \`processInventory\`，處理空陣列和零需求的情況。

---

## 2-5：自動化測試

### 為什麼要寫測試？

你改了一個函式，怎麼確定沒有把別的東西弄壞？答案：跑測試。

手動測試的問題：
1. **慢** — 每次改完都要手動跑一遍
2. **容易漏** — 你只測了正常情況，忘了測邊界
3. **不可靠** — 你覺得「看起來對了」但其實漏了一個小數點

自動化測試的好處：一秒鐘跑完 100 個測試，每一個邊界情況都不會漏。

### 從零開始寫一個 assertEqual

不需要框架，最簡單的測試就是比較「實際值」和「期望值」：

\`\`\`javascript
function assertEqual(actual, expected) {
  // 用 JSON.stringify 比較，這樣可以比較物件和陣列
  return JSON.stringify(actual) === JSON.stringify(expected);
}

// 測試你的函式
assertEqual(1 + 1, 2);              // true
assertEqual('hello', 'hello');       // true
assertEqual({a: 1}, {a: 1});         // true（物件也能比！）
assertEqual([1, 2], [1, 2]);         // true
assertEqual({a: 1}, {a: 2});         // false
\`\`\`

**為什麼要用 JSON.stringify？**

\`\`\`javascript
// JavaScript 的物件比較是比「記憶體位置」，不是比「內容」
{a: 1} === {a: 1}  // false！兩個不同的物件
[1, 2] === [1, 2]  // false！

// JSON.stringify 把物件變成字串，就可以比內容了
JSON.stringify({a: 1}) === JSON.stringify({a: 1})  // true
// '{"a":1}' === '{"a":1}'
\`\`\`

**JSON.stringify 的限制（要知道的坑）：**

\`\`\`javascript
// 順序不同 → 結果不同
JSON.stringify({a: 1, b: 2}) // '{"a":1,"b":2}'
JSON.stringify({b: 2, a: 1}) // '{"b":2,"a":1}'  ← 不一樣！

// undefined 會被忽略
JSON.stringify({a: undefined}) // '{}'

// NaN 和 Infinity 會變成 null
JSON.stringify(NaN)       // 'null'
JSON.stringify(Infinity)  // 'null'
\`\`\`

對於大多數測試情境，JSON.stringify 夠用了。知道這些限制，碰到的時候不會困惑就好。

### 進階：createTestSuite

把多個測試包成一個套件，一次跑完：

\`\`\`javascript
function createTestSuite(name) {
  const tests = [];

  return {
    // 新增一個測試
    addTest(testName, fn) {
      tests.push({ name: testName, fn });
    },
    // 跑所有測試
    run() {
      let passed = 0;
      let failed = 0;
      const results = [];

      for (const test of tests) {
        try {
          const result = test.fn();
          if (result) {
            passed++;
            results.push({ name: test.name, status: 'pass' });
          } else {
            failed++;
            results.push({ name: test.name, status: 'fail' });
          }
        } catch (e) {
          failed++;
          results.push({ name: test.name, status: 'error', error: e.message });
        }
      }

      return { name, passed, failed, total: tests.length, results };
    },
  };
}

// 使用
const suite = createTestSuite('classifyRisk 測試');
suite.addTest('3天 = critical', () => assertEqual(classifyRisk(3), 'critical'));
suite.addTest('10天 = warning', () => assertEqual(classifyRisk(10), 'warning'));
suite.addTest('20天 = safe', () => assertEqual(classifyRisk(20), 'safe'));
suite.addTest('0天 = critical', () => assertEqual(classifyRisk(0), 'critical'));
suite.addTest('7天 = warning', () => assertEqual(classifyRisk(7), 'warning')); // 邊界！
suite.addTest('14天 = safe', () => assertEqual(classifyRisk(14), 'safe'));     // 邊界！

const report = suite.run();
// { name: 'classifyRisk 測試', passed: 6, failed: 0, total: 6, results: [...] }
\`\`\`

### 測試案例怎麼想？五大類型

| 類型 | 說明 | 例子 |
|------|------|------|
| 正常路徑 | 最常見的使用情況 | \`classifyRisk(3)\` → critical |
| 邊界值 | 剛好在門檻上 | \`classifyRisk(7)\` → 7 是 critical 還是 warning？ |
| 邊界情況 | 零、負數、空值 | \`classifyRisk(0)\`、\`classifyRisk(-1)\` |
| 錯誤情況 | 應該報錯的輸入 | \`calculateDiscount(-10, 0.5)\` 應該 throw |
| 組合情況 | 多個參數的特殊組合 | \`robustStockDays(50, 10, 100)\` 安全庫存 > 現有庫存 |

### 真實專案：calculator.test.js

\`\`\`javascript
// 專案裡的測試格式（Jest 框架）
describe('calculateDaysToStockout', () => {
  it('正常情況', () => {
    expect(calculateDaysToStockout(100, 10)).toEqual({
      days: 10, status: 'warning'
    });
  });

  it('零需求', () => {
    expect(calculateDaysToStockout(100, 0)).toEqual({
      days: Infinity, status: 'ok'
    });
  });

  it('負庫存', () => {
    expect(calculateDaysToStockout(-5, 10)).toEqual({
      days: 0, status: 'critical'
    });
  });
});
\`\`\`

你的挑戰裡會自己寫 \`assertEqual\`，它就是 \`expect(...).toEqual(...)\` 的簡化版。

> **練習（對應挑戰）：** 實作 \`assertEqual(actual, expected)\`，用 JSON.stringify 比較，回傳 true/false。然後用它測試 \`add(a, b)\`。

---

## 2-6（Boss）：BOM 遞迴展開

### 什麼是 BOM？

BOM = Bill of Materials = 物料清單。它描述「一個成品需要哪些零件，每個零件又需要哪些子零件」。

\`\`\`
腳踏車 (1台)
├── 車架 (1個)
│   ├── 鋼管 (3根)
│   └── 焊接件 (6個)
├── 前輪 (1個)
│   ├── 輪圈 (1個)
│   └── 輪胎 (1個)
└── 後輪 (1個)
    ├── 輪圈 (1個)
    └── 輪胎 (1個)
\`\`\`

**BOM Explosion** = 把這棵樹攤平，算出每個零件總共需要多少。

一台腳踏車需要：鋼管 3 根、焊接件 6 個、輪圈 2 個、輪胎 2 個。

### 回顧遞迴三要素

1. **終止條件（Base Case）** — 什麼時候停下來？沒有子件的時候。
2. **縮小問題** — 每次遞迴都要往下一層。
3. **安全機制** — 最大深度、循環偵測。

先複習簡單的遞迴——階乘：

\`\`\`javascript
function factorial(n) {
  if (n <= 1) return 1;        // 終止條件
  return n * factorial(n - 1); // 遞迴：問題縮小
}
// factorial(5) → 5 * factorial(4) → 5 * 4 * factorial(3) → ... → 120
\`\`\`

BOM 展開也是遞迴：「腳踏車需要什麼？」→ 看子件 → 每個子件再問「它需要什麼？」→ 直到沒有子件。

### 資料結構：bomTable

\`\`\`javascript
// bomTable 是一個陣列，每一行是「父件 → 子件」的關係
const bomTable = [
  { parent: 'bike',  child: 'frame', qtyPer: 1 },
  { parent: 'bike',  child: 'wheel', qtyPer: 2 },
  { parent: 'frame', child: 'tube',  qtyPer: 3 },
  { parent: 'wheel', child: 'rim',   qtyPer: 1 },
  { parent: 'wheel', child: 'tire',  qtyPer: 1 },
];

// 1 台 bike → 1 個 frame + 2 個 wheel
// 1 個 frame → 3 根 tube
// 1 個 wheel → 1 個 rim + 1 個 tire
//
// 展開 1 台 bike：
//   tube: 1 * 1 * 3 = 3
//   rim:  1 * 2 * 1 = 2
//   tire: 1 * 2 * 1 = 2
\`\`\`

### 基本實作思路

\`\`\`javascript
function explodeBOM(item, qty, bomTable, depth = 0, visited = new Set()) {
  const result = new Map();

  // 1. 安全機制：最大深度
  if (depth > 10) throw new Error('max depth');

  // 2. 安全機制：循環偵測
  if (visited.has(item)) throw new Error('circular');
  visited.add(item);

  // 3. 找子件
  const children = bomTable.filter(row => row.parent === item);

  // 4. 終止條件：沒有子件 → 這就是最底層的原料
  if (children.length === 0) {
    result.set(item, qty);
    return result;
  }

  // 5. 遞迴展開每個子件
  for (const child of children) {
    const childQty = qty * child.qtyPer;
    const sub = explodeBOM(
      child.child,
      childQty,
      bomTable,
      depth + 1,
      new Set(visited)  // 重要：每個分支用自己的副本！
    );

    // 合併結果
    for (const [material, amount] of sub) {
      result.set(material, (result.get(material) || 0) + amount);
    }
  }

  return result;
}
\`\`\`

### 關鍵概念 1：為什麼 \`new Set(visited)\` 而不是直接用 \`visited\`？

因為 BOM 是一棵**樹**，不是一條線。同一個零件可以出現在不同的分支裡。

\`\`\`
腳踏車
├── 前輪
│   └── 輪圈 ← 這裡用到輪圈
└── 後輪
    └── 輪圈 ← 這裡也用到，不是循環！
\`\`\`

如果共享同一個 \`visited\` Set，前輪展開時加了「輪圈」，後輪展開時就會誤判為循環。**每個分支要用自己的副本**，只追蹤「從根到目前節點」的路徑。

真正的循環是：A 需要 B，B 需要 C，C 又需要 A。這時候路徑上 A 出現了兩次。

### 關鍵概念 2：報廢率（Scrap Rate）

在真實製造業裡，零件有報廢率。比如 5% 的螺絲在組裝時會壞掉，所以需求量要乘以 \`(1 + scrap_rate)\`：

\`\`\`javascript
// bomCalculator.js 的做法
const needed = quantity * child.qty_per * (1 + (child.scrap_rate || 0));
// 如果需要 100 個螺絲，報廢率 5%，實際要準備 105 個
\`\`\`

### 關鍵概念 3：Map 的使用

用 \`Map\` 來合併結果：同一個零件可能出現在多個地方（前輪的輪圈 + 後輪的輪圈），需求量要累加。

\`\`\`javascript
// Map 基本操作
const m = new Map();
m.set('tube', 3);          // 設定
m.get('tube');              // 3
m.has('tube');              // true
m.get('bolt') || 0;        // 0（不存在時用預設值）

// 累加技巧
m.set('tube', (m.get('tube') || 0) + 3); // tube 變成 6
\`\`\`

### 真實專案：bomCalculator.js 的完整版

\`\`\`javascript
const MAX_BOM_DEPTH = 50;

function explodeBOM(parentMaterial, quantity, bomIndex, opts = {}) {
  const visited = opts._visited || new Set();
  const depth = opts._depth || 0;

  // 安全機制 1：最大深度
  if (depth > MAX_BOM_DEPTH) {
    return { error: 'MAX_DEPTH_EXCEEDED', materials: [] };
  }
  // 安全機制 2：循環偵測
  if (visited.has(parentMaterial)) {
    return { error: 'CIRCULAR_REFERENCE', materials: [] };
  }
  visited.add(parentMaterial);

  const children = bomIndex[parentMaterial] || [];
  let results = [];
  for (const child of children) {
    const needed = quantity * child.qty_per * (1 + (child.scrap_rate || 0));
    results.push({ material: child.child_material, quantity: needed, depth });

    const sub = explodeBOM(child.child_material, needed, bomIndex, {
      _visited: new Set(visited), // 每個分支用自己的 visited 副本
      _depth: depth + 1,
    });
    if (sub.error) return sub;
    results = results.concat(sub.materials);
  }
  return { error: null, materials: results };
}
\`\`\`

注意專案版本和挑戰版本的差異：
- 專案用 \`bomIndex\`（物件，key 是父件名稱），挑戰用 \`bomTable\`（陣列，用 filter 找子件）
- 專案回傳 \`{ error, materials }\`，挑戰回傳 \`Map\`
- 專案包含 scrap_rate，挑戰簡化版可能不含

### 手動追蹤：explodeBOM('bike', 1, bomTable)

\`\`\`
第 1 層：item='bike', qty=1
  子件：frame(x1), wheel(x2)

  → explodeBOM('frame', 1)
      子件：tube(x3)
      → explodeBOM('tube', 3)
          沒有子件 → 回傳 Map { tube: 3 }
      ← 結果：Map { tube: 3 }

  → explodeBOM('wheel', 2)
      子件：rim(x1), tire(x1)
      → explodeBOM('rim', 2)
          沒有子件 → 回傳 Map { rim: 2 }
      → explodeBOM('tire', 2)
          沒有子件 → 回傳 Map { tire: 2 }
      ← 結果：Map { rim: 2, tire: 2 }

最終結果：Map { tube: 3, rim: 2, tire: 2 }
\`\`\`

### 常見錯誤

| 錯誤 | 後果 | 修正 |
|------|------|------|
| 忘記 \`new Set(visited)\` | 不同分支的同名零件被誤判為循環 | 每個遞迴分支都複製 Set |
| 忘記深度檢查 | 資料有循環時無限遞迴，瀏覽器當掉 | \`if (depth > MAX) throw\` |
| 合併 Map 時覆蓋而不是累加 | 輪圈只算到 1 個而不是 2 個 | 用 \`(m.get(k) || 0) + amount\` |
| 把中間件也計入結果 | frame 和 wheel 被算進去，但它們不是原料 | 只在沒有子件時才 \`result.set\` |

> **Boss 挑戰：** 自己實作 \`explodeBOM(item, qty, bomTable)\`，回傳 Map，要能正確處理多層 BOM、循環偵測、深度限制。

---

## 附錄：World 2 概念速查表

| 概念 | 核心重點 | 對應挑戰 |
|------|---------|---------|
| 純函式 | 同輸入同輸出 + 無副作用 | 2-1：判斷純函式、改成純函式 |
| 輸入驗證 | \`typeof\` + \`isNaN\` 雙重檢查 | 2-2：validateInput、safeDivide |
| 邊界情況 | 零、負、NaN、Infinity、型別錯誤 | 2-3：robustStockDays |
| 函式組合 | 小函式串成管線 | 2-4：processInventory 管線 |
| 自動化測試 | assertEqual + JSON.stringify | 2-5：assertEqual、createTestSuite |
| BOM 遞迴 | 終止條件 + 縮小問題 + 安全機制 | 2-6：explodeBOM + 循環偵測 |
`,wR=`
# World 3：SQL 地下城

> **目標：** 學會用 SQL 思維查詢、統計、修改資料，並用 JavaScript 實作這些操作
> **對應專案：** \`sql/\` 目錄裡的 72 個 migration 和 \`sample_data/\` 裡的 CSV
> **挑戰方式：** 本關的挑戰不會真的連資料庫——你會用 JavaScript 函式模擬 SQL 操作，處理陣列資料

---

## 3-1：SELECT — 從資料庫讀資料

### 什麼是 SQL？

SQL = Structured Query Language = 結構化查詢語言。

你的 DI 專案有一個 Supabase（PostgreSQL）資料庫，裡面存了庫存、需求、BOM、供應商等資料。SQL 就是你跟這個資料庫「對話」的語言。

### 你的第一個查詢

\`\`\`sql
-- 從 inventory_snapshots 表中取出所有資料
SELECT * FROM inventory_snapshots;
\`\`\`

- \`SELECT\` — 我要**讀取**資料
- \`*\` — 所有欄位
- \`FROM inventory_snapshots\` — 從哪張表

### 只取你要的欄位

\`\`\`sql
SELECT material_code, onhand_qty, safety_stock
FROM inventory_snapshots;
\`\`\`

在 SQL 中，指定欄位可以減少資料傳輸量，也讓結果更清楚。

### JavaScript 等價：selectColumns()

在本關的挑戰中，你會實作 \`selectColumns(table, columns)\` 函式。table 是一個物件陣列，columns 是你想保留的欄位名稱陣列：

\`\`\`javascript
function selectColumns(table, columns) {
  return table.map(row => {
    const newRow = {};
    for (const col of columns) {
      newRow[col] = row[col];
    }
    return newRow;
  });
}
\`\`\`

**核心概念：** \`.map()\` 就像 SQL 的 SELECT——它對每一筆資料做轉換，回傳新陣列。

#### 用 DI 專案資料示範

\`\`\`javascript
const inventory_snapshots = [
  { material_code: 'FG-001', plant_id: 'P01', snapshot_date: '2025-07-01', onhand_qty: 500, allocated_qty: 50, safety_stock: 100 },
  { material_code: 'COMP-001', plant_id: 'P01', snapshot_date: '2025-07-01', onhand_qty: 1200, allocated_qty: 200, safety_stock: 300 },
  { material_code: 'COMP-002', plant_id: 'P01', snapshot_date: '2025-07-01', onhand_qty: 80, allocated_qty: 10, safety_stock: 150 },
];

selectColumns(inventory_snapshots, ['material_code', 'onhand_qty']);
// [
//   { material_code: 'FG-001', onhand_qty: 500 },
//   { material_code: 'COMP-001', onhand_qty: 1200 },
//   { material_code: 'COMP-002', onhand_qty: 80 },
// ]
\`\`\`

### 你的 sample_data 長什麼樣

\`inventory_snapshots.csv\`（你專案裡真實的資料）：

| material_code | plant_id | snapshot_date | onhand_qty | allocated_qty | safety_stock |
|---------------|----------|---------------|------------|---------------|--------------|
| FG-001        | P01      | 2025-07-01    | 500        | 50            | 100          |
| COMP-001      | P01      | 2025-07-01    | 1200       | 200           | 300          |
| COMP-002      | P01      | 2025-07-01    | 80         | 10            | 150          |

\`fg_financials.csv\`：

| material_code | unit_price | currency | cost_center |
|---------------|------------|----------|-------------|
| FG-001        | 250.00     | USD      | CC-100      |
| FG-002        | 180.00     | USD      | CC-100      |
| FG-003        | 320.00     | USD      | CC-200      |

### 排序：ORDER BY

\`\`\`sql
-- 按庫存量由小到大排
SELECT material_code, onhand_qty
FROM inventory_snapshots
ORDER BY onhand_qty ASC;

-- 由大到小
ORDER BY onhand_qty DESC;
\`\`\`

- \`ASC\` = ascending（升序，預設）
- \`DESC\` = descending（降序）

### JavaScript 等價：orderBy()

你會實作 \`orderBy(table, field, direction)\`：

\`\`\`javascript
function orderBy(table, field, direction = 'asc') {
  // 重要：用展開運算子複製陣列，不改動原始資料
  return [...table].sort((a, b) => {
    if (a[field] < b[field]) return direction === 'asc' ? -1 : 1;
    if (a[field] > b[field]) return direction === 'asc' ? 1 : -1;
    return 0;
  });
}
\`\`\`

**注意：** \`[...table]\` 先複製一份再排序。直接用 \`.sort()\` 會改動原始陣列——在 SQL 的世界裡，SELECT 不會修改原始資料，我們的函式也應該如此。

#### 排序示範

\`\`\`javascript
const sorted = orderBy(inventory_snapshots, 'onhand_qty', 'asc');
// [
//   { material_code: 'COMP-002', onhand_qty: 80, ... },
//   { material_code: 'FG-001', onhand_qty: 500, ... },
//   { material_code: 'COMP-001', onhand_qty: 1200, ... },
// ]
\`\`\`

### 限制筆數：LIMIT

\`\`\`sql
SELECT * FROM inventory_snapshots LIMIT 5;
\`\`\`

JavaScript 等價非常簡單：\`.slice(0, n)\`。

### 練習

1. 用 \`selectColumns\` 取出 inventory_snapshots 的 \`material_code\` 和 \`onhand_qty\`
2. 用 \`orderBy\` 按 \`onhand_qty\` 升序排列
3. 用 \`.slice(0, 3)\` 取前 3 筆

> **提示：** 可以把這些操作串起來：\`orderBy(selectColumns(table, cols), field, dir).slice(0, 3)\`

---

## 3-2：WHERE + JOIN — 過濾與合併

### WHERE — 過濾條件

SQL 用 \`WHERE\` 過濾資料：

\`\`\`sql
-- 庫存低於安全庫存的品項
SELECT material_code, onhand_qty, safety_stock
FROM inventory_snapshots
WHERE onhand_qty < safety_stock;

-- 多個條件
SELECT *
FROM inventory_snapshots
WHERE plant_id = 'P01'
  AND onhand_qty < 200;
\`\`\`

**比較運算子速查：**

| SQL | 意思 | 例子 |
|-----|------|------|
| \`=\` | 等於 | \`plant_id = 'P01'\` |
| \`<>\` 或 \`!=\` | 不等於 | \`status <> 'closed'\` |
| \`<\`, \`>\`, \`<=\`, \`>=\` | 比較 | \`onhand_qty > 100\` |
| \`BETWEEN\` | 範圍 | \`qty BETWEEN 10 AND 100\` |
| \`IN\` | 在清單中 | \`code IN ('COMP-001', 'COMP-002')\` |
| \`LIKE\` | 模糊比對 | \`code LIKE 'COMP%'\` |
| \`IS NULL\` | 是空值 | \`notes IS NULL\` |

### JavaScript 等價：where()

你會實作 \`where(table, conditions)\`，conditions 是一個物件，每個 key-value 代表一個「等於」條件：

\`\`\`javascript
function where(table, conditions) {
  return table.filter(row => {
    return Object.entries(conditions).every(([key, value]) => {
      return row[key] === value;
    });
  });
}
\`\`\`

**核心概念：**
- \`.filter()\` 就像 SQL 的 WHERE——只保留符合條件的資料列
- \`Object.entries()\` 把物件拆成 \`[key, value]\` 對
- \`.every()\` 確保**所有**條件都成立（等同 SQL 的 AND）

#### 過濾示範

\`\`\`javascript
const po_open_lines = [
  { po_number: 'PO-001', material_code: 'COMP-001', qty: 500, status: 'open', supplier_id: 'SUP-A' },
  { po_number: 'PO-002', material_code: 'COMP-002', qty: 200, status: 'open', supplier_id: 'SUP-B' },
  { po_number: 'PO-003', material_code: 'COMP-001', qty: 300, status: 'closed', supplier_id: 'SUP-A' },
];

where(po_open_lines, { status: 'open', supplier_id: 'SUP-A' });
// [ { po_number: 'PO-001', material_code: 'COMP-001', qty: 500, status: 'open', supplier_id: 'SUP-A' } ]
\`\`\`

### JOIN — 合併兩張表

你的資料分散在不同的表：庫存在 \`inventory_snapshots\`，價格在 \`fg_financials\`。要一起看就要用 JOIN。

\`\`\`sql
-- 查看每個品項的庫存和單價
SELECT
  i.material_code,
  i.onhand_qty,
  f.unit_price,
  i.onhand_qty * f.unit_price AS inventory_value
FROM inventory_snapshots i
JOIN fg_financials f ON i.material_code = f.material_code;
\`\`\`

- \`i\` 和 \`f\` 是**別名**（alias），用來簡寫表名
- \`ON\` 指定兩張表用什麼欄位配對
- \`AS inventory_value\` — 給計算結果取名字

### JOIN 的種類

| 種類 | 說明 | 結果 |
|------|------|------|
| \`INNER JOIN\` | 只取兩邊都有配對的 | 最常用，沒配到的丟掉 |
| \`LEFT JOIN\` | 左邊全部保留 | 右邊沒配到的填 NULL |
| \`RIGHT JOIN\` | 右邊全部保留 | 左邊沒配到的填 NULL |
| \`FULL JOIN\` | 兩邊都保留 | 沒配到的都填 NULL |

### JavaScript 等價：innerJoin()

你會實作 \`innerJoin(tableA, tableB, keyA, keyB)\`：

\`\`\`javascript
function innerJoin(tableA, tableB, keyA, keyB) {
  const result = [];
  for (const rowA of tableA) {
    for (const rowB of tableB) {
      if (rowA[keyA] === rowB[keyB]) {
        // 合併兩筆資料（如果欄位名衝突，tableB 會覆蓋 tableA）
        result.push({ ...rowA, ...rowB });
      }
    }
  }
  return result;
}
\`\`\`

**核心概念：**
- 雙層迴圈比對每一種組合——這就是 INNER JOIN 的本質
- \`{ ...rowA, ...rowB }\` 用展開運算子合併兩個物件
- 只有 \`rowA[keyA] === rowB[keyB]\` 的配對才會進入結果

#### 效能小知識

上面的寫法是 O(n×m)，資料量大時會很慢。實務上可以先用 Map 建索引：

\`\`\`javascript
function innerJoinOptimized(tableA, tableB, keyA, keyB) {
  const indexB = new Map();
  for (const rowB of tableB) {
    const key = rowB[keyB];
    if (!indexB.has(key)) indexB.set(key, []);
    indexB.get(key).push(rowB);
  }

  const result = [];
  for (const rowA of tableA) {
    const matches = indexB.get(rowA[keyA]) || [];
    for (const rowB of matches) {
      result.push({ ...rowA, ...rowB });
    }
  }
  return result;
}
\`\`\`

#### JOIN 示範

\`\`\`javascript
const joined = innerJoin(
  inventory_snapshots,
  fg_financials,
  'material_code', 'material_code'
);
// 只有 material_code 在兩張表都出現的資料會被保留
// 每筆結果同時擁有 onhand_qty 和 unit_price
\`\`\`

### BOM 表也能 JOIN

\`bom_edge.csv\` 記錄了成品與零件的關係：

| parent_code | child_code | qty_per | uom |
|-------------|------------|---------|-----|
| FG-001      | COMP-001   | 2       | EA  |
| FG-001      | COMP-002   | 1       | EA  |
| FG-002      | COMP-001   | 3       | EA  |

\`\`\`javascript
// 找出每個成品需要的零件和零件庫存
const bomWithStock = innerJoin(bom_edge, inventory_snapshots, 'child_code', 'material_code');
// 結果會同時有 parent_code, child_code, qty_per, onhand_qty 等欄位
\`\`\`

### 練習

1. 用 \`where\` 找出 \`po_open_lines\` 中 status 為 \`'open'\` 的採購單
2. 用 \`innerJoin\` 合併 \`inventory_snapshots\` 和 \`fg_financials\`（以 \`material_code\` 配對）
3. 串起來：先 join 再 where，找出庫存低於安全庫存**且**有價格資料的品項

> **提示：** \`where(innerJoin(invTable, finTable, 'material_code', 'material_code'), {})\` 然後在 where 裡面想辦法比較 onhand_qty 和 safety_stock。挑戰中的 conditions 物件支援簡單的等於比對。

---

## 3-3：GROUP BY + 聚合函式

### 聚合函式概覽

SQL 的聚合函式對一組資料做統計運算：

\`\`\`sql
SELECT SUM(onhand_qty) AS total_stock FROM inventory_snapshots;    -- 總和
SELECT AVG(onhand_qty) AS avg_stock FROM inventory_snapshots;      -- 平均
SELECT COUNT(*) AS item_count FROM inventory_snapshots;            -- 計數
SELECT MAX(onhand_qty) AS max_stock FROM inventory_snapshots;      -- 最大值
SELECT MIN(onhand_qty) AS min_stock FROM inventory_snapshots;      -- 最小值
\`\`\`

| 函式 | 用途 | 範例結果（以上面 3 筆資料）|
|------|------|--------------------------|
| \`SUM\` | 加總 | 500 + 1200 + 80 = 1780 |
| \`AVG\` | 平均 | 1780 / 3 ≈ 593.3 |
| \`COUNT\` | 計數 | 3 |
| \`MAX\` | 最大 | 1200 |
| \`MIN\` | 最小 | 80 |

### JavaScript 等價：aggregate()

你會實作 \`aggregate(table, field, op)\`：

\`\`\`javascript
function aggregate(table, field, op) {
  const values = table.map(row => row[field]);

  switch (op) {
    case 'sum':
      return values.reduce((acc, v) => acc + v, 0);
    case 'avg':
      return values.reduce((acc, v) => acc + v, 0) / values.length;
    case 'count':
      return values.length;
    case 'max':
      return Math.max(...values);
    case 'min':
      return Math.min(...values);
    default:
      throw new Error('Unknown operation: ' + op);
  }
}
\`\`\`

**核心概念：** \`.reduce()\` 是聚合的靈魂——它把陣列「折疊」成一個值。

#### 聚合示範

\`\`\`javascript
aggregate(inventory_snapshots, 'onhand_qty', 'sum');  // 1780
aggregate(inventory_snapshots, 'onhand_qty', 'avg');  // 593.33...
aggregate(inventory_snapshots, 'onhand_qty', 'max');  // 1200
\`\`\`

### GROUP BY — 分組統計

SQL 的 GROUP BY 先分組，再對每組做聚合：

\`\`\`sql
-- 每個工廠的總庫存
SELECT plant_id, SUM(onhand_qty) AS total_stock
FROM inventory_snapshots
GROUP BY plant_id;

-- 結果：
-- plant_id | total_stock
-- P01      | 1780
-- P02      | 2100
\`\`\`

### JavaScript 等價：groupBy()

你會實作 \`groupBy(table, field)\`，回傳一個 Map（或物件），key 是分組值，value 是該組的資料陣列：

\`\`\`javascript
function groupBy(table, field) {
  const groups = new Map();
  for (const row of table) {
    const key = row[field];
    if (!groups.has(key)) {
      groups.set(key, []);
    }
    groups.get(key).push(row);
  }
  return groups;
}
\`\`\`

也可以用 \`.reduce()\` 寫成一行：

\`\`\`javascript
function groupBy(table, field) {
  return table.reduce((groups, row) => {
    const key = row[field];
    if (!groups[key]) groups[key] = [];
    groups[key].push(row);
    return groups;
  }, {});
}
\`\`\`

#### 分組 + 聚合示範

\`\`\`javascript
const groups = groupBy(inventory_snapshots, 'plant_id');
// {
//   'P01': [ {material_code:'FG-001',...}, {material_code:'COMP-001',...}, ... ],
//   'P02': [ ... ]
// }

// 對每一組做聚合
const result = {};
for (const [plantId, rows] of Object.entries(groups)) {
  result[plantId] = aggregate(rows, 'onhand_qty', 'sum');
}
// { P01: 1780, P02: 2100 }
\`\`\`

### HAVING — 對分組結果過濾

\`\`\`sql
-- 只看總庫存低於 2000 的工廠
SELECT plant_id, SUM(onhand_qty) AS total_stock
FROM inventory_snapshots
GROUP BY plant_id
HAVING SUM(onhand_qty) < 2000;
\`\`\`

**WHERE vs HAVING：**
- \`WHERE\` 過濾**原始資料**（分組前）
- \`HAVING\` 過濾**統計後的結果**（分組後）

在 JavaScript 中，HAVING 就是對分組結果再做一次 filter：

\`\`\`javascript
Object.entries(result).filter(([_, total]) => total < 2000);
\`\`\`

### 實戰：用 demand_fg 統計需求

\`demand_fg.csv\` 記錄了成品的需求預測：

| material_code | period | demand_qty | customer_id |
|---------------|--------|------------|-------------|
| FG-001        | 2025-Q3 | 200       | CUST-A      |
| FG-001        | 2025-Q4 | 350       | CUST-B      |
| FG-002        | 2025-Q3 | 150       | CUST-A      |

\`\`\`javascript
// 每個成品的總需求量
const demandByProduct = groupBy(demand_fg, 'material_code');
for (const [code, rows] of Object.entries(demandByProduct)) {
  console.log(code, aggregate(rows, 'demand_qty', 'sum'));
}
// FG-001  550
// FG-002  150
\`\`\`

### 練習

1. 用 \`groupBy\` 按 \`plant_id\` 分組 inventory_snapshots
2. 對每一組用 \`aggregate\` 算出 \`onhand_qty\` 的 sum
3. 過濾出總庫存低於 2000 的工廠

> **挑戰提示：** 挑戰會要求你回傳 \`{ P01: 1780 }\` 這樣的物件。記得用 \`groupBy\` 拿到分組後，再用迴圈對每組做 \`aggregate\`。

---

## 3-4：INSERT + UPDATE — 寫入與修改

### INSERT — 新增資料

\`\`\`sql
INSERT INTO di_plan_audit_log (plan_id, action, actor, notes)
VALUES ('PLAN-001', 'approved', 'louis', '風險可接受');
\`\`\`

- \`INSERT INTO 表名 (欄位1, 欄位2, ...)\` 指定要填的欄位
- \`VALUES (...)\` 對應的值
- 沒指定的欄位會用預設值（如 \`id\` 可能是自動遞增）

### JavaScript 等價：insertRow()

你會實作 \`insertRow(table, row)\`——注意要**不修改原始陣列**（immutable 模式），並自動產生 id：

\`\`\`javascript
function insertRow(table, row) {
  // 找出目前最大的 id，新 id = maxId + 1
  const maxId = table.reduce((max, r) => Math.max(max, r.id || 0), 0);
  const newRow = { id: maxId + 1, ...row };

  // 回傳新陣列，不修改原始 table
  return [...table, newRow];
}
\`\`\`

**重點：不可變性（Immutability）**

在 React 和現代前端開發中，不修改原始資料是非常重要的原則。SQL 的 INSERT 會直接修改資料庫，但在 JavaScript 中我們偏好回傳新的陣列：

\`\`\`javascript
// ❌ 不好：直接修改原始陣列
table.push(newRow);

// ✅ 好：回傳新陣列
const newTable = [...table, newRow];
\`\`\`

#### insertRow 示範

\`\`\`javascript
const auditLog = [
  { id: 1, plan_id: 'PLAN-001', action: 'created', actor: 'system' },
  { id: 2, plan_id: 'PLAN-001', action: 'reviewed', actor: 'angela' },
];

const updated = insertRow(auditLog, {
  plan_id: 'PLAN-001',
  action: 'approved',
  actor: 'louis',
  notes: '風險可接受',
});
// updated 有 3 筆，新的那筆 id = 3
// auditLog 仍然只有 2 筆（不受影響）
\`\`\`

### UPDATE — 修改現有資料

\`\`\`sql
UPDATE inventory_snapshots
SET onhand_qty = 450, allocated_qty = 100
WHERE material_code = 'COMP-001' AND plant_id = 'P01';
\`\`\`

**重要：** \`UPDATE\` 不加 \`WHERE\` 會改掉**所有**資料！永遠記得加 WHERE。

### JavaScript 等價：updateRows()

你會實作 \`updateRows(table, condition, updates)\`——同樣不修改原始陣列：

\`\`\`javascript
function updateRows(table, condition, updates) {
  return table.map(row => {
    // 檢查這筆資料是否符合條件
    const matches = Object.entries(condition).every(
      ([key, value]) => row[key] === value
    );
    if (matches) {
      // 符合條件：回傳合併了 updates 的新物件
      return { ...row, ...updates };
    }
    // 不符合條件：原封不動回傳
    return row;
  });
}
\`\`\`

**核心概念：**
- \`.map()\` 走過每一筆資料
- 符合條件的用 \`{ ...row, ...updates }\` 建立新物件
- 不符合的直接回傳原物件（reference 不變，有利效能）

#### updateRows 示範

\`\`\`javascript
const newInventory = updateRows(
  inventory_snapshots,
  { material_code: 'COMP-001', plant_id: 'P01' },  // WHERE 條件
  { onhand_qty: 450, allocated_qty: 100 }            // SET 更新值
);
// COMP-001 的 onhand_qty 變成 450
// 其他資料不變
// 原始 inventory_snapshots 不受影響
\`\`\`

### DELETE 概念（補充）

\`\`\`sql
DELETE FROM di_plan_audit_log
WHERE plan_id = 'PLAN-001';
\`\`\`

JavaScript 等價就是 \`.filter()\` 取反：

\`\`\`javascript
const afterDelete = table.filter(row => row.plan_id !== 'PLAN-001');
\`\`\`

### 你的專案怎麼用

DI 專案裡，大部分寫入操作是透過 Supabase 的 JavaScript SDK：

\`\`\`javascript
// INSERT
const { data, error } = await supabase
  .from('di_plan_audit_log')
  .insert({ plan_id: 'PLAN-001', action: 'approved' });

// UPDATE
const { data, error } = await supabase
  .from('inventory_snapshots')
  .update({ onhand_qty: 450 })
  .eq('material_code', 'COMP-001');
\`\`\`

底層跑的就是 SQL INSERT / UPDATE，但 Supabase SDK 幫你處理了安全性和權限。

### 練習

1. 用 \`insertRow\` 新增一筆審核紀錄：\`{ plan_id: 'PLAN-002', action: 'flagged', actor: 'system', notes: '庫存低於安全水位' }\`
2. 用 \`updateRows\` 把 COMP-002 的 \`onhand_qty\` 改成 200
3. 驗證原始陣列沒有被修改

> **挑戰提示：** 挑戰會測試你的函式是否真的不修改原始陣列。用 \`===\` 比較原始 table 和回傳值，它們應該是不同的 reference。

---

## 3-5：RPC 函式 + 子查詢

### 子查詢（Subquery）

SQL 允許查詢裡面套查詢：

\`\`\`sql
-- 找出庫存低於「平均安全庫存」的品項
SELECT material_code, onhand_qty
FROM inventory_snapshots
WHERE onhand_qty < (
  SELECT AVG(safety_stock) FROM inventory_snapshots
);
\`\`\`

子查詢先算出平均安全庫存（例如 183），外層再用這個值做過濾。

### CTE（Common Table Expression）

\`\`\`sql
WITH stock_days AS (
  SELECT
    material_code,
    onhand_qty,
    daily_demand,
    CASE WHEN daily_demand > 0
      THEN onhand_qty / daily_demand
      ELSE 9999
    END AS days_remaining
  FROM inventory_with_demand
)
SELECT * FROM stock_days WHERE days_remaining < 7;
\`\`\`

\`WITH ... AS\` 先建一個「暫存表」，後面的查詢可以引用它。你的專案 SQL 裡很多用 CTE。

### 什麼是 RPC？

RPC = Remote Procedure Call = 遠端程序呼叫。

概念很簡單：**把一段邏輯封裝成函式，用名稱呼叫它**。在 Supabase 中，你可以把複雜的 SQL 邏輯寫成 PostgreSQL 函式，前端只要呼叫函式名稱和傳參數：

\`\`\`sql
-- 在資料庫定義一個函式
CREATE OR REPLACE FUNCTION get_critical_items(threshold_days int)
RETURNS TABLE(material_code text, days_remaining numeric) AS $$
  SELECT material_code, onhand_qty / NULLIF(daily_demand, 0)
  FROM inventory_with_demand
  WHERE onhand_qty / NULLIF(daily_demand, 0) < threshold_days;
$$ LANGUAGE sql;
\`\`\`

JavaScript 端呼叫：

\`\`\`javascript
const { data } = await supabase.rpc('get_critical_items', { threshold_days: 7 });
\`\`\`

### JavaScript 等價：createRPC()

在挑戰中，你會建立一個「函式註冊表」：

\`\`\`javascript
function createRPC(functions) {
  // functions 是一個物件，key 是函式名稱，value 是函式本體
  // 回傳一個 rpc 函式，用來按名稱呼叫已註冊的函式

  return function rpc(name, params) {
    if (!functions[name]) {
      throw new Error('Unknown function: ' + name);
    }
    return functions[name](params);
  };
}
\`\`\`

**核心概念：**
- \`createRPC\` 是一個**高階函式**（Higher-Order Function）——它回傳另一個函式
- 這就是**閉包**（Closure）——回傳的 \`rpc\` 函式「記住」了 \`functions\` 這個變數
- 這種模式叫**函式註冊表**（Function Registry）

#### createRPC 示範

\`\`\`javascript
const rpc = createRPC({
  get_critical_items: ({ threshold_days }) => {
    return inventory_snapshots.filter(row => {
      const daysRemaining = row.onhand_qty / (row.daily_demand || Infinity);
      return daysRemaining < threshold_days;
    });
  },
  get_total_stock: ({ plant_id }) => {
    const filtered = inventory_snapshots.filter(r => r.plant_id === plant_id);
    return filtered.reduce((sum, r) => sum + r.onhand_qty, 0);
  },
});

rpc('get_critical_items', { threshold_days: 7 });
// 回傳庫存天數低於 7 天的品項

rpc('get_total_stock', { plant_id: 'P01' });
// 回傳 P01 工廠的總庫存
\`\`\`

### 安全性：createSecureRPC

在真實系統中，不是每個使用者都能呼叫所有函式。你會實作 \`createSecureRPC\`，加上允許清單：

\`\`\`javascript
function createSecureRPC(functions, allowList) {
  return function rpc(name, params) {
    // 先檢查是否在允許清單中
    if (!allowList.includes(name)) {
      throw new Error('Permission denied: ' + name);
    }
    if (!functions[name]) {
      throw new Error('Unknown function: ' + name);
    }
    return functions[name](params);
  };
}
\`\`\`

#### createSecureRPC 示範

\`\`\`javascript
const secureRpc = createSecureRPC(
  {
    get_critical_items: (params) => { /* ... */ },
    delete_all_data: () => { /* 危險操作 */ },
    get_total_stock: (params) => { /* ... */ },
  },
  ['get_critical_items', 'get_total_stock']  // 只允許這兩個
);

secureRpc('get_critical_items', { threshold_days: 7 });  // ✅ 正常
secureRpc('delete_all_data', {});  // ❌ 拋出 Permission denied
\`\`\`

### 為什麼 RPC 模式很重要？

在 DI 專案中，RPC 模式的好處是：

1. **封裝複雜邏輯**——前端不需要知道 SQL 怎麼寫，只要呼叫函式名稱
2. **安全性**——資料庫只暴露允許的函式，不直接暴露表
3. **可重用**——同一個函式可以被多個頁面呼叫
4. **可測試**——函式是獨立的，容易寫測試

### 練習

1. 用 \`createRPC\` 註冊兩個函式：\`get_low_stock\`（找庫存 < 100 的品項）和 \`get_open_pos\`（找 status = 'open' 的採購單）
2. 用回傳的 \`rpc\` 呼叫它們
3. 用 \`createSecureRPC\` 只允許 \`get_low_stock\`，然後嘗試呼叫 \`get_open_pos\`，確認會拋出錯誤

---

## 3-6（Boss）：即時查詢挑戰

### Boss 關卡概述

在這個最終挑戰中，你要實作一個通用的 \`query(table, options)\` 函式，把前面所有操作組合起來。這就像是自己寫一個迷你版的 SQL 引擎！

### SQL 查詢的執行順序

理解 SQL 的執行順序很重要——它**不是**按照你寫的順序：

| 步驟 | 子句 | 說明 |
|------|------|------|
| 1 | \`FROM\` | 先決定從哪張表取資料 |
| 2 | \`WHERE\` | 過濾原始資料 |
| 3 | \`GROUP BY\` | 分組 |
| 4 | \`HAVING\` | 過濾分組結果 |
| 5 | \`SELECT\` | 選取欄位 |
| 6 | \`ORDER BY\` | 排序 |
| 7 | \`LIMIT\` | 限制筆數 |

### JavaScript 等價：query()

你要實作的 \`query\` 函式接受一張表和選項物件：

\`\`\`javascript
function query(table, options = {}) {
  let result = [...table];  // 複製，不改原始資料

  // 1. WHERE — 過濾
  if (options.where) {
    result = result.filter(row =>
      Object.entries(options.where).every(
        ([key, value]) => row[key] === value
      )
    );
  }

  // 2. ORDER BY — 排序
  if (options.orderBy) {
    const { field, direction = 'asc' } = options.orderBy;
    result.sort((a, b) => {
      if (a[field] < b[field]) return direction === 'asc' ? -1 : 1;
      if (a[field] > b[field]) return direction === 'asc' ? 1 : -1;
      return 0;
    });
  }

  // 3. SELECT — 選取欄位
  if (options.select) {
    result = result.map(row => {
      const newRow = {};
      for (const col of options.select) {
        newRow[col] = row[col];
      }
      return newRow;
    });
  }

  // 4. LIMIT — 限制筆數
  if (options.limit) {
    result = result.slice(0, options.limit);
  }

  return result;
}
\`\`\`

### 用 DI 專案資料做完整示範

\`\`\`javascript
// 相當於：
// SELECT material_code, onhand_qty
// FROM inventory_snapshots
// WHERE plant_id = 'P01'
// ORDER BY onhand_qty ASC
// LIMIT 3;

const answer = query(inventory_snapshots, {
  where: { plant_id: 'P01' },
  orderBy: { field: 'onhand_qty', direction: 'asc' },
  select: ['material_code', 'onhand_qty'],
  limit: 3,
});
\`\`\`

### Boss 挑戰的業務問題

你會拿到一組真實的 \`sample_data\`，用你的 \`query\` 函式回答以下問題：

1. **哪些品項的庫存天數低於 7 天？**
   - 需要先計算每個品項的庫存天數（onhand_qty / daily_demand）
   - 再用 where 過濾

2. **這些品項有沒有正在開的採購單？**
   - 需要把結果和 \`po_open_lines\` 做 join
   - 再用 where 過濾 status = 'open'

3. **各工廠的庫存總價值是多少？**
   - 需要 join inventory_snapshots 和 fg_financials
   - 再 groupBy plant_id
   - 對每組算 sum(onhand_qty * unit_price)

4. **哪個供應商的交貨延遲率最高？**
   - 從 po_open_lines 分組統計

### 解題策略

Boss 關卡考驗的是**組合能力**。把前面學的函式串起來：

\`\`\`javascript
// 範例：各工廠庫存總價值
const withPrice = innerJoin(inventory_snapshots, fg_financials, 'material_code', 'material_code');
const groups = groupBy(withPrice, 'plant_id');
const totals = {};
for (const [plant, rows] of Object.entries(groups)) {
  totals[plant] = rows.reduce((sum, r) => sum + r.onhand_qty * r.unit_price, 0);
}
\`\`\`

> **提示：** 不需要一次寫完——先拆解問題，一步一步串接，每一步都用 console.log 確認中間結果。

---

## SQL 速查表

### SQL 語法對照表

| SQL 語法 | 用途 | SQL 範例 | JS 等價 |
|----------|------|----------|---------|
| \`SELECT\` | 選取欄位 | \`SELECT col FROM t\` | \`.map(r => ({ col: r.col }))\` |
| \`WHERE\` | 過濾 | \`WHERE qty > 10\` | \`.filter(r => r.qty > 10)\` |
| \`ORDER BY\` | 排序 | \`ORDER BY qty DESC\` | \`[...arr].sort((a,b) => b.qty - a.qty)\` |
| \`LIMIT\` | 限制筆數 | \`LIMIT 10\` | \`.slice(0, 10)\` |
| \`JOIN\` | 合併表 | \`JOIN t2 ON t1.id = t2.id\` | 雙層迴圈 + 條件比對 |
| \`GROUP BY\` | 分組 | \`GROUP BY plant_id\` | \`.reduce()\` 建立分組物件 |
| \`HAVING\` | 過濾分組 | \`HAVING SUM(qty) > 100\` | 對分組結果 \`.filter()\` |
| \`INSERT\` | 新增 | \`INSERT INTO t (col) VALUES (val)\` | \`[...table, newRow]\` |
| \`UPDATE\` | 修改 | \`UPDATE t SET col = val WHERE ...\` | \`.map(r => match ? {...r, ...updates} : r)\` |
| \`SUM\` | 加總 | \`SUM(qty)\` | \`.reduce((s,r) => s + r.qty, 0)\` |
| \`AVG\` | 平均 | \`AVG(qty)\` | \`sum / arr.length\` |
| \`COUNT\` | 計數 | \`COUNT(*)\` | \`.length\` |
| \`MAX / MIN\` | 極值 | \`MAX(qty)\` | \`Math.max(...vals)\` |
| \`CASE WHEN\` | 條件 | \`CASE WHEN x > 0 THEN 'yes' END\` | 三元運算子 \`x > 0 ? 'yes' : 'no'\` |
| \`NULLIF(x, 0)\` | 防除零 | 如果 x=0 回傳 NULL | \`x === 0 ? null : x\` 或 \`x \\|\\| Infinity\` |
| \`COALESCE(x, 0)\` | 空值替代 | 如果 x 是 NULL 回傳 0 | \`x ?? 0\` 或 \`x \\|\\| 0\` |
| \`WITH ... AS\` | CTE | 暫存子查詢 | 用變數存中間結果 |

### DI 專案常用表

| 表名 | 用途 | 重要欄位 |
|------|------|----------|
| \`inventory_snapshots\` | 庫存快照 | material_code, plant_id, onhand_qty, safety_stock |
| \`fg_financials\` | 成品財務 | material_code, unit_price, currency |
| \`po_open_lines\` | 開立中採購單 | po_number, material_code, qty, status, supplier_id |
| \`bom_edge\` | BOM 結構（成品→零件）| parent_code, child_code, qty_per |
| \`demand_fg\` | 成品需求預測 | material_code, period, demand_qty, customer_id |

### 本關學到的 JS 核心方法

| 方法 | 用途 | 對應 SQL |
|------|------|----------|
| \`.map()\` | 轉換每一筆資料 | SELECT |
| \`.filter()\` | 過濾資料 | WHERE / HAVING |
| \`.sort()\` | 排序（會改原陣列！） | ORDER BY |
| \`.slice()\` | 取部分陣列 | LIMIT |
| \`.reduce()\` | 聚合 / 分組 | SUM, AVG, GROUP BY |
| \`[...arr]\` | 展開複製 | （避免修改原始資料）|
| \`{ ...obj }\` | 合併物件 | JOIN, UPDATE |

> **下一關：** World 4 將會把 SQL 查詢和前端 UI 串起來，學習如何把查詢結果呈現在畫面上！
`,kR=`
# World 4：React 前線

> **目標：** 理解 React 的 component 模型、Virtual DOM、state 管理、資料流
> **對應專案：** \`src/components/\` 裡的 100+ 個 component
> **挑戰方式：** 用純 JavaScript 模擬 React 核心概念（不需要瀏覽器！）

---

## 4-1：JSX 基礎 — HTML + JavaScript

### React 是什麼？

React 是一個「UI 框架」。它讓你用 JavaScript 寫 HTML。

你的 DI 專案的整個畫面——導航欄、聊天室、Dashboard、圖表——全部都是 React component。

### JSX 的本質：其實是函式呼叫

當你寫 JSX 的時候，你覺得你在寫 HTML：

\`\`\`jsx
const element = <h1 className="title">你好，世界</h1>;
\`\`\`

但 Babel 編譯器會把它轉成這個：

\`\`\`javascript
const element = React.createElement('h1', { className: 'title' }, '你好，世界');
\`\`\`

而 \`React.createElement\` 回傳的只是一個**普通的 JavaScript 物件**：

\`\`\`javascript
{
  type: 'h1',
  props: {
    className: 'title',
    children: '你好，世界'
  }
}
\`\`\`

這個物件就叫做 **Virtual DOM 節點**。整棵 UI 樹其實就是一棵由這些物件組成的樹。

### Virtual DOM 的視覺化

\`\`\`
你寫的 JSX：               React 看到的 Virtual DOM：

<div>                      { type: 'div', props: {
  <h1>標題</h1>     →        children: [
  <p>內文</p>                   { type: 'h1', props: { children: '標題' } },
</div>                          { type: 'p',  props: { children: '內文' } }
                               ]
                            }}
\`\`\`

### 巢狀結構也是一樣

\`\`\`jsx
// 這個 JSX：
<div>
  <header>
    <h1>DI 庫存管理</h1>
  </header>
  <main>
    <p>歡迎回來</p>
  </main>
</div>

// 其實是這個：
React.createElement('div', null,
  React.createElement('header', null,
    React.createElement('h1', null, 'DI 庫存管理')
  ),
  React.createElement('main', null,
    React.createElement('p', null, '歡迎回來')
  )
);
\`\`\`

### DI 專案中的真實範例

你的專案裡 \`StatusBadge\` component 用 JSX 顯示庫存狀態：

\`\`\`jsx
function StatusBadge({ status }) {
  const colors = {
    critical: 'bg-red-500',
    warning: 'bg-yellow-500',
    safe: 'bg-green-500',
  };

  return (
    <span className={\\\`px-2 py-1 rounded text-white \\\${colors[status]}\\\`}>
      {status}
    </span>
  );
}
\`\`\`

在 Virtual DOM 裡，這就是一個 \`{ type: 'span', props: { className: '...', children: 'critical' } }\` 物件。

### JSX 規則

1. **只能有一個根元素** — 用 \`<div>\` 或 \`<>\`（Fragment）包起來
2. **class 要寫成 className** — 因為 class 是 JS 保留字
3. **style 用物件** — \`style={{ color: 'red', fontSize: '16px' }}\`
4. **JavaScript 用 \`{}\` 包** — \`{variable}\`、\`{expression}\`

### 用純 JS 模擬 createElement

挑戰會要你實作 \`createElement\`，概念很簡單：

\`\`\`javascript
// 模擬 React.createElement
function createElement(tag, props, ...children) {
  return {
    type: tag,
    props: {
      ...props,
      children: children.length === 1 ? children[0] : children
    }
  };
}

// 用法：
const vdom = createElement('div', { id: 'app' },
  createElement('h1', null, '標題'),
  createElement('p', { className: 'info' }, '內文')
);

// 結果：
// {
//   type: 'div',
//   props: {
//     id: 'app',
//     children: [
//       { type: 'h1', props: { children: '標題' } },
//       { type: 'p', props: { className: 'info', children: '內文' } }
//     ]
//   }
// }
\`\`\`

### 遞迴計算 Virtual DOM 節點數

Virtual DOM 是一棵樹，我們可以遞迴遍歷它：

\`\`\`javascript
function countElements(tree) {
  // 如果不是物件（是文字節點），不算
  if (typeof tree !== 'object' || tree === null) return 0;

  let count = 1; // 目前這個節點

  const children = tree.props?.children;
  if (Array.isArray(children)) {
    for (const child of children) {
      count += countElements(child);
    }
  } else if (typeof children === 'object' && children !== null) {
    count += countElements(children);
  }
  // 文字 children 不計入節點數

  return count;
}
\`\`\`

> **挑戰預告：** 你需要實作 \`createElement(tag, props, children)\` 和 \`countElements(tree)\`。前者建立 Virtual DOM 節點，後者遞迴計算節點數量。

### 常見錯誤

- **忘記處理 children 是單一元素的情況** — children 可能是字串、物件、或陣列
- **忘記處理 null/undefined** — props 可以是 null
- **遞迴時忘記基礎條件** — 文字節點和 null 要正確處理

---

## 4-2：Props 與 State

### Props — 從外面傳進來的資料

Props 就像函式的參數。父 component 決定要傳什麼，子 component 只能讀取，不能修改。

\`\`\`
     ┌─── App ───────────────────────┐
     │  name="COMP-001"              │
     │  stock={500}                  │
     │  status="safe"                │
     │         │                     │
     │         ▼  (props 往下流)      │
     │  ┌─ ProductCard ──────┐       │
     │  │  讀取 name, stock  │       │
     │  │  不能修改！         │       │
     │  └────────────────────┘       │
     └───────────────────────────────┘
\`\`\`

\`\`\`jsx
// 父 component 傳 props 給子 component
function App() {
  return <ProductCard name="COMP-001" stock={500} status="safe" />;
}

// 子 component 接收 props（用解構語法）
function ProductCard({ name, stock, status }) {
  return (
    <div className="card">
      <h3>{name}</h3>
      <p>庫存：{stock}</p>
      <StatusBadge status={status} />
    </div>
  );
}
\`\`\`

### Default Props — 預設值

有時候 props 沒傳進來，你需要一個預設值：

\`\`\`jsx
function ProductCard({ name, stock = 0, status = 'unknown' }) {
  // 如果沒傳 stock，預設是 0
  // 如果沒傳 status，預設是 'unknown'
}
\`\`\`

用純 JS 模擬 props 合併：

\`\`\`javascript
function mergeProps(defaultProps, userProps) {
  return { ...defaultProps, ...userProps };
}

const defaults = { stock: 0, status: 'unknown', threshold: 100 };
const user = { stock: 500, status: 'safe' };
const merged = mergeProps(defaults, user);
// { stock: 500, status: 'safe', threshold: 100 }
// userProps 的值覆蓋 defaultProps，但 threshold 保留預設值
\`\`\`

### State — component 自己管理的資料

State 是 component 的「記憶」。它可以改變，改變時 component 會重新渲染。

\`\`\`jsx
import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <p>你點了 {count} 次</p>
      <button onClick={() => setCount(count + 1)}>+1</button>
    </div>
  );
}
\`\`\`

### Props vs State 比較

| | Props | State |
|---|-------|-------|
| 誰控制 | 父 component | 自己 |
| 能改嗎 | 不能 | 可以（用 setter） |
| 用途 | 接收外部資料 | 管理內部狀態 |
| 改變時 | 父 component re-render | 自己 re-render |

### 用閉包模擬 useState

React 的 useState 回傳 \`[getter, setter]\`。我們可以用 JavaScript 閉包模擬：

\`\`\`javascript
function createState(initialValue) {
  let value = initialValue;       // 被閉包「記住」

  function getter() {
    return value;                 // 讀取目前的值
  }

  function setter(newValue) {
    value = newValue;             // 更新值
  }

  return [getter, setter];       // 回傳 [讀取函式, 更新函式]
}

// 用法：
const [getCount, setCount] = createState(0);
console.log(getCount());  // 0
setCount(5);
console.log(getCount());  // 5
setCount(getCount() + 1);
console.log(getCount());  // 6
\`\`\`

**為什麼用閉包？** 因為 \`value\` 變數被 \`getter\` 和 \`setter\` 共同「記住」了。即使 \`createState\` 已經執行完畢，\`value\` 仍然存在於記憶體中，可以被讀取和修改。

### DI 專案中的 State 應用

\`\`\`jsx
// 搜尋過濾——用 state 過濾 props
function InventoryList({ items }) {
  const [search, setSearch] = useState('');

  const filtered = items.filter(item =>
    item.materialCode.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div>
      <input
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        placeholder="搜尋品項..."
      />
      {filtered.map(item => (
        <div key={item.materialCode}>
          {item.materialCode}: {item.currentStock}
        </div>
      ))}
    </div>
  );
}
\`\`\`

> **挑戰預告：** 你需要實作 \`createState(initialValue)\` 回傳 \`[getter, setter]\`，以及 \`mergeProps(defaultProps, userProps)\` 用物件展開合併 props。

### 常見錯誤

- **直接修改 state** — 不要 \`state.count = 5\`，要用 setter
- **忘記 spread 順序** — \`{ ...defaults, ...user }\` 中 user 覆蓋 defaults，反過來就錯了
- **在 setter 裡用舊值** — 要用 \`getter()\` 取得最新值，不要用之前存的變數

---

## 4-3：useEffect — 副作用處理

### 什麼是副作用？

Component 的主要工作是根據資料渲染 UI。但有時候你需要做「渲染以外的事」：

\`\`\`
Component 的工作：
┌──────────────────────────────────┐
│  主要工作：render UI              │
│  ┌────────────────────────────┐  │
│  │ props/state → JSX → 畫面   │  │
│  └────────────────────────────┘  │
│                                  │
│  副作用（Side Effects）：         │
│  • 載入資料（API 呼叫）           │
│  • 設定計時器（setInterval）      │
│  • 訂閱事件（WebSocket）          │
│  • 操作 DOM                      │
│  • 寫入 localStorage             │
└──────────────────────────────────┘
\`\`\`

useEffect 就是告訴 React：「渲染完之後，幫我做這件事。」

### useEffect 的三種用法

\`\`\`javascript
// 1. 沒有依賴陣列 → 每次 render 後都執行（小心！很少用到）
useEffect(() => {
  console.log('每次 render 後都會執行');
});

// 2. 空依賴陣列 → 只在首次 render 後執行一次（像 componentDidMount）
useEffect(() => {
  console.log('只執行一次，適合初始化');
}, []);

// 3. 有依賴 → 依賴改變時才執行（最常見！）
useEffect(() => {
  fetchData(materialCode);
}, [materialCode]);  // materialCode 改變時重新執行
\`\`\`

### 依賴比較的原理

React 會「淺比較」依賴陣列。每次 render 時，React 比較新的依賴和上一次的依賴：

\`\`\`
第一次 render：deps = ['COMP-001']    → 執行 effect
第二次 render：deps = ['COMP-001']    → 不執行（相同）
第三次 render：deps = ['COMP-002']    → 執行 effect（不同！）
第四次 render：deps = ['COMP-002']    → 不執行（相同）
\`\`\`

比較方式是用 \`===\`（嚴格相等），逐一比較陣列中的每個元素。

### DI 專案中的 useEffect

\`\`\`jsx
function StockMonitor({ materialCode }) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchData() {
      setLoading(true);
      const response = await fetch('/api/stock/' + materialCode);
      const json = await response.json();
      setData(json);
      setLoading(false);
    }
    fetchData();
  }, [materialCode]); // materialCode 改變時重新載入

  if (loading) return <p>載入中...</p>;
  return <p>{materialCode}: {data?.currentStock} 個</p>;
}
\`\`\`

你的專案裡 \`useEventBus.js\` 也用了 useEffect：訂閱事件 → 回傳取消訂閱函式（cleanup）。

### 用純 JS 模擬依賴追蹤

\`\`\`javascript
function createEffectTracker() {
  let previousDeps = null; // 上一次的依賴陣列

  function check(deps) {
    // 第一次呼叫，沒有上一次的依賴 → 一定要執行
    if (previousDeps === null) {
      previousDeps = deps;
      return { shouldRun: true, reason: 'first-run' };
    }

    // 長度不同 → 一定要執行
    if (previousDeps.length !== deps.length) {
      previousDeps = deps;
      return { shouldRun: true, reason: 'deps-length-changed' };
    }

    // 逐一比較（淺比較，用 ===）
    for (let i = 0; i < deps.length; i++) {
      if (previousDeps[i] !== deps[i]) {
        previousDeps = deps;
        return { shouldRun: true, reason: \\\`deps[\\\${i}]-changed\\\` };
      }
    }

    // 全部相同 → 不需要執行
    return { shouldRun: false, reason: 'no-change' };
  }

  return { check };
}

// 用法：
const tracker = createEffectTracker();
tracker.check(['COMP-001']);  // { shouldRun: true,  reason: 'first-run' }
tracker.check(['COMP-001']);  // { shouldRun: false, reason: 'no-change' }
tracker.check(['COMP-002']);  // { shouldRun: true,  reason: 'deps[0]-changed' }
\`\`\`

> **挑戰預告：** 你需要實作 \`createEffectTracker()\`，回傳一個 \`{ check }\` 物件。\`check(deps)\` 接收依賴陣列，回傳 \`{ shouldRun, reason }\`。

### 常見錯誤

- **忘記依賴陣列** — 沒傳依賴陣列會導致每次 render 都執行，可能造成無限迴圈
- **物件/陣列作為依賴** — \`===\` 比較的是參考（reference），所以每次 render 建立的新物件永遠不相等
- **忘記比較第一次呼叫的特殊情況** — previousDeps 為 null 時一定要執行

---

## 4-4：Context — 全域狀態

### 問題：Props Drilling

當資料需要從最上層傳到最深層，每一層都要當「傳話人」：

\`\`\`
App（有 user 資料）
 └─ Layout（被迫接收 user prop，只為了往下傳）
     └─ Sidebar（被迫接收 user prop，只為了往下傳）
         └─ UserBadge（終於用到 user！）

每一層都要寫：<Child user={user} />
中間那些 component 根本不在意 user 是什麼！
\`\`\`

### 解法：Context — 跨層傳遞

Context 讓你在最上層「廣播」資料，任何深層 component 都可以直接「收聽」：

\`\`\`
App（Provider — 廣播 user 資料）
 └─ Layout（不需要知道 user）
     └─ Sidebar（不需要知道 user）
         └─ UserBadge（useContext — 直接收聽！）
\`\`\`

\`\`\`jsx
import { createContext, useContext, useState } from 'react';

// 1. 建立 Context（附帶預設值）
const UserContext = createContext(null);

// 2. 在最上層用 Provider 提供值
function App() {
  const [user, setUser] = useState({ name: 'Louis', level: 7 });
  return (
    <UserContext.Provider value={{ user, setUser }}>
      <Layout />
    </UserContext.Provider>
  );
}

// 3. 任何深層 component 都可以直接取用
function UserBadge() {
  const { user } = useContext(UserContext);
  return <span>Lv.{user.level} {user.name}</span>;
}
\`\`\`

### DI 專案中的 Context

你的專案用了多個 Context：
- **AppContext** — dark mode、data source 等全域設定
- **AuthContext** — 登入狀態、使用者資訊
- **QuestContext**（DI Quest）— XP、等級、進度

### useReducer — 複雜的 State 管理

當 state 邏輯變複雜時，\`useState\` 不夠用。\`useReducer\` 像一個「規則表」：

\`\`\`jsx
function reducer(state, action) {
  switch (action.type) {
    case 'INCREMENT': return { count: state.count + 1 };
    case 'DECREMENT': return { count: state.count - 1 };
    case 'RESET':     return { count: 0 };
    default:          return state;
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, { count: 0 });
  return (
    <div>
      <p>{state.count}</p>
      <button onClick={() => dispatch({ type: 'INCREMENT' })}>+1</button>
      <button onClick={() => dispatch({ type: 'RESET' })}>重置</button>
    </div>
  );
}
\`\`\`

### 用純 JS 模擬 Context

\`\`\`javascript
function createContext(defaultValue) {
  let currentValue = defaultValue;

  return {
    Provider: function(value) {
      currentValue = value;  // 設定目前的值
    },
    useContext: function() {
      return currentValue;   // 讀取目前的值
    }
  };
}

// 用法：
const ThemeContext = createContext('light');
ThemeContext.useContext();        // 'light'（預設值）
ThemeContext.Provider('dark');    // 提供新值
ThemeContext.useContext();        // 'dark'
\`\`\`

### 用純 JS 模擬 useReducer / Store

\`\`\`javascript
function createStore(reducer, initialState) {
  let state = initialState;

  return {
    getState: function() {
      return state;
    },
    dispatch: function(action) {
      state = reducer(state, action);  // 用 reducer 計算新 state
      return state;
    }
  };
}

// 用法：
function inventoryReducer(state, action) {
  switch (action.type) {
    case 'ADD_ITEM':
      return { ...state, items: [...state.items, action.payload] };
    case 'REMOVE_ITEM':
      return {
        ...state,
        items: state.items.filter(item => item.id !== action.payload)
      };
    case 'UPDATE_STOCK':
      return {
        ...state,
        items: state.items.map(item =>
          item.id === action.payload.id
            ? { ...item, stock: action.payload.stock }
            : item
        )
      };
    default:
      return state;
  }
}

const store = createStore(inventoryReducer, { items: [] });
store.dispatch({ type: 'ADD_ITEM', payload: { id: 1, name: 'COMP-001', stock: 500 } });
store.dispatch({ type: 'ADD_ITEM', payload: { id: 2, name: 'COMP-002', stock: 30 } });
console.log(store.getState().items.length); // 2

store.dispatch({ type: 'UPDATE_STOCK', payload: { id: 2, stock: 0 } });
console.log(store.getState().items[1].stock); // 0
\`\`\`

> **挑戰預告：** 你需要實作 \`createContext(defaultValue)\` 和 \`createStore(reducer, initialState)\`。前者回傳 \`{ Provider, useContext }\`，後者回傳 \`{ getState, dispatch }\`。

### 常見錯誤

- **忘記提供 defaultValue** — 如果沒有 Provider 包住，useContext 應該回傳 defaultValue
- **reducer 修改了原始 state** — reducer 必須回傳新物件，不能直接修改 state
- **dispatch 忘記更新 state** — 要把 reducer 的結果存回去

---

## 4-5：條件渲染與列表

### 條件渲染的三種寫法

在 React 中，你經常需要根據條件顯示不同的 UI：

\`\`\`jsx
// 1. && 短路 — 條件成立才顯示
{isAdmin && <AdminPanel />}

// 2. 三元運算子 — 二選一
{isLoggedIn ? <Dashboard /> : <Login />}

// 3. 提前 return — 處理載入/錯誤狀態
if (loading) return <Spinner />;
if (error) return <ErrorMessage error={error} />;
return <Content data={data} />;
\`\`\`

### DI 專案的庫存狀態判斷

在 DI 專案中，庫存品項需要根據不同條件顯示不同的狀態標籤：

\`\`\`
判斷邏輯：

  currentStock === 0
       │
       ├── 是 → 「缺貨」（critical，紅色）
       │
       └── 否 → currentStock < threshold?
                    │
                    ├── 是 → daysToStockout < 7?
                    │          │
                    │          ├── 是 → 「緊急」（critical，紅色）
                    │          │
                    │          └── 否 → 「警告」（warning，黃色）
                    │
                    └── 否 → 「安全」（safe，綠色）
\`\`\`

\`\`\`jsx
function StockStatus({ item }) {
  const { currentStock, threshold, daysToStockout } = item;

  if (currentStock === 0) {
    return <span className="text-red-500">缺貨</span>;
  }
  if (currentStock < threshold) {
    if (daysToStockout < 7) {
      return <span className="text-red-500">緊急</span>;
    }
    return <span className="text-yellow-500">警告</span>;
  }
  return <span className="text-green-500">安全</span>;
}
\`\`\`

### 用純 JS 模擬條件渲染

\`\`\`javascript
function renderStatus(item) {
  const { currentStock, threshold, daysToStockout } = item;

  if (currentStock === 0) {
    return { text: '缺貨', level: 'critical' };
  }
  if (currentStock < threshold) {
    if (daysToStockout < 7) {
      return { text: '緊急', level: 'critical' };
    }
    return { text: '警告', level: 'warning' };
  }
  return { text: '安全', level: 'safe' };
}

// 用法：
renderStatus({ currentStock: 0, threshold: 100, daysToStockout: 0 });
// { text: '缺貨', level: 'critical' }

renderStatus({ currentStock: 50, threshold: 100, daysToStockout: 3 });
// { text: '緊急', level: 'critical' }

renderStatus({ currentStock: 80, threshold: 100, daysToStockout: 10 });
// { text: '警告', level: 'warning' }

renderStatus({ currentStock: 500, threshold: 100, daysToStockout: 30 });
// { text: '安全', level: 'safe' }
\`\`\`

### 列表渲染 — .map() 是關鍵

React 用 \`.map()\` 把資料陣列轉成 UI 元素陣列：

\`\`\`jsx
function RiskList({ items }) {
  return (
    <ul>
      {items.map(item => (
        <li key={item.materialCode}>
          <span>{item.materialCode}</span>
          <StatusBadge status={item.riskLevel} />
          <span>{item.daysToStockout} 天</span>
        </li>
      ))}
    </ul>
  );
}
\`\`\`

### key 為什麼重要？

\`\`\`
沒有 key：React 看到列表改變，重新渲染全部 5 個 <li>

有 key：
  舊列表：[A, B, C, D, E]     key: [1, 2, 3, 4, 5]
  新列表：[A, C, D, E, F]     key: [1, 3, 4, 5, 6]

  React 知道：
  - key=2 (B) 被移除
  - key=6 (F) 是新增的
  - 其他不用動
  → 只更新 2 個元素，而非全部 5 個！
\`\`\`

### 結合過濾與列表

\`\`\`javascript
function renderList(items, filterLevel) {
  // 先判斷每個 item 的狀態
  const withStatus = items.map(item => ({
    ...item,
    ...renderStatus(item)  // 加上 text 和 level
  }));

  // 如果有指定 filterLevel，就過濾
  if (filterLevel) {
    return withStatus.filter(item => item.level === filterLevel);
  }

  return withStatus;
}

// 用法：
const items = [
  { materialCode: 'COMP-001', currentStock: 500, threshold: 100, daysToStockout: 60 },
  { materialCode: 'COMP-002', currentStock: 30,  threshold: 100, daysToStockout: 3 },
  { materialCode: 'COMP-003', currentStock: 0,   threshold: 50,  daysToStockout: 0 },
  { materialCode: 'COMP-004', currentStock: 80,  threshold: 100, daysToStockout: 12 },
];

renderList(items, 'critical');
// 只回傳 COMP-002（緊急）和 COMP-003（缺貨）

renderList(items, null);
// 回傳全部，每個都帶有 text 和 level
\`\`\`

> **挑戰預告：** 你需要實作 \`renderStatus(item)\` 根據庫存/門檻回傳 \`{ text, level }\`，以及 \`renderList(items, filterLevel)\` 過濾並回傳帶有狀態的列表。

### 常見錯誤

- **忘記處理 currentStock === 0 的邊界情況** — 零庫存一定是 critical
- **filterLevel 為 null/undefined 時要回傳全部** — 不要過濾
- **\`.map()\` 忘記回傳值** — 箭頭函式用 \`{}\` 時要寫 \`return\`

---

## 4-6（Boss）：從零寫一個 Dashboard Card

### Dashboard 是什麼？

Dashboard 就是把大量資料「濃縮」成一目了然的摘要。你的 DI 專案的 \`src/components/insights/\` 裡面有很多 Dashboard Card，每個都做同樣的事：

\`\`\`
原始資料（數百筆）        Dashboard Card
┌──────────────┐     ┌─────────────────────┐
│ COMP-001: 500│     │ 📊 庫存風險總覽       │
│ COMP-002: 30 │ →   │                     │
│ COMP-003: 0  │     │ 總品項數：20         │
│ COMP-004: 80 │     │ 安全：15  警告：3    │
│ ...200 more  │     │ 緊急：2              │
└──────────────┘     │ 平均耗盡天數：18.5天  │
                     │ 風險分數：42/100      │
                     └─────────────────────┘
\`\`\`

### 一個 Dashboard Card 需要什麼？

這就是前面所有概念的綜合應用：

1. **4-1 的概念** — 資料結構（createElement → 物件）
2. **4-2 的概念** — Props 接收 inventoryData，State 管理排序/過濾
3. **4-3 的概念** — 資料載入、依賴追蹤
4. **4-4 的概念** — 全域設定（threshold 可能來自 Context）
5. **4-5 的概念** — 條件渲染狀態標籤、列表渲染品項

### Boss 挑戰：用純 JS 處理 Dashboard 資料

你需要實作 \`createDashboard(inventoryData)\`，這個函式接收庫存資料陣列，回傳 Dashboard 需要的所有摘要資訊：

\`\`\`javascript
function createDashboard(inventoryData) {
  // 1. 計算每個品項的狀態
  // 2. 統計各狀態的數量
  // 3. 找出 critical 和 warning 品項
  // 4. 計算平均耗盡天數
  // 5. 計算風險分數

  // 步驟 1：用 renderStatus 標記每個品項
  const itemsWithStatus = inventoryData.map(item => ({
    ...item,
    ...renderStatus(item)
  }));

  // 步驟 2：統計
  const summary = { total: inventoryData.length, safe: 0, warning: 0, critical: 0 };
  itemsWithStatus.forEach(item => {
    summary[item.level]++;
  });

  // 步驟 3：找出需要關注的品項
  const criticalItems = itemsWithStatus.filter(i => i.level === 'critical');
  const warningItems = itemsWithStatus.filter(i => i.level === 'warning');

  // 步驟 4：平均耗盡天數（排除已經缺貨的）
  const activeItems = inventoryData.filter(i => i.currentStock > 0);
  const avgDaysToStockout = activeItems.length > 0
    ? activeItems.reduce((sum, i) => sum + i.daysToStockout, 0) / activeItems.length
    : 0;

  // 步驟 5：風險分數（0-100，越高越危險）
  const riskScore = Math.round(
    ((summary.critical * 3 + summary.warning * 1) / summary.total) * 100
  );

  return {
    summary,
    criticalItems,
    warningItems,
    avgDaysToStockout: Math.round(avgDaysToStockout * 10) / 10,
    riskScore: Math.min(riskScore, 100)
  };
}
\`\`\`

### 範例：完整執行

\`\`\`javascript
const inventory = [
  { materialCode: 'COMP-001', currentStock: 500, threshold: 100, daysToStockout: 60 },
  { materialCode: 'COMP-002', currentStock: 30,  threshold: 100, daysToStockout: 3 },
  { materialCode: 'COMP-003', currentStock: 0,   threshold: 50,  daysToStockout: 0 },
  { materialCode: 'COMP-004', currentStock: 80,  threshold: 100, daysToStockout: 12 },
  { materialCode: 'COMP-005', currentStock: 200, threshold: 150, daysToStockout: 20 },
];

const dashboard = createDashboard(inventory);

// dashboard.summary:
// { total: 5, safe: 1, warning: 2, critical: 2 }

// dashboard.criticalItems:
// [COMP-002（緊急）, COMP-003（缺貨）]

// dashboard.warningItems:
// [COMP-004（警告）, COMP-005（警告）]

// dashboard.avgDaysToStockout: 23.8
// （只算有庫存的：(60 + 3 + 12 + 20) / 4）

// dashboard.riskScore: 160 → capped at 100
// （(2*3 + 2*1) / 5 * 100 = 160 → min(160, 100) = 100）
\`\`\`

### 這與真正的 React Dashboard Card 的關係

在真正的 React component 中，這些計算會放在 \`useMemo\` 裡面（避免每次 render 都重算）：

\`\`\`jsx
function InventoryRiskCard({ items }) {
  const dashboard = useMemo(() => createDashboard(items), [items]);

  return (
    <div className="bg-white rounded-lg shadow p-4">
      <h3 className="text-lg font-bold">庫存風險總覽</h3>

      <div className="grid grid-cols-3 gap-2 my-4">
        <div className="text-green-500">安全：{dashboard.summary.safe}</div>
        <div className="text-yellow-500">警告：{dashboard.summary.warning}</div>
        <div className="text-red-500">緊急：{dashboard.summary.critical}</div>
      </div>

      <p>平均耗盡天數：{dashboard.avgDaysToStockout} 天</p>
      <p>風險分數：{dashboard.riskScore}/100</p>

      {dashboard.criticalItems.length > 0 && (
        <div className="mt-4">
          <h4 className="text-red-500 font-bold">需要立即處理：</h4>
          {dashboard.criticalItems.map(item => (
            <div key={item.materialCode}>
              {item.materialCode}: {item.text}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
\`\`\`

你看到了嗎？\`createDashboard\` 是純粹的資料處理，不依賴 React。這就是為什麼我們可以用純 JS 來練習——**核心邏輯永遠是 JavaScript**，React 只負責把結果顯示在畫面上。

> **Boss 挑戰：** 實作 \`createDashboard(inventoryData)\`，回傳 \`{ summary, criticalItems, warningItems, avgDaysToStockout, riskScore }\`。這會用到 World 4 學到的所有概念：物件結構、狀態計算、條件判斷、列表過濾、資料聚合。

### 常見錯誤

- **計算平均值時除以零** — 如果所有品項都缺貨，activeItems 為空，要回傳 0
- **riskScore 超過 100** — 記得用 \`Math.min\` 限制上限
- **忘記展開原始 item 的屬性** — \`{ ...item, ...renderStatus(item) }\` 才能保留 materialCode 等欄位
- **浮點數精度** — avgDaysToStockout 要適當四捨五入
`,bR=`
# World 5：Agent 深淵

> **目標：** 理解非同步、設計模式、AI Agent 的核心架構
> **對應專案：** \`src/services/agent-core/\`、\`src/services/ai-infra/\`、\`src/services/governance/\`

---

## 5-1：Async/Await — 非同步程式設計

### 為什麼需要非同步？

JavaScript 是**單執行緒**的——同一時間只能做一件事。

想像你在餐廳點餐：同步模式就像你站在櫃檯前一動不動等廚房做完，後面的人全部排隊等你。非同步模式就像你拿了號碼牌回座位等，其他人可以繼續點餐。

如果呼叫 API 要等 3 秒，同步程式碼會「卡住」整個畫面——使用者什麼都不能做。非同步讓你「先去做別的事，API 回來再處理」。

### Promise — 非同步的基礎磚塊

Promise 是一個**物件**，代表「一個未來才會完成的操作」。它有三種狀態：

\`\`\`
  ┌─────────┐     resolve(value)     ┌───────────┐
  │ pending │ ──────────────────────→ │ fulfilled │
  │ (等待中) │                         │  (成功)    │
  └─────────┘                         └───────────┘
       │
       │        reject(error)         ┌───────────┐
       └────────────────────────────→ │ rejected  │
                                      │  (失敗)    │
                                      └───────────┘
\`\`\`

**手動建立 Promise：**

\`\`\`javascript
// Promise 接受一個函式，函式有兩個參數：resolve 和 reject
const myPromise = new Promise((resolve, reject) => {
  // 做某件事...
  // 成功就呼叫 resolve(值)
  // 失敗就呼叫 reject(錯誤)
});
\`\`\`

**一個最簡單的例子——delay 函式：**

\`\`\`javascript
function delay(ms) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("done");  // ms 毫秒後，Promise 狀態變成 fulfilled，值是 "done"
    }, ms);
  });
}

// 使用
delay(1000).then(value => console.log(value)); // 1 秒後印出 "done"
\`\`\`

這裡有幾個關鍵點：
1. \`delay\` 函式**立刻回傳**一個 Promise 物件（不會等 1 秒）
2. \`setTimeout\` 在背景計時
3. 時間到了，呼叫 \`resolve("done")\`，Promise 狀態變成 fulfilled
4. \`.then()\` 裡的 callback 被觸發，拿到 "done"

### Event Loop — JavaScript 的執行順序

這是非同步最容易搞混的地方。JavaScript 引擎有一個 **Event Loop（事件迴圈）**，它決定程式碼的執行順序：

\`\`\`
  ┌─────────────────────┐
  │    Call Stack        │ ← 同步程式碼在這裡跑
  │   （呼叫堆疊）        │
  └──────────┬──────────┘
             │ 堆疊清空後
             ↓
  ┌─────────────────────┐
  │  Microtask Queue    │ ← Promise.then()、async/await 在這裡排隊
  │  （微任務佇列）       │    優先執行！
  └──────────┬──────────┘
             │ 微任務清空後
             ↓
  ┌─────────────────────┐
  │  Macrotask Queue    │ ← setTimeout、setInterval 在這裡排隊
  │  （巨任務佇列）       │
  └─────────────────────┘
\`\`\`

**執行順序規則：**
1. 先跑完所有**同步程式碼**（Call Stack）
2. 再跑所有**微任務**（Microtask Queue）——Promise.then()、await 後面的程式碼
3. 最後跑**巨任務**（Macrotask Queue）——setTimeout 等

\`\`\`javascript
function getOrder() {
  const order = [];

  order.push("sync1");                              // 1. 同步，立刻執行
  Promise.resolve().then(() => order.push("micro")); // 排入微任務佇列，等同步跑完
  order.push("sync2");                              // 2. 同步，立刻執行

  return order;
  // 函式 return 時，同步程式碼跑完了
  // order 裡面只有 ["sync1", "sync2"]
  // "micro" 還在微任務佇列裡，還沒執行！
}

const result = getOrder();
console.log(result);         // ["sync1", "sync2"]  ← 只有 2 個元素
console.log(result.length);  // 2
// ⚠️ "micro" 要等目前的同步程式碼全部跑完才會執行
\`\`\`

**為什麼 "micro" 不在陣列裡？** 因為 \`Promise.resolve().then()\` 會把 callback 放進微任務佇列，而微任務要等 Call Stack 清空才會執行。\`return order\` 是同步的，在微任務之前就回傳了。

### async/await — 更好讀的 Promise 寫法

\`\`\`javascript
async function fetchData() {
  try {
    const response = await fetch('https://api.example.com/data');
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.error('出錯了:', error);
  }
}
\`\`\`

\`async/await\` 和 \`.then()\` 做的事**完全一樣**，只是語法糖，更像同步程式碼。

**重要觀念：** \`await\` 只暫停**這個 async 函式本身**，不暫停整個程式。外面的程式碼繼續跑：

\`\`\`javascript
console.log('1. 開始');

async function demo() {
  console.log('2. 進入函式');
  await new Promise(resolve => setTimeout(resolve, 1000));
  console.log('4. 等了 1 秒');
}

demo();  // 啟動但不等它完成
console.log('3. 函式啟動了但還沒完成');

// 印出順序：1, 2, 3, (等 1 秒), 4
\`\`\`

### DI 專案怎麼用 — aiProxyService.js

\`\`\`javascript
// 來自 src/services/ai-infra/aiProxyService.js
async function invokeAiProxy(payload, options = {}) {
  const response = await fetch(edgeFunctionUrl, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': \\\`Bearer \\\${apiKey}\\\`,
    },
    body: JSON.stringify(payload),
  });

  if (!response.ok) {
    throw new Error(\\\`AI Proxy 呼叫失敗: \\\${response.status}\\\`);
  }

  return response.json(); // 回傳 Promise
}
\`\`\`

### 常見錯誤

**錯誤 1：忘記 await**
\`\`\`javascript
// 錯誤：result 是 Promise 物件，不是結果值
const result = fetchData();
console.log(result); // Promise { <pending> }

// 正確：
const result = await fetchData();
\`\`\`

**錯誤 2：在非 async 函式裡用 await**
\`\`\`javascript
// 錯誤：SyntaxError
function doSomething() {
  const data = await fetchData(); // ← 不行！
}

// 正確：加上 async
async function doSomething() {
  const data = await fetchData();
}
\`\`\`

### 小練習（直接對應挑戰題目）

**練習 A：** 寫一個 \`delay(ms)\` 函式，回傳 Promise，在 ms 毫秒後 resolve 字串 \`"done"\`。

提示：用 \`new Promise\` + \`setTimeout\` + \`resolve("done")\`。

**練習 B：** 寫一個 \`getOrder()\` 函式，裡面用 \`order.push("sync1")\`、\`Promise.resolve().then(() => order.push("micro"))\`、\`order.push("sync2")\`，然後 return order。想想看回傳的陣列裡有幾個元素？

---

## 5-2：Pub/Sub 模式 — EventBus

### 問題：元件之間怎麼溝通？

想像一個辦公室場景：
- 會議室 A 裡的人做完報告了，想通知倉庫的人可以出貨了
- 但他不知道倉庫裡**誰**在負責，也不知道**幾個人**需要知道這件事
- 他只需要在公司廣播喊一聲：「報告完成了！」

這就是 **Pub/Sub（發佈/訂閱）模式**。發佈者不需要知道訂閱者是誰，訂閱者不需要知道發佈者是誰，中間有一個**事件匯流排（EventBus）**負責傳遞消息。

\`\`\`
  Component A ──emit("stock:low")──→ ┌───────────┐ ──→ Handler 1
                                      │  EventBus │ ──→ Handler 2
  Component B ──emit("order:new")──→ │  (匯流排)  │ ──→ Handler 3
                                      └───────────┘
\`\`\`

### 資料結構：Map + Set

EventBus 的核心資料結構是 \`Map<string, Set<Function>>\`：

\`\`\`
  _listeners (Map)
  ┌──────────────────────────────────────┐
  │ "stock:low"    → Set{ fn1, fn2 }    │
  │ "order:new"    → Set{ fn3 }         │
  │ "agent:done"   → Set{ fn4, fn5 }    │
  └──────────────────────────────────────┘
\`\`\`

為什麼用 **Map** 而不是普通物件？Map 的 key 可以是任何型別，效能更好。
為什麼用 **Set** 而不是 Array？Set 自動去重（同一個 callback 不會被加兩次），刪除是 O(1) 不是 O(n)。

### 逐步實作 EventBus

\`\`\`javascript
class EventBus {
  constructor() {
    // 初始化：空的 Map，key 是事件名稱，value 是 callback 的 Set
    this._listeners = new Map();
  }

  // 訂閱事件
  on(event, callback) {
    // 如果這個事件還沒有任何訂閱者，建立一個空的 Set
    if (!this._listeners.has(event)) {
      this._listeners.set(event, new Set());
    }

    // 把 callback 加入 Set
    this._listeners.get(event).add(callback);

    // ★ 回傳取消訂閱的函式 — 這是很重要的設計
    // 呼叫回傳的函式就能取消訂閱，不需要另外存 reference
    return () => this.off(event, callback);
  }

  // 發送事件
  emit(event, data) {
    const handlers = this._listeners.get(event);
    if (handlers) {
      // 觸發這個事件所有的 callback，傳入 data
      handlers.forEach(fn => fn(data));
    }
  }

  // 取消訂閱
  off(event, callback) {
    // 用 ?. 安全呼叫 — 即使這個事件沒有訂閱者也不會報錯
    this._listeners.get(event)?.delete(callback);
  }
}
\`\`\`

### 使用範例

\`\`\`javascript
const bus = new EventBus();

// 訂閱 — 回傳 unsubscribe 函式
const unsubscribe = bus.on('stock:critical', (data) => {
  console.log('緊急通知！', data.materialCode, '庫存不足');
});

// 再加一個訂閱者
bus.on('stock:critical', (data) => {
  console.log('記錄到 log：', data);
});

// 發送事件 — 兩個訂閱者都會收到
bus.emit('stock:critical', { materialCode: 'COMP-001', days: 3 });

// 取消第一個訂閱者（兩種方式都行）
unsubscribe();  // 方式 1：呼叫 on() 回傳的函式
// bus.off('stock:critical', handler);  // 方式 2：直接呼叫 off
\`\`\`

### DI 專案怎麼用 — eventBus.js

在 DI 專案裡，EventBus 用來在 React 元件和 Agent 服務之間傳遞消息：

\`\`\`javascript
// 來自 src/services/governance/eventBus.js
// 還支援萬用字元匹配
emit(event, payload) {
  const handlers = this._listeners.get(event);
  if (handlers) {
    handlers.forEach(fn => fn(payload));
  }

  // 萬用字元支援：'agent:*' 匹配 'agent:start', 'agent:done', 'agent:error'
  for (const [pattern, fns] of this._listeners) {
    if (pattern.endsWith('*') && event.startsWith(pattern.slice(0, -1))) {
      fns.forEach(fn => fn(payload));
    }
  }
}
\`\`\`

\`\`\`javascript
// 在 React 元件裡使用
useEffect(() => {
  const unsubscribe = eventBus.on('agent:done', (result) => {
    setAgentResult(result);
  });
  return unsubscribe; // ★ 元件卸載時自動取消訂閱，防止記憶體洩漏
}, []);
\`\`\`

### 常見錯誤

**錯誤 1：忘記取消訂閱 — 記憶體洩漏**
\`\`\`javascript
// 錯誤：每次元件 re-render 都加一個新的訂閱
useEffect(() => {
  eventBus.on('update', handler);
  // 沒有 return 取消訂閱！
});

// 正確：
useEffect(() => {
  const unsub = eventBus.on('update', handler);
  return unsub;
}, []);
\`\`\`

**錯誤 2：用箭頭函式訂閱後想用 off 取消**
\`\`\`javascript
// 錯誤：兩個箭頭函式是不同的物件，off 找不到
bus.on('e', (d) => console.log(d));
bus.off('e', (d) => console.log(d)); // ← 這是不同的函式物件！

// 正確：保存 reference
const handler = (d) => console.log(d);
bus.on('e', handler);
bus.off('e', handler); // ← 同一個函式物件
\`\`\`

### 小練習（直接對應挑戰題目）

實作一個 \`EventBus\` class，必須支援：
- \`on(event, callback)\` — 訂閱事件，**回傳取消訂閱函式**
- \`emit(event, data)\` — 觸發事件的所有 callback
- \`off(event, callback)\` — 取消特定 callback 的訂閱

測試你的實作：建立 bus，訂閱 "test" 事件，emit 一次檢查有收到，然後 unsubscribe 後再 emit 一次檢查沒收到。

---

## 5-3：Semaphore — 並發控制

### 問題：太多請求同時飛出去

你有 100 個 API 呼叫要發。如果同時全部發出去：
- 伺服器回你 **429 Too Many Requests**
- 或者你的電腦記憶體不夠用
- 或者網路頻寬被塞爆

### 餐廳類比

想像一家只有 3 張桌子的餐廳：

\`\`\`
  餐廳（AsyncSemaphore, max = 3）

  桌子 1: [客人A]    ← _active = 3（滿了）
  桌子 2: [客人B]
  桌子 3: [客人C]

  等候區 _queue: [客人D, 客人E, 客人F ...]
                     ↑
              客人 D 在等 Promise（排隊中）

  → 客人 B 吃完離開（release）
  → 桌子 2 空出來
  → 客人 D 自動入座（resolve 被呼叫）
\`\`\`

- \`acquire()\` = 排隊等位子。有位子就直接坐下，沒位子就等。
- \`release()\` = 吃完離開。如果有人在等，讓下一個進來。

### 逐步實作 AsyncSemaphore

\`\`\`javascript
class AsyncSemaphore {
  constructor(max) {
    this._max = max;       // 最大並發數（桌子數）
    this._active = 0;      // 目前使用中的數量（已坐下的客人）
    this._queue = [];       // 等待中的 resolve 函式（排隊的客人）
  }

  async acquire() {
    if (this._active < this._max) {
      // 還有位子！直接進入
      this._active++;
      return;
    }

    // 沒位子了，建立一個 Promise 然後排隊
    // ★ 關鍵技巧：把 resolve 存起來，等有位子的時候再呼叫它
    return new Promise((resolve) => {
      this._queue.push(resolve);
    });
    // 這個 await 會在這裡「卡住」，直到有人呼叫 resolve
  }

  release() {
    this._active--;  // 釋放一個位子

    if (this._queue.length > 0) {
      // 有人在排隊！讓下一個進入
      this._active++;
      const nextResolve = this._queue.shift(); // 取出排最前面的
      nextResolve(); // 呼叫 resolve，解除那個 Promise 的等待
    }
  }
}
\`\`\`

### 核心技巧：把 resolve 存起來

\`\`\`javascript
// 當 _active >= _max 時：
return new Promise((resolve) => {
  this._queue.push(resolve);  // 不立刻呼叫 resolve，而是存起來
});
// ↑ 這個 Promise 會一直處於 pending 狀態
// ↑ 直到某處呼叫 this._queue.shift()()，也就是呼叫 resolve
\`\`\`

這是非同步程式設計裡很重要的模式：**手動控制 Promise 何時 resolve**。

### 使用方式

\`\`\`javascript
const semaphore = new AsyncSemaphore(3); // 最多 3 個同時

async function callApi(url) {
  await semaphore.acquire();  // 等有位子
  try {
    const result = await fetch(url);
    return result;
  } finally {
    semaphore.release();  // ★ 不管成功失敗都要釋放
  }
}

// 即使同時呼叫 100 個，最多只有 3 個在飛
const urls = Array(100).fill('https://api.example.com');
await Promise.all(urls.map(callApi));
\`\`\`

**\`try/finally\` 非常重要：** 如果請求失敗（throw error）但沒有 release，這個位子就被永久佔住了，最終所有位子都被佔住，整個系統卡死。

### DI 專案怎麼用 — aiProxyService.js

\`\`\`javascript
// 來自 src/services/ai-infra/aiProxyService.js
// 限制同時最多 5 個 AI API 呼叫
const aiSemaphore = new AsyncSemaphore(5);

async function invokeAiProxy(payload) {
  await aiSemaphore.acquire();
  try {
    const response = await fetch(edgeFunctionUrl, { ... });
    return response.json();
  } finally {
    aiSemaphore.release();
  }
}
\`\`\`

### 執行流程圖

\`\`\`
  時間軸（max = 2）:

  Task A: ─── acquire() ──→ [執行中...] ──→ release() ───
  Task B: ─── acquire() ──→ [執行中........] ──→ release()
  Task C: ─── acquire() ──→ (排隊等...) ─────→ [執行中...] → release()
                                         ↑
                                    Task A release 後
                                    Task C 才能開始
\`\`\`

### 常見錯誤

**錯誤：忘記 release**
\`\`\`javascript
// 錯誤：如果 fetch 丟出 error，release 不會被執行
async function bad(url) {
  await semaphore.acquire();
  const result = await fetch(url); // 如果這行 throw...
  semaphore.release();             // 這行就不會跑到
  return result;
}

// 正確：用 try/finally
async function good(url) {
  await semaphore.acquire();
  try {
    return await fetch(url);
  } finally {
    semaphore.release(); // 不管成功失敗都會執行
  }
}
\`\`\`

### 小練習（直接對應挑戰題目）

實作 \`AsyncSemaphore\` class：
- \`constructor(max)\` — 設定最大並發數
- \`async acquire()\` — 如果 \`_active < _max\` 就 \`_active++\` 回傳；否則建立 Promise 排隊
- \`release()\` — \`_active--\`；如果 \`_queue\` 有人在等，\`_active++\` 並呼叫 \`shift()()\`

---

## 5-4：Circuit Breaker — 熔斷器

### 問題：API 掛了但你還在狂打

API 伺服器掛了，每個請求都要等 30 秒 timeout 才失敗。你的程式不知道它掛了，繼續送 100 個請求 — 每個等 30 秒 — 使用者等到崩潰。

這就像家裡的**保險絲**（Circuit Breaker）：電流太大就跳掉，保護整個電路不被燒壞。

### 三態狀態機

Circuit Breaker 有三種狀態，形成一個狀態機：

\`\`\`
  ┌──────────────────┐
  │     CLOSED       │ ← 正常狀態，所有請求放行
  │  （保險絲正常）     │
  └────────┬─────────┘
           │ 失敗累積 >= threshold（例如 3 次）
           ↓
  ┌──────────────────┐
  │      OPEN        │ ← 熔斷！所有請求立即被拒絕
  │  （保險絲跳掉）     │    不再浪費時間等 timeout
  └────────┬─────────┘
           │ 冷卻時間到了
           ↓
  ┌──────────────────┐
  │    HALF_OPEN     │ ← 試探性放行一個請求
  │  （試著恢復）      │
  └───┬──────────┬───┘
      │          │
    成功        失敗
      │          │
      ↓          ↓
   CLOSED      OPEN（繼續熔斷）
\`\`\`

| 狀態 | canRequest() | 行為 |
|------|-------------|------|
| CLOSED | true | 正常放行。記錄失敗次數。 |
| OPEN | false | 拒絕所有請求（立刻回傳錯誤，不等 timeout）。等冷卻時間到才進 HALF_OPEN。 |
| HALF_OPEN | true（一次） | 允許一個請求試試。成功回 CLOSED，失敗回 OPEN。 |

### 逐步實作（簡化版，對應挑戰題目）

挑戰要求的是簡化版本——用 **失敗計數器** 而不是時間窗口：

\`\`\`javascript
class CircuitBreaker {
  constructor(threshold = 3) {
    this.state = "CLOSED";       // 初始狀態
    this.failures = 0;           // 失敗次數
    this.threshold = threshold;  // 幾次失敗就跳掉
  }

  // 記錄失敗
  recordFailure() {
    this.failures++;
    if (this.failures >= this.threshold) {
      this.state = "OPEN";  // 失敗次數到達門檻，熔斷！
    }
  }

  // 記錄成功
  recordSuccess() {
    if (this.state === "HALF_OPEN") {
      // 試探成功了！恢復正常
      this.state = "CLOSED";
      this.failures = 0;  // 重置失敗計數
    }
  }

  // 判斷能不能發請求
  canRequest() {
    if (this.state === "CLOSED") {
      return true;  // 正常，放行
    }
    if (this.state === "OPEN") {
      return false;  // 熔斷中，拒絕
      // 注意：完整版會在這裡檢查冷卻時間
      // 冷卻時間到了就轉成 HALF_OPEN 並 return true
    }
    return false;  // HALF_OPEN 時已經有一個試探請求在飛了
  }
}
\`\`\`

### 狀態轉移追蹤

\`\`\`
  操作               failures   state
  ────────────────   ────────   ──────────
  （初始）            0          CLOSED
  recordFailure()    1          CLOSED
  recordFailure()    2          CLOSED
  recordFailure()    3          OPEN ← 熔斷！
  canRequest()       —          return false
  canRequest()       —          return false
  (手動設為 HALF_OPEN)
  recordSuccess()    0          CLOSED ← 恢復！
\`\`\`

### DI 專案的完整版 — 帶時間窗口和冷卻

\`\`\`javascript
// 來自 src/services/ai-infra/aiProxyService.js
class CircuitBreaker {
  constructor({ failureThreshold = 3, cooldownMs = 60000, windowMs = 30000 }) {
    this.state = 'CLOSED';
    this.failures = [];            // 用陣列記錄每次失敗的時間戳
    this.failureThreshold = failureThreshold;
    this.cooldownMs = cooldownMs;  // 冷卻時間：60 秒
    this.windowMs = windowMs;      // 時間窗口：30 秒內的失敗才算
    this.openedAt = null;          // 什麼時候跳掉的
  }

  recordFailure() {
    const now = Date.now();
    // 只計算 windowMs 內的失敗（過期的不算）
    this.failures = this.failures.filter(t => now - t < this.windowMs);
    this.failures.push(now);

    if (this.failures.length >= this.failureThreshold) {
      this.state = 'OPEN';
      this.openedAt = now;
    }
  }

  recordSuccess() {
    if (this.state === 'HALF_OPEN') {
      this.state = 'CLOSED';
      this.failures = [];
      this.cooldownMs = 60000; // 重置冷卻時間
    }
  }

  canRequest() {
    if (this.state === 'CLOSED') return true;
    if (this.state === 'OPEN') {
      // 冷卻時間到了嗎？
      if (Date.now() - this.openedAt >= this.cooldownMs) {
        this.state = 'HALF_OPEN'; // 進入試探模式
        return true;
      }
      return false;
    }
    return false; // HALF_OPEN 已經有試探請求在飛
  }
}
\`\`\`

### 完整版 vs 簡化版差異

| 特性 | 簡化版（挑戰題目） | 完整版（DI 專案） |
|------|-----------------|-----------------|
| 失敗計數 | 簡單計數器 | 時間窗口內的陣列 |
| OPEN → HALF_OPEN | 需手動設定 | 自動（冷卻時間到了） |
| 冷卻時間 | 無 | 60 秒，可加倍 |

### 常見錯誤

**錯誤 1：recordSuccess 在 CLOSED 狀態也重置**
\`\`\`javascript
// 錯誤：在 CLOSED 狀態不應該做任何事
recordSuccess() {
  this.state = "CLOSED";
  this.failures = 0;
}

// 正確：只在 HALF_OPEN 時才有意義
recordSuccess() {
  if (this.state === "HALF_OPEN") {
    this.state = "CLOSED";
    this.failures = 0;
  }
}
\`\`\`

**錯誤 2：canRequest 在 OPEN 狀態回傳 true**
\`\`\`javascript
// 錯誤：OPEN 就是要拒絕，不能放行
canRequest() {
  return this.state !== "BROKEN"; // ← 什麼鬼？
}
\`\`\`

### 小練習（直接對應挑戰題目）

實作 \`CircuitBreaker\` class：
- 初始狀態 \`"CLOSED"\`，失敗計數從 0 開始
- \`recordFailure()\` — \`failures++\`，如果 \`>= threshold\` 就轉 \`"OPEN"\`
- \`recordSuccess()\` — 只在 \`"HALF_OPEN"\` 時才轉回 \`"CLOSED"\` 並重置 failures
- \`canRequest()\` — \`"CLOSED"\` return true，\`"OPEN"\` return false

---

## 5-5：ReAct Loop — Agent 怎麼思考

### 什麼是 AI Agent？

**普通的 LLM 呼叫：** 你問一個問題，它回答。一問一答，結束。

**Agent：** 你給它一個**任務**和一組**工具**，它**自己決定**：
- 要用哪些工具？
- 按什麼順序用？
- 用完後結果對不對？
- 需不需要再用別的工具？
- 什麼時候可以給出最終答案？

### ReAct 模式：思考 → 行動 → 觀察

ReAct = **Re**asoning + **Act**ing。每一步都有三個階段：

\`\`\`
  ┌──────────┐     ┌──────────┐     ┌──────────┐
  │  Thought │ ──→ │  Action  │ ──→ │ Observe  │ ──→ 回到 Thought
  │  (思考)   │     │  (行動)   │     │  (觀察)   │     或輸出答案
  └──────────┘     └──────────┘     └──────────┘
       │                                   │
       │  我需要什麼資訊？                    │  工具回傳了什麼？
       │  該用哪個工具？                      │  夠回答了嗎？
       │  已經知道答案了嗎？                   │  需要再查嗎？
\`\`\`

### 完整範例

\`\`\`
  用戶任務：「COMP-001 會不會斷料？」

  ────── 第 1 步 ──────
  Thought: 我需要查 COMP-001 的庫存和需求資料
  Action:  呼叫 query_inventory("COMP-001")
  Observe: 庫存 200，日需求 50，安全庫存 100

  ────── 第 2 步 ──────
  Thought: 庫存天數 = (200-100)/50 = 2 天，很危險。查看有沒有在途訂單
  Action:  呼叫 query_open_po("COMP-001")
  Observe: PO-20003，500 個，預計 3 天後到

  ────── 第 3 步 ──────
  Thought: 庫存撐 2 天，補貨要 3 天，有 1 天缺口。可以給答案了。
  Action:  回傳最終答案
  Output:  「COMP-001 有斷料風險。庫存天數僅 2 天，最近補貨要 3 天後才到。
            建議加速催貨或尋找替代供應商。」
\`\`\`

### reactStep — 模擬一步 ReAct

挑戰要求你寫 \`reactStep(state, tools)\`，模擬 ReAct 迴圈的**一步**：

\`\`\`javascript
function reactStep(state, tools) {
  const { goal, observations, history } = state;

  // 1. 判斷：observations 裡有 "ANSWER:" 嗎？
  //    如果有，表示上一步的工具已經找到答案了
  if (observations.includes("ANSWER:")) {
    return {
      thought: "找到答案了",
      action: "done",
      result: observations  // 把包含 ANSWER 的觀察結果回傳
    };
  }

  // 2. 還沒找到答案 → 呼叫工具
  const toolNames = Object.keys(tools);
  if (toolNames.length === 0) {
    // 沒有工具可用
    return { thought: "找到答案了", action: "done", result: observations };
  }

  // 呼叫第一個工具（按 Object.keys 順序）
  const toolName = toolNames[0];
  const toolFn = tools[toolName];
  const toolResult = toolFn(goal);

  return {
    thought: "需要更多資訊",
    action: toolName,
    result: toolResult
  };
}
\`\`\`

**關鍵邏輯：**
- 如果 \`observations\` 包含 \`"ANSWER:"\` → 思考 = "找到答案了"，回傳觀察結果
- 否則 → 呼叫 tools 裡的第一個工具，回傳工具結果

### DI 專案怎麼用 — chatAgentLoop.js

\`\`\`javascript
// 來自 src/services/agent-core/chatAgentLoop.js（簡化版）
const MAX_ITERATIONS = 8;

async function agentLoop(userMessage, tools) {
  const messages = [{ role: 'user', content: userMessage }];

  for (let i = 0; i < MAX_ITERATIONS; i++) {
    // 1. 呼叫 LLM，讓它「思考」
    const response = await callLLM(messages);

    // 2. LLM 要求使用工具嗎？
    if (response.toolCalls && response.toolCalls.length > 0) {
      for (const call of response.toolCalls) {
        // 3. 執行工具（「行動」）
        const result = await executeTool(call.name, call.arguments);
        // 4. 把結果回饋給 LLM（「觀察」）
        messages.push({ role: 'tool', content: result });
      }
      // 回到迴圈頂端，讓 LLM 再次「思考」
    } else {
      // 5. LLM 不需要工具了，回傳最終答案
      return response.content;
    }
  }
  return '達到最大迭代次數';
}
\`\`\`

### 動態迭代預算

DI 專案裡有一個聰明的設計——根據問題複雜度調整最大迭代次數：

\`\`\`javascript
function resolveMaxIterations(answerContract) {
  const dims = answerContract?.required_dimensions?.length || 0;
  const outputs = answerContract?.required_outputs?.length || 0;
  const bonus = Math.min(4, Math.floor((dims + outputs) / 2));
  return 8 + bonus; // 基礎 8 次，複雜問題最多 12 次
}
\`\`\`

### 常見錯誤

**錯誤：沒有終止條件**
\`\`\`javascript
// 錯誤：如果工具永遠找不到答案，就會無限迴圈
while (true) {
  const result = callTool();
  if (result.includes("ANSWER")) break;
}

// 正確：設最大迭代次數
for (let i = 0; i < MAX_ITERATIONS; i++) { ... }
\`\`\`

### 小練習（直接對應挑戰題目）

寫 \`reactStep(state, tools)\`：
- \`state\` 有 \`{ goal, observations, history }\`
- 如果 \`observations\` 包含 \`"ANSWER:"\` → 回傳 \`{ thought: "找到答案了", action: "done", result: observations }\`
- 否則 → 呼叫 \`Object.keys(tools)[0]\` 對應的工具函式，回傳 \`{ thought: "需要更多資訊", action: toolName, result: toolResult }\`

---

## 5-6（Boss）：自己寫一個 Mini Agent

### 目標

寫一個 \`createAgent(tools)\` 函式，它接收一組工具，回傳一個 \`run(task)\` 函式。

\`run(task)\` 會：
1. 解析 task 字串裡的 \`[toolName]\` 標記
2. 按順序呼叫對應的工具
3. 收集步驟和結果
4. 回傳結構化的結果

### Agent 的架構

\`\`\`
  createAgent(tools) → 回傳 run 函式
  ┌──────────────────────────────────────────────┐
  │  run(task)                                    │
  │                                               │
  │  1. 解析 task 字串                              │
  │     "[search] 找庫存 然後 [calc] 算風險"         │
  │      ↓ 用正規表達式找 [xxx]                      │
  │     ["search", "calc"]                         │
  │                                               │
  │  2. 按順序呼叫工具                               │
  │     tools["search"](task) → "庫存:200"         │
  │     tools["calc"](task)   → "風險:低"           │
  │                                               │
  │  3. 收集結果                                    │
  │     steps: [                                   │
  │       { tool: "search", result: "庫存:200" },   │
  │       { tool: "calc",   result: "風險:低" }     │
  │     ]                                          │
  │                                               │
  │  4. 回傳                                       │
  │     { task, steps, finalAnswer: "風險:低" }     │
  └──────────────────────────────────────────────┘
\`\`\`

### 逐步實作

\`\`\`javascript
function createAgent(tools) {
  const toolNames = Object.keys(tools);

  return function run(task) {
    const steps = [];

    // 1. 用正規表達式找出 task 中所有的 [toolName]
    //    /\\[([^\\]]+)\\]/g 匹配 [xxx] 並提取 xxx
    const regex = /\\[([^\\]]+)\\]/g;
    let match;
    const mentionedTools = [];

    while ((match = regex.exec(task)) !== null) {
      const name = match[1]; // 取出 [] 裡面的文字
      if (toolNames.includes(name)) {
        mentionedTools.push(name);
      }
    }

    // 2. 按順序呼叫找到的工具
    for (const toolName of mentionedTools) {
      const toolFn = tools[toolName];
      const result = toolFn(task);  // 每個工具的輸入都是原始 task
      steps.push({ tool: toolName, result });
    }

    // 3. 回傳結構化結果
    return {
      task,
      steps,
      finalAnswer: steps.length > 0 ? steps[steps.length - 1].result : null
    };
  };
}
\`\`\`

### 正規表達式解析

\`/\\[([^\\]]+)\\]/g\` 拆解：

| 部分 | 意思 |
|------|------|
| \`\\[\` | 匹配字面的 \`[\` |
| \`([^\\]]+)\` | 捕獲群組：一個或多個「不是 \`]\`」的字元 |
| \`\\]\` | 匹配字面的 \`]\` |
| \`g\` | 全域匹配（找出所有，不是只找第一個） |

\`\`\`
  task: "請用 [search] 找資料然後 [calc] 算結果"
                ↑                    ↑
          match[1]="search"    match[1]="calc"
\`\`\`

### 使用範例

\`\`\`javascript
// 定義工具
const tools = {
  search: (task) => "找到: COMP-001 庫存 200",
  calc:   (task) => "風險評估: 低風險",
  report: (task) => "報告已生成"
};

// 建立 agent
const agent = createAgent(tools);

// 執行任務
const result = agent.run("請用 [search] 查庫存，然後 [calc] 評估風險");
console.log(result);
// {
//   task: "請用 [search] 查庫存，然後 [calc] 評估風險",
//   steps: [
//     { tool: "search", result: "找到: COMP-001 庫存 200" },
//     { tool: "calc",   result: "風險評估: 低風險" }
//   ],
//   finalAnswer: "風險評估: 低風險"
// }

// 沒有匹配工具的情況
const result2 = agent.run("隨便說點什麼");
console.log(result2);
// { task: "隨便說點什麼", steps: [], finalAnswer: null }
\`\`\`

### 對應 DI 專案的架構

你寫的 Mini Agent 其實就是 DI 專案裡 \`chatAgentLoop.js\` 的極度簡化版：

| Mini Agent | DI 專案 chatAgentLoop |
|------------|----------------------|
| \`[toolName]\` 字串解析 | LLM 自己決定要呼叫哪個工具 |
| 同步呼叫工具 | \`await executeTool()\` 非同步呼叫 |
| 按順序一個一個 | 根據 LLM 回應動態決定 |
| 固定流程 | 迴圈 + 最大迭代限制 |
| 無錯誤處理 | Circuit Breaker + Semaphore |

在真正的 Agent 裡，「決定要用哪個工具」這件事是 LLM 自己做的，不是從字串裡找 \`[toolName]\`。但底層的**工具調度架構**是一樣的。

### 常見錯誤

**錯誤 1：工具名稱不在 tools 裡但還是呼叫**
\`\`\`javascript
// 錯誤：task 裡寫了 [fly] 但 tools 沒有 fly，直接呼叫會 crash
const toolFn = tools[name]; // undefined
toolFn(task);               // TypeError!

// 正確：先檢查工具存不存在
if (toolNames.includes(name)) {
  mentionedTools.push(name);
}
\`\`\`

**錯誤 2：finalAnswer 在沒有步驟時不是 null**
\`\`\`javascript
// 錯誤：
finalAnswer: steps[steps.length - 1].result // steps 為空時 crash

// 正確：
finalAnswer: steps.length > 0 ? steps[steps.length - 1].result : null
\`\`\`

### 小練習（直接對應挑戰題目）

寫 \`createAgent(tools)\` 函式：
1. 接收 \`tools\` 物件（\`{name: fn}\`）
2. 回傳 \`run(task)\` 函式
3. \`run\` 用正規表達式 \`/\\[([^\\]]+)\\]/g\` 找出 task 中的工具名稱
4. 按順序呼叫工具（只呼叫 tools 裡存在的）
5. 回傳 \`{ task, steps: [{tool, result}], finalAnswer }\`

測試：
- \`agent.run("請用 [search] 找資料")\` → steps 有 1 個，finalAnswer 是 search 的結果
- \`agent.run("[fetch] 然後 [calc]")\` → steps 有 2 個，finalAnswer 是 calc 的結果
- \`agent.run("沒有工具標記")\` → steps 是空的，finalAnswer 是 null
`,SR=`
# World 6：供應鏈商業案例

> **目標：** 用前面學的技術理解供應鏈管理的核心問題
> **重點：** 技術是手段，理解業務才是價值所在
> **資料來源：** DI 專案的 inventory_snapshots.csv、fg_financials.csv、bom_edge.csv、price_history.csv

---

## 6-1：需求預測（Demand Forecasting）

### 為什麼需要預測？

工廠不能等客戶下單才開始做——來不及。從原料採購到成品出貨，通常需要 4～12 週。所以必須**提前預測**未來的需求，先備好原料。

預測太多 → 原料堆在倉庫裡變成成本（倉儲費、資金積壓、過期報廢）
預測太少 → 交不出貨，客戶跑掉（失去訂單、商譽受損）

在 DI 專案中，\`inventory_snapshots.csv\` 記錄了每日庫存快照，\`demand_fg.csv\` 記錄了成品需求。我們的目標是用歷史資料預測未來需求。

### 基本方法：移動平均（Moving Average）

移動平均的概念很簡單——用最近 N 期的平均值來預測下一期。N 就是「窗口大小（window）」。

\`\`\`javascript
// 過去 6 週的出貨需求量
const demand = [100, 120, 90, 110, 130, 95];

// 簡單移動平均（Simple Moving Average）
function movingAverage(data, window) {
  // slice(-window) 取出最後 window 個元素
  const recent = data.slice(-window);
  // reduce 加總後除以個數
  return recent.reduce((sum, x) => sum + x, 0) / recent.length;
}
\`\`\`

#### 逐步拆解 slice(-window)

\`slice(-window)\` 是這個函式的核心技巧。負數索引從陣列尾端開始計算：

\`\`\`javascript
const data = [100, 120, 90, 110, 130, 95];

data.slice(-3);  // → [110, 130, 95]  取最後 3 個
data.slice(-4);  // → [90, 110, 130, 95]  取最後 4 個
data.slice(-6);  // → [100, 120, 90, 110, 130, 95]  全部
\`\`\`

#### 逐步拆解 reduce 加總

\`\`\`javascript
const recent = [110, 130, 95];

// reduce 的運作過程：
// 第 1 輪：sum=0,   x=110 → 0+110   = 110
// 第 2 輪：sum=110, x=130 → 110+130 = 240
// 第 3 輪：sum=240, x=95  → 240+95  = 335
// 最後：335 / 3 = 111.67

recent.reduce((sum, x) => sum + x, 0) / recent.length; // 111.67
\`\`\`

#### 窗口大小怎麼選？

| 窗口大小 | 優點 | 缺點 | 適用情境 |
|----------|------|------|----------|
| 小（2-3） | 反應快，能跟上趨勢 | 波動大，容易受極端值影響 | 需求變化快的短週期產品 |
| 中（4-6） | 平衡穩定性與反應性 | 中等延遲 | 大多數情況的合理選擇 |
| 大（8-12） | 很穩定，過濾雜訊 | 反應慢，跟不上趨勢 | 需求穩定的成熟產品 |

#### 完整範例：用 DI 專案資料做預測

\`\`\`javascript
// DI 專案中 FG-001 過去 8 週的出貨量
const fg001Demand = [450, 520, 480, 510, 490, 530, 500, 540];

// 用 3 週窗口預測第 9 週
const forecast3 = movingAverage(fg001Demand, 3);
// slice(-3) → [500, 530, 540]
// (500 + 530 + 540) / 3 = 523.33

// 用 5 週窗口預測第 9 週
const forecast5 = movingAverage(fg001Demand, 5);
// slice(-5) → [490, 530, 500, 540, 510] — 不對，讓我重新算
// slice(-5) → [490, 530, 500, 540] — 還是不對
// 正確：slice(-5) → [510, 490, 530, 500, 540]
// (510 + 490 + 530 + 500 + 540) / 5 = 514.00
\`\`\`

### 預測的評估指標：MAE

光做預測不夠，還要衡量預測**準不準**。MAE（Mean Absolute Error，平均絕對誤差）是最直觀的指標。

| 指標 | 公式 | 說明 |
|------|------|------|
| MAE | Σ|actual - predicted| / n | 預測值和實際值的平均差距 |
| MAPE | Σ(|actual - predicted| / actual) / n × 100% | 用百分比表示，跨品項可比較 |
| Bias | Σ(actual - predicted) / n | 正值=持續低估，負值=持續高估 |

\`\`\`javascript
function mae(actual, predicted) {
  // 對每一期：算出 |實際值 - 預測值|
  const errors = actual.map((a, i) => Math.abs(a - predicted[i]));
  // 加總所有絕對誤差，再除以期數
  return errors.reduce((s, e) => s + e, 0) / errors.length;
}
\`\`\`

#### 逐步拆解 MAE 計算

\`\`\`javascript
const actual    = [500, 530, 510, 540];
const predicted = [480, 520, 530, 510];

// Step 1: 算每期的絕對誤差
// |500-480| = 20
// |530-520| = 10
// |510-530| = 20
// |540-510| = 30
const errors = [20, 10, 20, 30];

// Step 2: 加總並取平均
// (20 + 10 + 20 + 30) / 4 = 20
// MAE = 20，表示平均每期預測偏差 20 個單位
\`\`\`

MAE 越小越好。在 DI 專案中，如果 FG-001 每週出貨約 500 台，MAE = 20 代表約 4% 的誤差率，算是不錯的預測。

### 練習

1. 給定 12 個月的銷量 \`[300, 320, 280, 340, 310, 350, 330, 360, 340, 370, 350, 380]\`，用 3 個月移動平均預測第 13 個月。
2. 回頭驗證：用移動平均預測第 4～12 個月，和實際值比較，算出 MAE。

---

## 6-2：安全庫存策略

### 什麼是安全庫存？

安全庫存 = 「額外多準備的庫存」，用來應對兩種不確定性：

1. **需求不確定性** — 客戶的訂單量每天都不一樣
2. **供應不確定性** — 供應商可能延遲交貨

\`\`\`
正常需求 = 每天 50 個 × 前置時間 14 天 = 700 個
安全庫存 = 額外準備 200 個（應對波動）
實際需要備貨 = 700 + 200 = 900 個
\`\`\`

在 DI 專案的 \`calculator.js\` 中，\`calculateDaysToStockout\` 會從 currentStock 扣除 safetyStock，因為安全庫存是「保護庫存」——正常情況下不該動用。

### 安全庫存公式

\`\`\`
Safety Stock = Z × σ_demand × √LT
\`\`\`

其中：
- **Z** = 服務水準對應的 Z 分數（查表得到）
- **σ_demand** = 每日需求的標準差（需求波動程度）
- **LT** = 前置時間（Lead Time，天數）

\`\`\`javascript
function safetyStock(zScore, demandStdDev, leadTimeDays) {
  return Math.round(zScore * demandStdDev * Math.sqrt(leadTimeDays));
}
\`\`\`

#### 為什麼要 Math.round？

庫存量必須是整數（你不能備 87.3 個零件），所以最後要用 \`Math.round()\` 四捨五入成整數。

#### 為什麼要 Math.sqrt(LT)？

前置時間越長，不確定性越大——但不是線性增長，而是根號關係。這來自統計學中「獨立隨機變數的標準差」規則：如果每天需求的標準差是 σ，那 n 天累計需求的標準差是 σ × √n。

### Z 分數速查表

| 服務水準 | Z 值 | 缺貨機率 | 典型應用 |
|----------|------|----------|----------|
| 85% | 1.04 | 15% | 低重要性零件 |
| 90% | 1.28 | 10% | 一般零件 |
| 95% | 1.65 | 5% | 重要零件（最常用） |
| 97% | 1.88 | 3% | 關鍵零件 |
| 99% | 2.33 | 1% | 不能斷料的核心零件 |
| 99.9% | 3.09 | 0.1% | 安全相關或極高價值零件 |

### 逐步計算範例

\`\`\`javascript
// COMP-001：前置時間 10 天，日需求標準差 15，目標 95% 服務水準

// Step 1: 查表得 Z = 1.65
const z = 1.65;

// Step 2: 代入公式
// SS = 1.65 × 15 × √10
// SS = 1.65 × 15 × 3.162
// SS = 78.26

// Step 3: 四捨五入
const ss = safetyStock(1.65, 15, 10);
// Math.round(78.26) = 78 個

// 再算一個：COMP-002，前置時間 21 天，標準差 25，目標 99%
const ss2 = safetyStock(2.33, 25, 21);
// 2.33 × 25 × √21 = 2.33 × 25 × 4.583 = 267.0
// Math.round(267.0) = 267 個
\`\`\`

### 服務水準 vs 成本的取捨

提高服務水準 = 增加安全庫存 = 更多資金被綁在倉庫裡。

\`\`\`javascript
// 同樣的零件（σ=15, LT=10），不同服務水準需要的安全庫存：
safetyStock(1.28, 15, 10); // 90%: 61 個
safetyStock(1.65, 15, 10); // 95%: 78 個
safetyStock(2.33, 15, 10); // 99%: 111 個
safetyStock(3.09, 15, 10); // 99.9%: 147 個

// 從 95% 提升到 99%，安全庫存增加 42%
// 從 99% 提升到 99.9%，安全庫存再增加 32%
// 邊際成本越來越高！
\`\`\`

### 練習

1. 算 COMP-003 的安全庫存（日需求標準差 30，前置時間 7 天，目標 95%）。
2. 如果服務水準從 95% 提高到 99%，安全庫存增加多少個？增加百分比是多少？

---

## 6-3：BOM 成本分析

### 什麼是 BOM？

BOM（Bill of Materials，物料清單）描述了「一個成品由哪些零件組成、各需要幾個」。它像一份食譜——告訴你做一台筆電需要哪些原料和數量。

\`\`\`
FG-001（筆記型電腦）
├── CPU × 1          單價 $120
├── 記憶體 × 2       單價 $35
├── SSD × 1          單價 $55
├── 螢幕 × 1         單價 $80
├── 鍵盤 × 1         單價 $15
└── 電池 × 1         單價 $40
\`\`\`

### 成本加總的基本邏輯

\`\`\`javascript
function productCost(components, priceMap) {
  let total = 0;
  for (const comp of components) {
    // 從 priceMap 查價格，如果查不到（缺資料）就用 0
    const unitPrice = priceMap[comp.material] || 0;
    total += comp.quantity * unitPrice;
  }
  return total;
}
\`\`\`

#### 為什麼 missing price = 0？

實務上，並非所有零件都有即時報價。可能是新零件還沒建檔，或是價格系統還沒同步。用 \`|| 0\` 確保程式不會因為 \`undefined × quantity = NaN\` 而崩潰。但要記住：**結果會偏低**，後續分析要留意。

#### 逐步計算範例

\`\`\`javascript
const components = [
  { material: "CPU-A1",     quantity: 1 },
  { material: "RAM-B2",     quantity: 2 },
  { material: "SSD-C3",     quantity: 1 },
  { material: "SCREEN-D4",  quantity: 1 },
  { material: "KB-E5",      quantity: 1 },
  { material: "BATT-F6",    quantity: 1 }
];

const priceMap = {
  "CPU-A1":    120,
  "RAM-B2":    35,
  "SSD-C3":    55,
  "SCREEN-D4": 80,
  "KB-E5":     15
  // 注意：BATT-F6 沒有價格資料！
};

const cost = productCost(components, priceMap);

// 計算過程：
// CPU-A1:    1 × 120 = 120
// RAM-B2:    2 × 35  = 70
// SSD-C3:    1 × 55  = 55
// SCREEN-D4: 1 × 80  = 80
// KB-E5:     1 × 15  = 15
// BATT-F6:   1 × 0   = 0   ← 價格缺失，用 0
// 合計：120 + 70 + 55 + 80 + 15 + 0 = 340
\`\`\`

### DI 專案中的 fg_financials.csv

\`\`\`
material_code | unit_margin | unit_price
FG-001        | 0.25        | 150.00
FG-002        | 0.35        | 280.00
FG-003        | 0.20        | 95.00
\`\`\`

\`unit_margin = 0.25\` 表示 25% 毛利率：
- 售價 = $150.00
- 成本 = 150 × (1 - 0.25) = $112.50
- 毛利 = 150 × 0.25 = $37.50

### 成本分析的商業價值

| 應用場景 | 做法 | 目標 |
|----------|------|------|
| 定價決策 | 成本 + 目標利潤 = 售價 | 確保每台賺錢 |
| 降本優先排序 | 找出佔成本比例最高的零件 | 用力談判最貴的零件 |
| 供應商比價 | 同一零件比較不同供應商報價 | 選最划算的來源 |
| 替代料評估 | 比較替代零件的成本差異 | 在不影響品質下降本 |

### 練習

1. 給定 components 陣列和 priceMap，用 \`productCost\` 算出總成本。
2. 如果某個零件漲價 15%，重新算成本，看影響多少。

---

## 6-4：風險量化

### 為什麼要量化風險？

供應鏈每天面對各種風險。光說「這個供應商有風險」沒用——要用**數字**表達風險的大小，才能：

1. 比較不同風險的嚴重程度
2. 決定優先處理哪個
3. 說服主管撥預算來處理

### 供應鏈風險的種類

| 風險類型 | 例子 | 影響 |
|----------|------|------|
| 供應風險 | 供應商倒閉、工廠大火、原料短缺 | 拿不到原料，產線停擺 |
| 需求風險 | 需求暴增或暴跌、季節波動 | 缺貨或庫存過多 |
| 價格風險 | 原料價格飆升、匯率波動 | 利潤減少甚至虧損 |
| 品質風險 | 來料不良率上升、規格變更 | 產線停工、重工成本 |
| 物流風險 | 船期延遲、港口塞車、天災 | 交期延誤、客戶罰款 |

### 風險分數公式

\`\`\`
Risk Score = Probability × Impact Amount
\`\`\`

\`\`\`javascript
function riskScore(probability, impactAmount) {
  return probability * impactAmount;
}
\`\`\`

#### 計算範例

\`\`\`javascript
// COMP-001：30% 機率缺貨，影響金額 $500,000
riskScore(0.3, 500000);  // → 150,000

// COMP-002：5% 機率缺貨，影響金額 $2,000,000
riskScore(0.05, 2000000); // → 100,000

// COMP-003：80% 機率延遲，影響金額 $50,000
riskScore(0.8, 50000);    // → 40,000

// 結論：COMP-001 的期望損失最高（$150,000），應優先處理
// 雖然 COMP-002 的影響金額更大，但機率低，所以期望損失較小
\`\`\`

### 排序風險：rankRisks

當有很多品項時，需要自動排序——風險最高的排最前面。

\`\`\`javascript
function rankRisks(items) {
  // Step 1: 為每個 item 加上 riskScore 欄位
  const scored = items.map(item => ({
    ...item,
    riskScore: item.probability * item.impactAmount
  }));

  // Step 2: 按 riskScore 從高到低排序（降冪 DESC）
  scored.sort((a, b) => b.riskScore - a.riskScore);

  return scored;
}
\`\`\`

#### 排序比較函式 (a, b) => b.riskScore - a.riskScore 的原理

\`sort()\` 的比較函式規則：
- 回傳**負數** → a 排前面
- 回傳**正數** → b 排前面
- 回傳 0 → 順序不變

\`b.riskScore - a.riskScore\`：
- 如果 b 比 a 大 → 正數 → b 排前面 → **大的在前**（降冪排序）

如果改成 \`a.riskScore - b.riskScore\` 就是升冪排序。

#### 完整範例

\`\`\`javascript
const riskItems = [
  { code: "COMP-001", probability: 0.3,  impactAmount: 500000 },
  { code: "COMP-002", probability: 0.05, impactAmount: 2000000 },
  { code: "COMP-003", probability: 0.8,  impactAmount: 50000 },
  { code: "COMP-004", probability: 0.15, impactAmount: 800000 },
  { code: "COMP-005", probability: 0.6,  impactAmount: 300000 }
];

const ranked = rankRisks(riskItems);

// 排序結果：
// 1. COMP-005: 0.6  × 300,000  = 180,000
// 2. COMP-001: 0.3  × 500,000  = 150,000
// 3. COMP-004: 0.15 × 800,000  = 120,000
// 4. COMP-002: 0.05 × 2,000,000 = 100,000
// 5. COMP-003: 0.8  × 50,000   = 40,000
\`\`\`

### DI 專案中的風險分析

\`src/domains/risk/riskScore.js\` 和 \`profitAtRiskCalculator.js\` 計算的是「Profit at Risk」——如果這個風險發生，會損失多少利潤。這正是 \`riskScore\` 函式的應用。

### 練習

1. 給定 5 個零件的機率和影響金額，用 \`rankRisks\` 排序。
2. 如果 COMP-003 的機率從 80% 降到 10%（風險緩解措施生效），重新排序，看排名變化。

---

## 6-5：場景模擬（What-If Analysis）

### 什麼是場景模擬？

場景模擬是管理者最常用的決策工具。「如果 X 發生，會怎樣？」

\`\`\`
場景 1：供應商 A 交貨延遲 2 週
  → 哪些產品會缺料？損失金額是多少？

場景 2：原料價格上漲 20%
  → 毛利率變多少？哪些產品會虧錢？

場景 3：需求突然增加 50%
  → 庫存能撐幾天？需要提前多少天下單？
\`\`\`

### 不可變性原則（Immutability）

場景模擬的第一條規則：**不能修改原始資料**。你要的是「如果」的結果，不是真的改了現況。

\`\`\`javascript
// ❌ 錯誤：直接修改原始物件
function badWhatIf(base, changes) {
  for (const key of Object.keys(changes)) {
    base[key] *= (1 + changes[key] / 100); // 原始資料被改了！
  }
  return base;
}

// ✅ 正確：先複製，再修改副本
function whatIf(base, changes) {
  // 用 spread operator 淺拷貝
  const scenario = { ...base };

  // 套用百分比變更到指定欄位
  for (const key of Object.keys(changes)) {
    scenario[key] = base[key] * (1 + changes[key] / 100);
  }

  return scenario;
}
\`\`\`

#### Spread operator { ...base } 的作用

\`{ ...base }\` 會建立一個**全新的物件**，把 base 的所有屬性複製過去。修改新物件不會影響原始物件。

\`\`\`javascript
const original = { demand: 500, price: 120, leadTime: 14 };
const copy = { ...original };

copy.demand = 999;
console.log(original.demand); // 500 — 原始物件沒變
console.log(copy.demand);     // 999 — 只有副本被修改
\`\`\`

### 逐步計算範例

\`\`\`javascript
const base = {
  demand: 500,
  unitPrice: 120,
  leadTime: 14,
  safetyStock: 78
};

// 場景：需求增加 30%，價格上漲 15%
const changes = {
  demand: 30,      // +30%
  unitPrice: 15    // +15%
};

const result = whatIf(base, changes);

// 計算過程：
// 1. 複製 base → scenario = { demand: 500, unitPrice: 120, leadTime: 14, safetyStock: 78 }
// 2. changes 有 "demand" → scenario.demand = 500 × (1 + 30/100) = 500 × 1.3 = 650
// 3. changes 有 "unitPrice" → scenario.unitPrice = 120 × (1 + 15/100) = 120 × 1.15 = 138
// 4. leadTime 和 safetyStock 沒在 changes 裡，保持不變

// result = { demand: 650, unitPrice: 138, leadTime: 14, safetyStock: 78 }
\`\`\`

#### 用負數表示下降

\`\`\`javascript
// 場景：需求下降 20%，前置時間縮短 50%
const changes2 = {
  demand: -20,     // -20%
  leadTime: -50    // -50%
};

const result2 = whatIf(base, changes2);
// demand = 500 × (1 + (-20)/100) = 500 × 0.8 = 400
// leadTime = 14 × (1 + (-50)/100) = 14 × 0.5 = 7
\`\`\`

### 結合其他函式做完整分析

場景模擬最有價值的地方是可以把結果丟進其他函式：

\`\`\`javascript
// 基礎情境
const base = { demand: 500, unitPrice: 120, leadTime: 14 };

// 模擬漲價 20%
const scenario = whatIf(base, { unitPrice: 20 });

// 用模擬結果重新算安全庫存
const baseSS = safetyStock(1.65, 15, base.leadTime);       // 93
const scenarioSS = safetyStock(1.65, 15, scenario.leadTime); // 93（沒變，因為沒改 leadTime）

// 用模擬結果重新算成本
const baseCost = base.demand * base.unitPrice;       // 60,000
const scenarioCost = scenario.demand * scenario.unitPrice; // 72,000
// 成本增加 12,000（+20%），因為只改了單價
\`\`\`

### DI 專案中的場景模擬

\`src/domains/risk/whatIfEngine.js\` 讓用戶在 Dashboard 上拖動滑桿調整參數（需求變化、價格變化、交期延遲），即時看到風險分數和庫存天數的變化。核心就是 \`whatIf\` 函式的概念。

### 練習

1. 寫 \`whatIf\` 函式，模擬「原料漲價 20% + 需求增加 15%」的組合場景。
2. 比較基礎情境和模擬情境的總成本差異。
3. 思考：如果要模擬「需求增加 50%」，安全庫存要不要跟著調整？為什麼？

---

## 6-6（Boss）：完整商業簡報

### 情境

你是 DI 系統的供應鏈分析師。主管要你根據一組資料，產出完整的決策報告。

**資料來源：** inventory_snapshots、demand_fg、bom_edge、po_open_lines、fg_financials、price_history

### 報告需要包含什麼？

\`\`\`javascript
function generateReport(data) {
  // 最終要回傳這個結構
  return {
    summary: "...",           // 一段文字摘要
    critical: [...],          // 陣列：critical 狀態的品項
    recommendations: [...],   // 陣列：建議行動
    totalCost: 0              // 數字：影響的總金額
  };
}
\`\`\`

### Step 1：摘要（summary）

用一句話概括全局，讓主管 5 秒內抓到重點。

\`\`\`javascript
// 範例
summary: "5 個成品中有 2 個處於 critical 狀態，預估影響金額 $850,000"
\`\`\`

### Step 2：找出 critical 品項

所謂「critical」通常指：庫存低於安全水位、供應商交期延遲、風險分數超過門檻。

\`\`\`javascript
// 從 data 中篩選 critical 品項
const critical = data.items.filter(item => item.status === "critical");

// 或者用更精確的商業邏輯
const critical = data.items.filter(item =>
  item.daysToStockout < 7 ||
  item.riskScore > 100000
);
\`\`\`

### Step 3：建議（recommendations）

每個 critical 品項都需要對應的建議行動：

\`\`\`javascript
const recommendations = critical.map(item => {
  if (item.daysToStockout < 3) {
    return { code: item.code, action: "緊急催貨", priority: "HIGH" };
  } else if (item.daysToStockout < 7) {
    return { code: item.code, action: "加速交貨", priority: "MEDIUM" };
  } else {
    return { code: item.code, action: "持續監控", priority: "LOW" };
  }
});
\`\`\`

### Step 4：計算 totalCost（含預算限制）

報告要算出處理所有問題的總成本，並在有預算限制時做取捨。

\`\`\`javascript
// 計算總影響金額
const totalCost = critical.reduce((sum, item) => sum + item.impactAmount, 0);

// 如果有預算限制，只選到預算用完為止
function selectWithinBudget(items, budget) {
  // 先按優先順序排序（風險高的先處理）
  const sorted = items.sort((a, b) => b.riskScore - a.riskScore);

  const selected = [];
  let remaining = budget;

  for (const item of sorted) {
    if (item.cost <= remaining) {
      selected.push(item);
      remaining -= item.cost;
    }
  }

  return selected;
}
\`\`\`

### 完整的 generateReport 範例

\`\`\`javascript
function generateReport(data) {
  // 1. 找出 critical 品項
  const critical = data.items.filter(item =>
    item.status === "critical" || item.daysToStockout < 7
  );

  // 2. 計算總影響金額
  const totalCost = critical.reduce(
    (sum, item) => sum + item.impactAmount, 0
  );

  // 3. 產出建議
  const recommendations = critical.map(item => ({
    code: item.code,
    action: item.daysToStockout < 3 ? "緊急催貨" : "加速交貨",
    estimatedCost: item.impactAmount
  }));

  // 4. 如果有預算限制，只保留預算內的建議
  if (data.budget) {
    let remaining = data.budget;
    const filtered = [];
    for (const rec of recommendations) {
      if (rec.estimatedCost <= remaining) {
        filtered.push(rec);
        remaining -= rec.estimatedCost;
      }
    }
    return {
      summary: critical.length + " 個品項處於 critical 狀態，" +
        "預估影響 $" + totalCost.toLocaleString() + "，" +
        "預算限制下可處理 " + filtered.length + " 個",
      critical,
      recommendations: filtered,
      totalCost
    };
  }

  // 5. 沒有預算限制的完整報告
  return {
    summary: critical.length + " 個品項處於 critical 狀態，" +
      "預估影響金額 $" + totalCost.toLocaleString(),
    critical,
    recommendations,
    totalCost
  };
}
\`\`\`

### 報告評分維度

| 維度 | 權重 | 重點 |
|------|------|------|
| 數據正確性 | 30% | 數字有沒有算對？篩選邏輯對不對？ |
| 分析深度 | 25% | 有沒有考慮多個面向（成本、風險、時效）？ |
| 建議可行性 | 25% | 方案能不能實際執行？有沒有考慮預算？ |
| 表達清晰度 | 20% | 主管能不能 30 秒內抓到重點？ |

### 主管可能的追問

準備好回答這些問題：

1. **「為什麼選這個方案而不是那個？」** — 用風險分數和成本效益比來解釋
2. **「如果供應商倒了怎麼辦？」** — 場景模擬的結果 + 備援方案
3. **「預算只有一半怎麼辦？」** — 用 rankRisks 排序，先處理風險最高的
4. **「這個預測準嗎？」** — 用 MAE 數字來回答，並說明信心區間

這就是 DI 專案最終要達成的目標——用 AI + 資料，幫供應鏈管理者做出更好、更快的決策。

### 練習

1. 給定一組包含 5 個品項的資料，寫出完整的 \`generateReport\` 函式。
2. 加上預算限制 $500,000，看看報告輸出有什麼變化。
3. 把前面學的 \`movingAverage\`、\`safetyStock\`、\`riskScore\`、\`whatIf\` 全部整合到報告裡。

---

## 供應鏈術語速查表

| 術語 | 英文 | 說明 | 相關函式 |
|------|------|------|----------|
| 移動平均 | Moving Average | 用近 N 期平均值預測下一期 | \`movingAverage(data, window)\` |
| 平均絕對誤差 | MAE (Mean Absolute Error) | 衡量預測準確度的指標 | \`mae(actual, predicted)\` |
| 安全庫存 | Safety Stock | 額外備貨，應對需求和供應的波動 | \`safetyStock(z, σ, LT)\` |
| 前置時間 | Lead Time | 下單到收貨的時間 | — |
| BOM | Bill of Materials | 物料清單（成品的零件組成） | \`productCost(comps, priceMap)\` |
| 風險分數 | Risk Score | 機率 × 影響金額 = 期望損失 | \`riskScore(p, impact)\` |
| 場景模擬 | What-If Analysis | 假設某參數改變，看結果如何 | \`whatIf(base, changes)\` |
| MOQ | Minimum Order Quantity | 供應商要求的最小訂購量 | — |
| EOQ | Economic Order Quantity | 總成本最低的最佳訂購量 | — |
| 服務水準 | Service Level | 不缺貨的機率（如 95%） | Z 分數查表 |
| Z 分數 | Z-Score | 標準常態分佈的分位數值 | 90%→1.28, 95%→1.65, 99%→2.33 |
| 良率 | Yield Rate | 生產出來合格品的比例 | — |
| 報廢率 | Scrap Rate | 生產過程中損耗的比例 | — |
| 在途庫存 | In-Transit Stock | 已下單但還沒到的庫存 | — |
| 可用庫存 | Available Stock | 在手庫存 - 已配額 - 安全庫存 | — |
| 毛利率 | Gross Margin | (售價 - 成本) / 售價 | fg_financials.csv 的 unit_margin |
| 期望損失 | Expected Loss | 風險發生的機率 × 損失金額 | 同 Risk Score |
`,_R={1:vR,2:xR,3:wR,4:kR,5:bR,6:SR};function CR(e){return _R[e]||null}const r1={"1-1":"Day 1：變數、函式、條件判斷","1-2":"Day 1：變數、函式、條件判斷","1-3":"Day 1：變數、函式、條件判斷","1-4":"Day 2：讀懂 calculator.js","1-5":"Day 3：自己動手寫","1-6":"Day 4：BOM 展開 + 遞迴","2-1":"2-1：什麼是純函式（Pure Function）","2-2":"2-2：輸入驗證（Input Validation）","2-3":"2-3：邊界情況（Edge Cases）","2-4":"2-4：函式組合（Function Composition）","2-5":"2-5：自動化測試","2-6":"2-6（Boss）：BOM 遞迴展開","3-1":"3-1：SELECT — 從資料庫讀資料","3-2":"3-2：WHERE + JOIN — 過濾與合併","3-3":"3-3：GROUP BY + 聚合函式","3-4":"3-4：INSERT + UPDATE — 寫入與修改","3-5":"3-5：RPC 函式 + 子查詢","3-6":"3-6（Boss）：即時查詢挑戰","4-1":"4-1：JSX 基礎 — HTML + JavaScript","4-2":"4-2：Props 與 State","4-3":"4-3：useEffect — 副作用處理","4-4":"4-4：Context — 全域狀態","4-5":"4-5：條件渲染與列表","4-6":"4-6（Boss）：從零寫一個 Dashboard Card","5-1":"5-1：Async/Await — 非同步程式設計","5-2":"5-2：Pub/Sub 模式 — EventBus","5-3":"5-3：Semaphore — 並發控制","5-4":"5-4：Circuit Breaker — 熔斷器","5-5":"5-5：ReAct Loop — Agent 怎麼思考","5-6":"5-6（Boss）：自己寫一個 Mini Agent","6-1":"6-1：需求預測（Demand Forecasting）","6-2":"6-2：安全庫存策略","6-3":"6-3：BOM 成本分析","6-4":"6-4：風險量化","6-5":"6-5：場景模擬（What-If Analysis）","6-6":"6-6（Boss）：完整商業簡報"};function ER(e){return r1[e]||null}function TR(e){const t=r1[e];return t?PR(t):null}function PR(e){return e.toLowerCase().replace(/[^\w\u4e00-\u9fff\s-]/g,"").replace(/\s+/g,"-").replace(/-+/g,"-").trim()}function AR(){const{worldId:e,questId:t,challengeId:n="1"}=ef(),r=Zh(),{dispatch:i,challengeStatus:s}=Ki(),o=Cf(t),a=a2(t,n),l=Kw(e),u=ER(t),c=TR(t),[d,h]=C.useState(""),[f,p]=C.useState(""),[v,w]=C.useState([]),[m,g]=C.useState(!1),[y,k]=C.useState(0),[T,S]=C.useState(0),[P,A]=C.useState(!1),[O,E]=C.useState(!0),L=C.useRef(null),B=C.useRef(null);C.useEffect(()=>{if(a){const b=s[`${t}-${n}`];h((b==null?void 0:b.code)||a.defaultCode||""),w([]),p(""),k(0),S(0),A(!!(b!=null&&b.completed)),E(!0)}},[t,n]);const K=b=>{L.current=b},J=C.useCallback(()=>{if(!a)return;g(!0),p(""),w([]),S(ee=>ee+1),B.current&&B.current.terminate();const b=new Worker(new URL("/assets/codeRunner-QXF6Gltg.js",import.meta.url),{type:"module"});B.current=b,b.onmessage=ee=>{const{success:de,error:re,logs:Qe,testResults:Ct}=ee.data;de?(p(Qe.join(`
`)||"程式碼執行完成"),w(Ct)):(p(`錯誤：${re}`),w([])),g(!1),b.terminate()},b.onerror=ee=>{p(`Worker 錯誤：${ee.message}`),g(!1),b.terminate()},b.postMessage({code:d,tests:a.tests,returnVars:a.returnVars,timeout:5e3})},[d,a]),M=()=>{a&&(h(a.defaultCode||""),p(""),w([]),k(0))},U=()=>{k(b=>Math.min(b+1,3))},X=v.length>0&&v.every(b=>b.passed),I=()=>{if(!X||P)return;const b=Math.round(v.filter(ee=>ee.passed).length/v.length*100);i({type:"COMPLETE_CHALLENGE",payload:{questId:t,challengeId:Number(n),score:b,code:d,usedHints:y,attempts:T,baseXp:o!=null&&o.isBoss?200:50}}),A(!0),o&&o.challenges.every(de=>{var re;return de.id===Number(n)?!0:(re=s[`${t}-${de.id}`])==null?void 0:re.completed})&&i({type:"COMPLETE_QUEST",payload:{questId:t,score:100,bonusXp:o.isBoss?100:50}})},$=o?o.challenges.findIndex(b=>b.id===Number(n)):-1,_=o==null?void 0:o.challenges[$-1],N=o==null?void 0:o.challenges[$+1],q=[a!=null&&a.instruction?`想想看這個挑戰的關鍵：${a.instruction.split("。")[0]}`:"先看清楚題目要求","注意邊界情況：輸入是 0、負數、或 null 的時候怎麼辦？",a!=null&&a.referenceCode?"看看右邊的參考程式碼，關鍵邏輯在那裡面":"試著把問題拆成更小的步驟"];return!a||!o?x.jsx("div",{className:"h-[calc(100vh-73px)] flex items-center justify-center",children:x.jsxs("div",{className:"text-center",children:[x.jsx("p",{className:"text-slate-500 text-lg mb-4",children:"找不到這個挑戰"}),x.jsx(Fe,{to:"/di-quest/map",className:"btn-primary",children:"返回地圖"})]})}):x.jsxs("div",{className:"h-[calc(100vh-73px)] flex flex-col",children:[x.jsxs("div",{className:"flex items-center justify-between px-6 py-3 border-b border-slate-700 bg-slate-900/50",children:[x.jsxs("div",{className:"flex items-center gap-4",children:[x.jsx(Fe,{to:`/di-quest/quest/${e}/${t}`,className:"text-slate-400 hover:text-white transition-colors",children:x.jsx(tf,{className:"w-5 h-5"})}),x.jsxs("div",{children:[x.jsxs("span",{className:"text-slate-500 text-sm",children:[l==null?void 0:l.emoji," World ",e," / ",o.name]}),x.jsxs("h1",{className:"text-white font-medium",children:["挑戰 ",n,": ",a.name,a.difficulty&&x.jsx("span",{className:`ml-2 text-xs px-2 py-0.5 rounded ${a.difficulty==="easy"?"bg-emerald-500/20 text-emerald-400":a.difficulty==="medium"?"bg-yellow-500/20 text-yellow-400":"bg-red-500/20 text-red-400"}`,children:a.difficulty==="easy"?"簡單":a.difficulty==="medium"?"中等":"困難"})]})]}),u&&x.jsxs(Fe,{to:`/di-quest/lesson/${e}${c?`#${c}`:""}`,className:"flex items-center gap-1.5 px-3 py-1.5 bg-brand-primary/10 border border-brand-primary/30 text-brand-primary text-xs rounded-lg hover:bg-brand-primary/20 transition-colors",children:[x.jsx(jr,{className:"w-3.5 h-3.5"}),"📖 ",u]})]}),x.jsxs("div",{className:"flex items-center gap-3",children:[_&&x.jsxs("button",{onClick:()=>r(`/di-quest/arena/${e}/${t}/${_.id}`),className:"flex items-center gap-1 px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors",children:[x.jsx(CC,{className:"w-4 h-4"})," 上一題"]}),N&&x.jsxs("button",{onClick:()=>r(`/di-quest/arena/${e}/${t}/${N.id}`),className:"flex items-center gap-1 px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors",children:["下一題 ",x.jsx(ym,{className:"w-4 h-4"})]}),x.jsx("div",{className:"w-px h-6 bg-slate-700"}),x.jsxs("button",{onClick:M,className:"flex items-center gap-2 px-4 py-2 text-slate-400 hover:text-white transition-colors",children:[x.jsx(jC,{className:"w-4 h-4"}),"重置"]}),x.jsxs("button",{onClick:J,disabled:m,className:"flex items-center gap-2 px-6 py-2 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50",children:[x.jsx(yd,{className:"w-4 h-4"}),m?"執行中...":"執行"]})]})]}),x.jsxs("div",{className:"px-6 py-3 bg-slate-800/50 border-b border-slate-700",children:[x.jsx("p",{className:"text-slate-300 text-sm whitespace-pre-line",children:a.instruction}),a.example&&x.jsxs("div",{className:"mt-3",children:[x.jsxs("button",{onClick:()=>E(!O),className:"flex items-center gap-1.5 text-brand-accent text-sm font-medium hover:text-yellow-300 transition-colors",children:[x.jsx(RC,{className:"w-4 h-4"}),O?"收起範例":"看範例學習",x.jsx(_C,{className:`w-3.5 h-3.5 transition-transform ${O?"rotate-180":""}`})]}),O&&x.jsxs("div",{className:"mt-2 p-3 bg-slate-900/80 border border-brand-accent/20 rounded-lg",children:[x.jsx("p",{className:"text-slate-400 text-xs mb-2",children:a.example.title||"範例"}),x.jsx("pre",{className:"text-sm font-mono text-emerald-300 bg-slate-950 p-3 rounded overflow-x-auto mb-2",children:a.example.code}),a.example.output&&x.jsxs("div",{className:"text-xs text-slate-400",children:[x.jsx("span",{className:"text-slate-500",children:"輸出："}),x.jsx("code",{className:"text-brand-primary ml-1",children:a.example.output})]}),a.example.explanation&&x.jsx("p",{className:"text-xs text-slate-400 mt-2 leading-relaxed",children:a.example.explanation})]})]})]}),x.jsxs("div",{className:"flex-1 flex min-h-0",children:[x.jsxs("div",{className:"flex-1 flex flex-col min-w-0",children:[x.jsxs("div",{className:"px-4 py-2 bg-slate-800 text-slate-400 text-sm flex items-center justify-between",children:[x.jsx("span",{children:"你的程式碼"}),P&&x.jsx("span",{className:"text-emerald-400 text-xs font-bold",children:"已提交"})]}),x.jsx("div",{className:"flex-1",children:x.jsx(yR,{height:"100%",defaultLanguage:"javascript",value:d,onChange:h,onMount:K,theme:"vs-dark",options:{minimap:{enabled:!1},fontSize:14,lineNumbers:"on",roundedSelection:!1,scrollBeyondLastLine:!1,automaticLayout:!0,padding:{top:16},readOnly:P}})})]}),x.jsxs("div",{className:"w-[420px] flex flex-col border-l border-slate-700 bg-slate-900",children:[a.referenceCode&&x.jsxs("div",{className:"max-h-[35%] overflow-auto border-b border-slate-700",children:[x.jsx("div",{className:"px-4 py-2 bg-slate-800 text-slate-400 text-sm",children:"參考：真實專案程式碼"}),x.jsx("pre",{className:"p-4 text-xs font-mono text-slate-400 whitespace-pre-wrap",children:a.referenceCode})]}),x.jsxs("div",{className:"flex-1 overflow-auto",children:[x.jsxs("div",{className:"px-4 py-2 bg-slate-800 text-slate-400 text-sm flex items-center justify-between",children:[x.jsx("span",{children:"測試案例"}),X&&x.jsx("span",{className:"text-emerald-400 text-xs font-bold",children:"全部通過！"})]}),x.jsx("div",{className:"p-4 space-y-3",children:v.length===0?x.jsx("p",{className:"text-slate-500 text-sm text-center py-8",children:"點擊「執行」開始測試"}):v.map((b,ee)=>x.jsxs("div",{className:`p-3 rounded-lg border ${b.passed?"border-emerald-500/30 bg-emerald-500/10":"border-red-500/30 bg-red-500/10"}`,children:[x.jsxs("div",{className:"flex items-center gap-2",children:[b.passed?x.jsx(al,{className:"w-4 h-4 text-emerald-400 flex-shrink-0"}):x.jsx($C,{className:"w-4 h-4 text-red-400 flex-shrink-0"}),x.jsx("span",{className:`text-sm font-medium ${b.passed?"text-emerald-400":"text-red-400"}`,children:b.description})]}),b.error&&x.jsx("p",{className:"text-xs text-red-300 mt-1 pl-6",children:b.error})]},ee))})]}),x.jsxs("div",{className:"h-36 border-t border-slate-700",children:[x.jsx("div",{className:"px-4 py-2 bg-slate-800 text-slate-400 text-sm",children:"執行結果"}),x.jsx("pre",{className:"p-4 text-sm font-mono text-slate-300 h-[calc(100%-36px)] overflow-auto",children:f||"等待執行..."})]})]})]}),x.jsx("div",{className:"border-t border-slate-700 bg-slate-900 p-5 pr-16",children:x.jsxs("div",{className:"flex items-start gap-4 max-w-full",children:[x.jsx("div",{className:"w-12 h-12 rounded-full bg-brand-accent/20 flex items-center justify-center flex-shrink-0",children:x.jsx("span",{className:"text-brand-accent font-bold text-base",children:"小迪"})}),x.jsx("div",{className:"flex-1 min-w-0",children:P?x.jsxs("div",{className:"text-emerald-400 font-medium text-base",children:["太棒了！這關通過了！",N?" 準備好挑戰下一題了嗎？":" 你已經完成這個關卡的所有挑戰！"]}):y>0?x.jsxs("div",{children:[x.jsx("p",{className:"text-slate-200 text-base leading-relaxed mb-3",children:q[y-1]}),x.jsxs("div",{className:"flex items-center gap-3",children:[y<3&&x.jsx("button",{onClick:U,className:"text-brand-accent text-sm hover:underline",children:"需要更多提示？(-20 XP)"}),x.jsxs(Fe,{to:`/di-quest/lesson/${e}`,className:"inline-flex items-center gap-1.5 text-sm text-blue-400 hover:text-blue-300 hover:underline",children:[x.jsx(jr,{className:"w-4 h-4"}),"回去看講義"]})]})]}):X?x.jsx("p",{className:"text-emerald-400 text-base",children:"全部測試都通過了！點「提交答案」完成這個挑戰。"}):v.length>0?x.jsxs("div",{children:[x.jsxs("p",{className:"text-slate-300 text-base",children:["有 ",v.filter(b=>!b.passed).length," 個測試沒過。仔細看看錯誤訊息，想想邊界情況！"]}),x.jsxs(Fe,{to:`/di-quest/lesson/${e}`,className:"inline-flex items-center gap-1.5 text-sm text-blue-400 hover:text-blue-300 hover:underline mt-2",children:[x.jsx(jr,{className:"w-4 h-4"}),"回去看講義"]})]}):x.jsx("p",{className:"text-slate-400 text-base",children:"準備好了就按「執行」跑測試吧！卡住的話可以按右邊的提示按鈕。"})}),x.jsxs("div",{className:"flex items-center gap-2 flex-shrink-0",children:[x.jsxs("button",{onClick:U,disabled:y>=3||P,className:"flex items-center gap-2 px-4 py-2.5 bg-slate-800 text-brand-accent rounded-lg hover:bg-slate-700 transition-colors disabled:opacity-50 text-sm",children:[x.jsx(OC,{className:"w-4 h-4"}),"提示 ",y>0?`(${y}/3)`:""]}),X&&!P&&x.jsxs("button",{onClick:I,className:"flex items-center gap-2 px-6 py-2.5 bg-brand-secondary text-white rounded-lg hover:bg-emerald-600 transition-colors",children:[x.jsx(_x,{className:"w-4 h-4"}),"提交答案"]}),P&&N&&x.jsxs("button",{onClick:()=>r(`/di-quest/arena/${e}/${t}/${N.id}`),className:"flex items-center gap-2 px-6 py-2.5 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors",children:["下一題 ",x.jsx(ym,{className:"w-4 h-4"})]})]})]})})]})}function RR(){const{totalXp:e,levelInfo:t,questStatus:n,challengeStatus:r,streakDays:i}=Ki(),s=Object.values(n).filter(c=>c.completed).length,o=Object.values(r).filter(c=>c.completed).length,a=ln.map(c=>{const d=c.quests.filter(h=>{var f;return(f=n[h.id])==null?void 0:f.completed}).length;return{worldId:c.id,name:`${c.emoji} ${c.name}`,completed:d,total:c.quests.length,pct:c.quests.length>0?Math.round(d/c.quests.length*100):0}}),l=Object.entries(r).filter(([,c])=>c.completed).map(([c,d])=>{const[h,f]=[c.substring(0,c.lastIndexOf("-")),c.substring(c.lastIndexOf("-")+1)];return{key:c,questId:h,challengeId:f,...d}}).sort((c,d)=>(d.earnedXp||0)-(c.earnedXp||0)).slice(0,8),u=[{id:"first_code",name:"第一行程式碼",emoji:"🐣",desc:"完成第一個挑戰",check:()=>o>=1},{id:"streak_3",name:"連續三天",emoji:"🔥",desc:"連續 3 天登入學習",check:()=>i>=3},{id:"streak_7",name:"連續七天",emoji:"🔥",desc:"連續 7 天登入學習",check:()=>i>=7},{id:"world1_done",name:"JS 征服者",emoji:"🏝️",desc:"完成 World 1 所有關卡",check:()=>{var c;return(c=n["1-6"])==null?void 0:c.completed}},{id:"ten_challenges",name:"刷題達人",emoji:"🧪",desc:"完成 10 個挑戰",check:()=>o>=10},{id:"boss_killer",name:"Boss 殺手",emoji:"💎",desc:"通過任何 Boss 關",check:()=>["1-6","2-6","3-6","4-6","5-6","6-6"].some(c=>{var d;return(d=n[c])==null?void 0:d.completed})}];return x.jsxs("div",{className:"max-w-5xl mx-auto p-6",children:[x.jsxs("div",{className:"mb-8",children:[x.jsx("h2",{className:"text-3xl font-bold text-white mb-2",children:"進度儀表板"}),x.jsx("p",{className:"text-slate-400",children:"追蹤你的學習進度與成就"})]}),x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},className:"card mb-6",children:[x.jsxs("div",{className:"flex items-center justify-between mb-6",children:[x.jsxs("div",{className:"flex items-center gap-4",children:[x.jsx("div",{className:"w-16 h-16 rounded-2xl bg-gradient-to-br from-brand-primary to-brand-secondary flex items-center justify-center text-2xl font-bold text-white",children:t.level}),x.jsxs("div",{children:[x.jsx("h3",{className:"text-xl font-bold text-white",children:t.title}),x.jsxs("p",{className:"text-slate-400",children:["Lv.",t.level," 開發者"]})]})]}),x.jsxs("div",{className:"text-right",children:[x.jsxs("div",{className:"flex items-center gap-2 text-2xl font-bold text-white",children:[x.jsx(wm,{className:"w-6 h-6 text-brand-accent"}),e,x.jsxs("span",{className:"text-slate-500 text-lg",children:["/ ",t.xpForNext," XP"]})]}),x.jsxs("p",{className:"text-slate-400 text-sm",children:["還需要 ",Math.max(0,t.xpForNext-e)," XP 升級"]})]})]}),x.jsx("div",{className:"progress-bar h-3",children:x.jsx("div",{className:"progress-fill h-full rounded-full",style:{width:`${Math.round(t.progress*100)}%`}})})]}),x.jsx("div",{className:"grid grid-cols-1 md:grid-cols-4 gap-4 mb-6",children:[{icon:Cx,color:"emerald",label:"完成關卡",value:s},{icon:LC,color:"blue",label:"通過挑戰",value:o},{icon:AC,color:"orange",label:"連續學習",value:`${i} 天`},{icon:wm,color:"purple",label:"總 XP",value:e}].map((c,d)=>x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},transition:{delay:.1+d*.1},className:"card",children:[x.jsxs("div",{className:"flex items-center gap-3 mb-2",children:[x.jsx("div",{className:`w-10 h-10 rounded-lg bg-${c.color}-500/20 flex items-center justify-center`,children:x.jsx(c.icon,{className:`w-5 h-5 text-${c.color}-400`})}),x.jsx("span",{className:"text-slate-400",children:c.label})]}),x.jsx("p",{className:"text-2xl font-bold text-white",children:c.value})]},c.label))}),x.jsxs("div",{className:"grid grid-cols-1 md:grid-cols-2 gap-6",children:[x.jsxs(We.div,{initial:{opacity:0,x:-20},animate:{opacity:1,x:0},transition:{delay:.5},className:"card",children:[x.jsxs("h3",{className:"text-lg font-bold text-white mb-4 flex items-center gap-2",children:[x.jsx(MC,{className:"w-5 h-5 text-brand-primary"}),"世界進度"]}),x.jsx("div",{className:"space-y-4",children:a.map(c=>x.jsxs("div",{children:[x.jsxs("div",{className:"flex items-center justify-between mb-1",children:[x.jsx("span",{className:`text-sm ${c.pct>0?"text-white":"text-slate-500"}`,children:c.name}),x.jsxs("span",{className:`text-sm ${c.pct>0?"text-brand-primary":"text-slate-600"}`,children:[c.completed,"/",c.total," (",c.pct,"%)"]})]}),x.jsx("div",{className:"progress-bar h-2",children:x.jsx("div",{className:"h-full bg-brand-primary rounded-full transition-all duration-500",style:{width:`${c.pct}%`}})})]},c.worldId))})]}),x.jsxs(We.div,{initial:{opacity:0,x:20},animate:{opacity:1,x:0},transition:{delay:.6},className:"card",children:[x.jsxs("h3",{className:"text-lg font-bold text-white mb-4 flex items-center gap-2",children:[x.jsx(TC,{className:"w-5 h-5 text-brand-secondary"}),"已完成的挑戰"]}),x.jsx("div",{className:"space-y-3",children:l.length===0?x.jsx("p",{className:"text-slate-500 text-sm text-center py-4",children:"還沒有完成任何挑戰"}):l.map(c=>x.jsxs("div",{className:"flex items-center justify-between py-2 border-b border-slate-700/50 last:border-0",children:[x.jsxs("div",{className:"flex items-center gap-3",children:[x.jsx("div",{className:"w-2 h-2 rounded-full bg-brand-primary"}),x.jsxs("span",{className:"text-slate-300 text-sm",children:["Quest ",c.questId," - 挑戰 ",c.challengeId]})]}),x.jsxs("span",{className:"text-brand-accent font-medium text-sm",children:["+",c.earnedXp||0," XP"]})]},c.key))})]})]}),x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},transition:{delay:.7},className:"card mt-6",children:[x.jsxs("h3",{className:"text-lg font-bold text-white mb-4 flex items-center gap-2",children:[x.jsx(bC,{className:"w-5 h-5 text-brand-accent"}),"成就"]}),x.jsx("div",{className:"grid grid-cols-2 md:grid-cols-3 gap-4",children:u.map(c=>{const d=c.check();return x.jsxs("div",{className:`p-4 rounded-lg border ${d?"bg-emerald-500/10 border-emerald-500/30":"bg-slate-800/50 border-slate-700 opacity-50"}`,children:[x.jsx("p",{className:"text-2xl mb-2",children:c.emoji}),x.jsx("p",{className:`font-medium text-sm ${d?"text-white":"text-slate-400"}`,children:c.name}),x.jsx("p",{className:`text-xs mt-1 ${d?"text-emerald-400":"text-slate-500"}`,children:c.desc})]},c.id)})})]})]})}function Zl(e,t){var n={};for(var r in e)Object.prototype.hasOwnProperty.call(e,r)&&t.indexOf(r)<0&&(n[r]=e[r]);if(e!=null&&typeof Object.getOwnPropertySymbols=="function")for(var i=0,r=Object.getOwnPropertySymbols(e);i<r.length;i++)t.indexOf(r[i])<0&&Object.prototype.propertyIsEnumerable.call(e,r[i])&&(n[r[i]]=e[r[i]]);return n}function OR(e,t,n,r){function i(s){return s instanceof n?s:new n(function(o){o(s)})}return new(n||(n=Promise))(function(s,o){function a(c){try{u(r.next(c))}catch(d){o(d)}}function l(c){try{u(r.throw(c))}catch(d){o(d)}}function u(c){c.done?s(c.value):i(c.value).then(a,l)}u((r=r.apply(e,t||[])).next())})}const NR=e=>e?(...t)=>e(...t):(...t)=>fetch(...t);class Ef extends Error{constructor(t,n="FunctionsError",r){super(t),this.name=n,this.context=r}}class jR extends Ef{constructor(t){super("Failed to send a request to the Edge Function","FunctionsFetchError",t)}}class Og extends Ef{constructor(t){super("Relay Error invoking the Edge Function","FunctionsRelayError",t)}}class Ng extends Ef{constructor(t){super("Edge Function returned a non-2xx status code","FunctionsHttpError",t)}}var Od;(function(e){e.Any="any",e.ApNortheast1="ap-northeast-1",e.ApNortheast2="ap-northeast-2",e.ApSouth1="ap-south-1",e.ApSoutheast1="ap-southeast-1",e.ApSoutheast2="ap-southeast-2",e.CaCentral1="ca-central-1",e.EuCentral1="eu-central-1",e.EuWest1="eu-west-1",e.EuWest2="eu-west-2",e.EuWest3="eu-west-3",e.SaEast1="sa-east-1",e.UsEast1="us-east-1",e.UsWest1="us-west-1",e.UsWest2="us-west-2"})(Od||(Od={}));class IR{constructor(t,{headers:n={},customFetch:r,region:i=Od.Any}={}){this.url=t,this.headers=n,this.region=i,this.fetch=NR(r)}setAuth(t){this.headers.Authorization=`Bearer ${t}`}invoke(t){return OR(this,arguments,void 0,function*(n,r={}){var i;let s,o;try{const{headers:a,method:l,body:u,signal:c,timeout:d}=r;let h={},{region:f}=r;f||(f=this.region);const p=new URL(`${this.url}/${n}`);f&&f!=="any"&&(h["x-region"]=f,p.searchParams.set("forceFunctionRegion",f));let v;u&&(a&&!Object.prototype.hasOwnProperty.call(a,"Content-Type")||!a)?typeof Blob<"u"&&u instanceof Blob||u instanceof ArrayBuffer?(h["Content-Type"]="application/octet-stream",v=u):typeof u=="string"?(h["Content-Type"]="text/plain",v=u):typeof FormData<"u"&&u instanceof FormData?v=u:(h["Content-Type"]="application/json",v=JSON.stringify(u)):u&&typeof u!="string"&&!(typeof Blob<"u"&&u instanceof Blob)&&!(u instanceof ArrayBuffer)&&!(typeof FormData<"u"&&u instanceof FormData)?v=JSON.stringify(u):v=u;let w=c;d&&(o=new AbortController,s=setTimeout(()=>o.abort(),d),c?(w=o.signal,c.addEventListener("abort",()=>o.abort())):w=o.signal);const m=yield this.fetch(p.toString(),{method:l||"POST",headers:Object.assign(Object.assign(Object.assign({},h),this.headers),a),body:v,signal:w}).catch(T=>{throw new jR(T)}),g=m.headers.get("x-relay-error");if(g&&g==="true")throw new Og(m);if(!m.ok)throw new Ng(m);let y=((i=m.headers.get("Content-Type"))!==null&&i!==void 0?i:"text/plain").split(";")[0].trim(),k;return y==="application/json"?k=yield m.json():y==="application/octet-stream"||y==="application/pdf"?k=yield m.blob():y==="text/event-stream"?k=m:y==="multipart/form-data"?k=yield m.formData():k=yield m.text(),{data:k,error:null,response:m}}catch(a){return{data:null,error:a,response:a instanceof Ng||a instanceof Og?a.context:void 0}}finally{s&&clearTimeout(s)}})}}var DR=class extends Error{constructor(e){super(e.message),this.name="PostgrestError",this.details=e.details,this.hint=e.hint,this.code=e.code}},LR=class{constructor(e){var t,n,r;this.shouldThrowOnError=!1,this.method=e.method,this.url=e.url,this.headers=new Headers(e.headers),this.schema=e.schema,this.body=e.body,this.shouldThrowOnError=(t=e.shouldThrowOnError)!==null&&t!==void 0?t:!1,this.signal=e.signal,this.isMaybeSingle=(n=e.isMaybeSingle)!==null&&n!==void 0?n:!1,this.urlLengthLimit=(r=e.urlLengthLimit)!==null&&r!==void 0?r:8e3,e.fetch?this.fetch=e.fetch:this.fetch=fetch}throwOnError(){return this.shouldThrowOnError=!0,this}setHeader(e,t){return this.headers=new Headers(this.headers),this.headers.set(e,t),this}then(e,t){var n=this;this.schema===void 0||(["GET","HEAD"].includes(this.method)?this.headers.set("Accept-Profile",this.schema):this.headers.set("Content-Profile",this.schema)),this.method!=="GET"&&this.method!=="HEAD"&&this.headers.set("Content-Type","application/json");const r=this.fetch;let i=r(this.url.toString(),{method:this.method,headers:this.headers,body:JSON.stringify(this.body),signal:this.signal}).then(async s=>{let o=null,a=null,l=null,u=s.status,c=s.statusText;if(s.ok){var d,h;if(n.method!=="HEAD"){var f;const w=await s.text();w===""||(n.headers.get("Accept")==="text/csv"||n.headers.get("Accept")&&(!((f=n.headers.get("Accept"))===null||f===void 0)&&f.includes("application/vnd.pgrst.plan+text"))?a=w:a=JSON.parse(w))}const p=(d=n.headers.get("Prefer"))===null||d===void 0?void 0:d.match(/count=(exact|planned|estimated)/),v=(h=s.headers.get("content-range"))===null||h===void 0?void 0:h.split("/");p&&v&&v.length>1&&(l=parseInt(v[1])),n.isMaybeSingle&&Array.isArray(a)&&(a.length>1?(o={code:"PGRST116",details:`Results contain ${a.length} rows, application/vnd.pgrst.object+json requires 1 row`,hint:null,message:"JSON object requested, multiple (or no) rows returned"},a=null,l=null,u=406,c="Not Acceptable"):a.length===1?a=a[0]:a=null)}else{const p=await s.text();try{o=JSON.parse(p),Array.isArray(o)&&s.status===404&&(a=[],o=null,u=200,c="OK")}catch{s.status===404&&p===""?(u=204,c="No Content"):o={message:p}}if(o&&n.shouldThrowOnError)throw new DR(o)}return{error:o,data:a,count:l,status:u,statusText:c}});return this.shouldThrowOnError||(i=i.catch(s=>{var o;let a="",l="",u="";const c=s==null?void 0:s.cause;if(c){var d,h,f,p;const m=(d=c==null?void 0:c.message)!==null&&d!==void 0?d:"",g=(h=c==null?void 0:c.code)!==null&&h!==void 0?h:"";a=`${(f=s==null?void 0:s.name)!==null&&f!==void 0?f:"FetchError"}: ${s==null?void 0:s.message}`,a+=`

Caused by: ${(p=c==null?void 0:c.name)!==null&&p!==void 0?p:"Error"}: ${m}`,g&&(a+=` (${g})`),c!=null&&c.stack&&(a+=`
${c.stack}`)}else{var v;a=(v=s==null?void 0:s.stack)!==null&&v!==void 0?v:""}const w=this.url.toString().length;return(s==null?void 0:s.name)==="AbortError"||(s==null?void 0:s.code)==="ABORT_ERR"?(u="",l="Request was aborted (timeout or manual cancellation)",w>this.urlLengthLimit&&(l+=`. Note: Your request URL is ${w} characters, which may exceed server limits. If selecting many fields, consider using views. If filtering with large arrays (e.g., .in('id', [many IDs])), consider using an RPC function to pass values server-side.`)):((c==null?void 0:c.name)==="HeadersOverflowError"||(c==null?void 0:c.code)==="UND_ERR_HEADERS_OVERFLOW")&&(u="",l="HTTP headers exceeded server limits (typically 16KB)",w>this.urlLengthLimit&&(l+=`. Your request URL is ${w} characters. If selecting many fields, consider using views. If filtering with large arrays (e.g., .in('id', [200+ IDs])), consider using an RPC function instead.`)),{error:{message:`${(o=s==null?void 0:s.name)!==null&&o!==void 0?o:"FetchError"}: ${s==null?void 0:s.message}`,details:a,hint:l,code:u},data:null,count:null,status:0,statusText:""}})),i.then(e,t)}returns(){return this}overrideTypes(){return this}},MR=class extends LR{select(e){let t=!1;const n=(e??"*").split("").map(r=>/\s/.test(r)&&!t?"":(r==='"'&&(t=!t),r)).join("");return this.url.searchParams.set("select",n),this.headers.append("Prefer","return=representation"),this}order(e,{ascending:t=!0,nullsFirst:n,foreignTable:r,referencedTable:i=r}={}){const s=i?`${i}.order`:"order",o=this.url.searchParams.get(s);return this.url.searchParams.set(s,`${o?`${o},`:""}${e}.${t?"asc":"desc"}${n===void 0?"":n?".nullsfirst":".nullslast"}`),this}limit(e,{foreignTable:t,referencedTable:n=t}={}){const r=typeof n>"u"?"limit":`${n}.limit`;return this.url.searchParams.set(r,`${e}`),this}range(e,t,{foreignTable:n,referencedTable:r=n}={}){const i=typeof r>"u"?"offset":`${r}.offset`,s=typeof r>"u"?"limit":`${r}.limit`;return this.url.searchParams.set(i,`${e}`),this.url.searchParams.set(s,`${t-e+1}`),this}abortSignal(e){return this.signal=e,this}single(){return this.headers.set("Accept","application/vnd.pgrst.object+json"),this}maybeSingle(){return this.isMaybeSingle=!0,this}csv(){return this.headers.set("Accept","text/csv"),this}geojson(){return this.headers.set("Accept","application/geo+json"),this}explain({analyze:e=!1,verbose:t=!1,settings:n=!1,buffers:r=!1,wal:i=!1,format:s="text"}={}){var o;const a=[e?"analyze":null,t?"verbose":null,n?"settings":null,r?"buffers":null,i?"wal":null].filter(Boolean).join("|"),l=(o=this.headers.get("Accept"))!==null&&o!==void 0?o:"application/json";return this.headers.set("Accept",`application/vnd.pgrst.plan+${s}; for="${l}"; options=${a};`),s==="json"?this:this}rollback(){return this.headers.append("Prefer","tx=rollback"),this}returns(){return this}maxAffected(e){return this.headers.append("Prefer","handling=strict"),this.headers.append("Prefer",`max-affected=${e}`),this}};const jg=new RegExp("[,()]");var ni=class extends MR{eq(e,t){return this.url.searchParams.append(e,`eq.${t}`),this}neq(e,t){return this.url.searchParams.append(e,`neq.${t}`),this}gt(e,t){return this.url.searchParams.append(e,`gt.${t}`),this}gte(e,t){return this.url.searchParams.append(e,`gte.${t}`),this}lt(e,t){return this.url.searchParams.append(e,`lt.${t}`),this}lte(e,t){return this.url.searchParams.append(e,`lte.${t}`),this}like(e,t){return this.url.searchParams.append(e,`like.${t}`),this}likeAllOf(e,t){return this.url.searchParams.append(e,`like(all).{${t.join(",")}}`),this}likeAnyOf(e,t){return this.url.searchParams.append(e,`like(any).{${t.join(",")}}`),this}ilike(e,t){return this.url.searchParams.append(e,`ilike.${t}`),this}ilikeAllOf(e,t){return this.url.searchParams.append(e,`ilike(all).{${t.join(",")}}`),this}ilikeAnyOf(e,t){return this.url.searchParams.append(e,`ilike(any).{${t.join(",")}}`),this}regexMatch(e,t){return this.url.searchParams.append(e,`match.${t}`),this}regexIMatch(e,t){return this.url.searchParams.append(e,`imatch.${t}`),this}is(e,t){return this.url.searchParams.append(e,`is.${t}`),this}isDistinct(e,t){return this.url.searchParams.append(e,`isdistinct.${t}`),this}in(e,t){const n=Array.from(new Set(t)).map(r=>typeof r=="string"&&jg.test(r)?`"${r}"`:`${r}`).join(",");return this.url.searchParams.append(e,`in.(${n})`),this}notIn(e,t){const n=Array.from(new Set(t)).map(r=>typeof r=="string"&&jg.test(r)?`"${r}"`:`${r}`).join(",");return this.url.searchParams.append(e,`not.in.(${n})`),this}contains(e,t){return typeof t=="string"?this.url.searchParams.append(e,`cs.${t}`):Array.isArray(t)?this.url.searchParams.append(e,`cs.{${t.join(",")}}`):this.url.searchParams.append(e,`cs.${JSON.stringify(t)}`),this}containedBy(e,t){return typeof t=="string"?this.url.searchParams.append(e,`cd.${t}`):Array.isArray(t)?this.url.searchParams.append(e,`cd.{${t.join(",")}}`):this.url.searchParams.append(e,`cd.${JSON.stringify(t)}`),this}rangeGt(e,t){return this.url.searchParams.append(e,`sr.${t}`),this}rangeGte(e,t){return this.url.searchParams.append(e,`nxl.${t}`),this}rangeLt(e,t){return this.url.searchParams.append(e,`sl.${t}`),this}rangeLte(e,t){return this.url.searchParams.append(e,`nxr.${t}`),this}rangeAdjacent(e,t){return this.url.searchParams.append(e,`adj.${t}`),this}overlaps(e,t){return typeof t=="string"?this.url.searchParams.append(e,`ov.${t}`):this.url.searchParams.append(e,`ov.{${t.join(",")}}`),this}textSearch(e,t,{config:n,type:r}={}){let i="";r==="plain"?i="pl":r==="phrase"?i="ph":r==="websearch"&&(i="w");const s=n===void 0?"":`(${n})`;return this.url.searchParams.append(e,`${i}fts${s}.${t}`),this}match(e){return Object.entries(e).filter(([t,n])=>n!==void 0).forEach(([t,n])=>{this.url.searchParams.append(t,`eq.${n}`)}),this}not(e,t,n){return this.url.searchParams.append(e,`not.${t}.${n}`),this}or(e,{foreignTable:t,referencedTable:n=t}={}){const r=n?`${n}.or`:"or";return this.url.searchParams.append(r,`(${e})`),this}filter(e,t,n){return this.url.searchParams.append(e,`${t}.${n}`),this}},BR=class{constructor(e,{headers:t={},schema:n,fetch:r,urlLengthLimit:i=8e3}){this.url=e,this.headers=new Headers(t),this.schema=n,this.fetch=r,this.urlLengthLimit=i}cloneRequestState(){return{url:new URL(this.url.toString()),headers:new Headers(this.headers)}}select(e,t){const{head:n=!1,count:r}=t??{},i=n?"HEAD":"GET";let s=!1;const o=(e??"*").split("").map(u=>/\s/.test(u)&&!s?"":(u==='"'&&(s=!s),u)).join(""),{url:a,headers:l}=this.cloneRequestState();return a.searchParams.set("select",o),r&&l.append("Prefer",`count=${r}`),new ni({method:i,url:a,headers:l,schema:this.schema,fetch:this.fetch,urlLengthLimit:this.urlLengthLimit})}insert(e,{count:t,defaultToNull:n=!0}={}){var r;const i="POST",{url:s,headers:o}=this.cloneRequestState();if(t&&o.append("Prefer",`count=${t}`),n||o.append("Prefer","missing=default"),Array.isArray(e)){const a=e.reduce((l,u)=>l.concat(Object.keys(u)),[]);if(a.length>0){const l=[...new Set(a)].map(u=>`"${u}"`);s.searchParams.set("columns",l.join(","))}}return new ni({method:i,url:s,headers:o,schema:this.schema,body:e,fetch:(r=this.fetch)!==null&&r!==void 0?r:fetch,urlLengthLimit:this.urlLengthLimit})}upsert(e,{onConflict:t,ignoreDuplicates:n=!1,count:r,defaultToNull:i=!0}={}){var s;const o="POST",{url:a,headers:l}=this.cloneRequestState();if(l.append("Prefer",`resolution=${n?"ignore":"merge"}-duplicates`),t!==void 0&&a.searchParams.set("on_conflict",t),r&&l.append("Prefer",`count=${r}`),i||l.append("Prefer","missing=default"),Array.isArray(e)){const u=e.reduce((c,d)=>c.concat(Object.keys(d)),[]);if(u.length>0){const c=[...new Set(u)].map(d=>`"${d}"`);a.searchParams.set("columns",c.join(","))}}return new ni({method:o,url:a,headers:l,schema:this.schema,body:e,fetch:(s=this.fetch)!==null&&s!==void 0?s:fetch,urlLengthLimit:this.urlLengthLimit})}update(e,{count:t}={}){var n;const r="PATCH",{url:i,headers:s}=this.cloneRequestState();return t&&s.append("Prefer",`count=${t}`),new ni({method:r,url:i,headers:s,schema:this.schema,body:e,fetch:(n=this.fetch)!==null&&n!==void 0?n:fetch,urlLengthLimit:this.urlLengthLimit})}delete({count:e}={}){var t;const n="DELETE",{url:r,headers:i}=this.cloneRequestState();return e&&i.append("Prefer",`count=${e}`),new ni({method:n,url:r,headers:i,schema:this.schema,fetch:(t=this.fetch)!==null&&t!==void 0?t:fetch,urlLengthLimit:this.urlLengthLimit})}};function fo(e){"@babel/helpers - typeof";return fo=typeof Symbol=="function"&&typeof Symbol.iterator=="symbol"?function(t){return typeof t}:function(t){return t&&typeof Symbol=="function"&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},fo(e)}function FR(e,t){if(fo(e)!="object"||!e)return e;var n=e[Symbol.toPrimitive];if(n!==void 0){var r=n.call(e,t);if(fo(r)!="object")return r;throw new TypeError("@@toPrimitive must return a primitive value.")}return(t==="string"?String:Number)(e)}function $R(e){var t=FR(e,"string");return fo(t)=="symbol"?t:t+""}function UR(e,t,n){return(t=$R(t))in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function Ig(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter(function(i){return Object.getOwnPropertyDescriptor(e,i).enumerable})),n.push.apply(n,r)}return n}function oa(e){for(var t=1;t<arguments.length;t++){var n=arguments[t]!=null?arguments[t]:{};t%2?Ig(Object(n),!0).forEach(function(r){UR(e,r,n[r])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):Ig(Object(n)).forEach(function(r){Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(n,r))})}return e}var VR=class i1{constructor(t,{headers:n={},schema:r,fetch:i,timeout:s,urlLengthLimit:o=8e3}={}){this.url=t,this.headers=new Headers(n),this.schemaName=r,this.urlLengthLimit=o;const a=i??globalThis.fetch;s!==void 0&&s>0?this.fetch=(l,u)=>{const c=new AbortController,d=setTimeout(()=>c.abort(),s),h=u==null?void 0:u.signal;if(h){if(h.aborted)return clearTimeout(d),a(l,u);const f=()=>{clearTimeout(d),c.abort()};return h.addEventListener("abort",f,{once:!0}),a(l,oa(oa({},u),{},{signal:c.signal})).finally(()=>{clearTimeout(d),h.removeEventListener("abort",f)})}return a(l,oa(oa({},u),{},{signal:c.signal})).finally(()=>clearTimeout(d))}:this.fetch=a}from(t){if(!t||typeof t!="string"||t.trim()==="")throw new Error("Invalid relation name: relation must be a non-empty string.");return new BR(new URL(`${this.url}/${t}`),{headers:new Headers(this.headers),schema:this.schemaName,fetch:this.fetch,urlLengthLimit:this.urlLengthLimit})}schema(t){return new i1(this.url,{headers:this.headers,schema:t,fetch:this.fetch,urlLengthLimit:this.urlLengthLimit})}rpc(t,n={},{head:r=!1,get:i=!1,count:s}={}){var o;let a;const l=new URL(`${this.url}/rpc/${t}`);let u;const c=f=>f!==null&&typeof f=="object"&&(!Array.isArray(f)||f.some(c)),d=r&&Object.values(n).some(c);d?(a="POST",u=n):r||i?(a=r?"HEAD":"GET",Object.entries(n).filter(([f,p])=>p!==void 0).map(([f,p])=>[f,Array.isArray(p)?`{${p.join(",")}}`:`${p}`]).forEach(([f,p])=>{l.searchParams.append(f,p)})):(a="POST",u=n);const h=new Headers(this.headers);return d?h.set("Prefer",s?`count=${s},return=minimal`:"return=minimal"):s&&h.set("Prefer",`count=${s}`),new ni({method:a,url:l,headers:h,schema:this.schemaName,body:u,fetch:(o=this.fetch)!==null&&o!==void 0?o:fetch,urlLengthLimit:this.urlLengthLimit})}};class zR{constructor(){}static detectEnvironment(){var t;if(typeof WebSocket<"u")return{type:"native",constructor:WebSocket};if(typeof globalThis<"u"&&typeof globalThis.WebSocket<"u")return{type:"native",constructor:globalThis.WebSocket};if(typeof global<"u"&&typeof global.WebSocket<"u")return{type:"native",constructor:global.WebSocket};if(typeof globalThis<"u"&&typeof globalThis.WebSocketPair<"u"&&typeof globalThis.WebSocket>"u")return{type:"cloudflare",error:"Cloudflare Workers detected. WebSocket clients are not supported in Cloudflare Workers.",workaround:"Use Cloudflare Workers WebSocket API for server-side WebSocket handling, or deploy to a different runtime."};if(typeof globalThis<"u"&&globalThis.EdgeRuntime||typeof navigator<"u"&&(!((t=navigator.userAgent)===null||t===void 0)&&t.includes("Vercel-Edge")))return{type:"unsupported",error:"Edge runtime detected (Vercel Edge/Netlify Edge). WebSockets are not supported in edge functions.",workaround:"Use serverless functions or a different deployment target for WebSocket functionality."};const n=globalThis.process;if(n){const r=n.versions;if(r&&r.node){const i=r.node,s=parseInt(i.replace(/^v/,"").split(".")[0]);return s>=22?typeof globalThis.WebSocket<"u"?{type:"native",constructor:globalThis.WebSocket}:{type:"unsupported",error:`Node.js ${s} detected but native WebSocket not found.`,workaround:"Provide a WebSocket implementation via the transport option."}:{type:"unsupported",error:`Node.js ${s} detected without native WebSocket support.`,workaround:`For Node.js < 22, install "ws" package and provide it via the transport option:
import ws from "ws"
new RealtimeClient(url, { transport: ws })`}}}return{type:"unsupported",error:"Unknown JavaScript runtime without WebSocket support.",workaround:"Ensure you're running in a supported environment (browser, Node.js, Deno) or provide a custom WebSocket implementation."}}static getWebSocketConstructor(){const t=this.detectEnvironment();if(t.constructor)return t.constructor;let n=t.error||"WebSocket not supported in this environment.";throw t.workaround&&(n+=`

Suggested solution: ${t.workaround}`),new Error(n)}static isWebSocketSupported(){try{const t=this.detectEnvironment();return t.type==="native"||t.type==="ws"}catch{return!1}}}const qR="2.100.1",HR=`realtime-js/${qR}`,WR="1.0.0",s1="2.0.0",GR=s1,KR=1e4,JR=100,$n={closed:"closed",errored:"errored",joined:"joined",joining:"joining",leaving:"leaving"},o1={close:"phx_close",error:"phx_error",join:"phx_join",leave:"phx_leave",access_token:"access_token"},Nd={connecting:"connecting",closing:"closing",closed:"closed"};class QR{constructor(t){this.HEADER_LENGTH=1,this.USER_BROADCAST_PUSH_META_LENGTH=6,this.KINDS={userBroadcastPush:3,userBroadcast:4},this.BINARY_ENCODING=0,this.JSON_ENCODING=1,this.BROADCAST_EVENT="broadcast",this.allowedMetadataKeys=[],this.allowedMetadataKeys=t??[]}encode(t,n){if(t.event===this.BROADCAST_EVENT&&!(t.payload instanceof ArrayBuffer)&&typeof t.payload.event=="string")return n(this._binaryEncodeUserBroadcastPush(t));let r=[t.join_ref,t.ref,t.topic,t.event,t.payload];return n(JSON.stringify(r))}_binaryEncodeUserBroadcastPush(t){var n;return this._isArrayBuffer((n=t.payload)===null||n===void 0?void 0:n.payload)?this._encodeBinaryUserBroadcastPush(t):this._encodeJsonUserBroadcastPush(t)}_encodeBinaryUserBroadcastPush(t){var n,r;const i=(r=(n=t.payload)===null||n===void 0?void 0:n.payload)!==null&&r!==void 0?r:new ArrayBuffer(0);return this._encodeUserBroadcastPush(t,this.BINARY_ENCODING,i)}_encodeJsonUserBroadcastPush(t){var n,r;const i=(r=(n=t.payload)===null||n===void 0?void 0:n.payload)!==null&&r!==void 0?r:{},o=new TextEncoder().encode(JSON.stringify(i)).buffer;return this._encodeUserBroadcastPush(t,this.JSON_ENCODING,o)}_encodeUserBroadcastPush(t,n,r){var i,s;const o=t.topic,a=(i=t.ref)!==null&&i!==void 0?i:"",l=(s=t.join_ref)!==null&&s!==void 0?s:"",u=t.payload.event,c=this.allowedMetadataKeys?this._pick(t.payload,this.allowedMetadataKeys):{},d=Object.keys(c).length===0?"":JSON.stringify(c);if(l.length>255)throw new Error(`joinRef length ${l.length} exceeds maximum of 255`);if(a.length>255)throw new Error(`ref length ${a.length} exceeds maximum of 255`);if(o.length>255)throw new Error(`topic length ${o.length} exceeds maximum of 255`);if(u.length>255)throw new Error(`userEvent length ${u.length} exceeds maximum of 255`);if(d.length>255)throw new Error(`metadata length ${d.length} exceeds maximum of 255`);const h=this.USER_BROADCAST_PUSH_META_LENGTH+l.length+a.length+o.length+u.length+d.length,f=new ArrayBuffer(this.HEADER_LENGTH+h);let p=new DataView(f),v=0;p.setUint8(v++,this.KINDS.userBroadcastPush),p.setUint8(v++,l.length),p.setUint8(v++,a.length),p.setUint8(v++,o.length),p.setUint8(v++,u.length),p.setUint8(v++,d.length),p.setUint8(v++,n),Array.from(l,m=>p.setUint8(v++,m.charCodeAt(0))),Array.from(a,m=>p.setUint8(v++,m.charCodeAt(0))),Array.from(o,m=>p.setUint8(v++,m.charCodeAt(0))),Array.from(u,m=>p.setUint8(v++,m.charCodeAt(0))),Array.from(d,m=>p.setUint8(v++,m.charCodeAt(0)));var w=new Uint8Array(f.byteLength+r.byteLength);return w.set(new Uint8Array(f),0),w.set(new Uint8Array(r),f.byteLength),w.buffer}decode(t,n){if(this._isArrayBuffer(t)){let r=this._binaryDecode(t);return n(r)}if(typeof t=="string"){const r=JSON.parse(t),[i,s,o,a,l]=r;return n({join_ref:i,ref:s,topic:o,event:a,payload:l})}return n({})}_binaryDecode(t){const n=new DataView(t),r=n.getUint8(0),i=new TextDecoder;switch(r){case this.KINDS.userBroadcast:return this._decodeUserBroadcast(t,n,i)}}_decodeUserBroadcast(t,n,r){const i=n.getUint8(1),s=n.getUint8(2),o=n.getUint8(3),a=n.getUint8(4);let l=this.HEADER_LENGTH+4;const u=r.decode(t.slice(l,l+i));l=l+i;const c=r.decode(t.slice(l,l+s));l=l+s;const d=r.decode(t.slice(l,l+o));l=l+o;const h=t.slice(l,t.byteLength),f=a===this.JSON_ENCODING?JSON.parse(r.decode(h)):h,p={type:this.BROADCAST_EVENT,event:c,payload:f};return o>0&&(p.meta=JSON.parse(d)),{join_ref:null,ref:null,topic:u,event:this.BROADCAST_EVENT,payload:p}}_isArrayBuffer(t){var n;return t instanceof ArrayBuffer||((n=t==null?void 0:t.constructor)===null||n===void 0?void 0:n.name)==="ArrayBuffer"}_pick(t,n){return!t||typeof t!="object"?{}:Object.fromEntries(Object.entries(t).filter(([r])=>n.includes(r)))}}var he;(function(e){e.abstime="abstime",e.bool="bool",e.date="date",e.daterange="daterange",e.float4="float4",e.float8="float8",e.int2="int2",e.int4="int4",e.int4range="int4range",e.int8="int8",e.int8range="int8range",e.json="json",e.jsonb="jsonb",e.money="money",e.numeric="numeric",e.oid="oid",e.reltime="reltime",e.text="text",e.time="time",e.timestamp="timestamp",e.timestamptz="timestamptz",e.timetz="timetz",e.tsrange="tsrange",e.tstzrange="tstzrange"})(he||(he={}));const Dg=(e,t,n={})=>{var r;const i=(r=n.skipTypes)!==null&&r!==void 0?r:[];return t?Object.keys(t).reduce((s,o)=>(s[o]=XR(o,e,t,i),s),{}):{}},XR=(e,t,n,r)=>{const i=t.find(a=>a.name===e),s=i==null?void 0:i.type,o=n[e];return s&&!r.includes(s)?a1(s,o):jd(o)},a1=(e,t)=>{if(e.charAt(0)==="_"){const n=e.slice(1,e.length);return tO(t,n)}switch(e){case he.bool:return YR(t);case he.float4:case he.float8:case he.int2:case he.int4:case he.int8:case he.numeric:case he.oid:return ZR(t);case he.json:case he.jsonb:return eO(t);case he.timestamp:return nO(t);case he.abstime:case he.date:case he.daterange:case he.int4range:case he.int8range:case he.money:case he.reltime:case he.text:case he.time:case he.timestamptz:case he.timetz:case he.tsrange:case he.tstzrange:return jd(t);default:return jd(t)}},jd=e=>e,YR=e=>{switch(e){case"t":return!0;case"f":return!1;default:return e}},ZR=e=>{if(typeof e=="string"){const t=parseFloat(e);if(!Number.isNaN(t))return t}return e},eO=e=>{if(typeof e=="string")try{return JSON.parse(e)}catch{return e}return e},tO=(e,t)=>{if(typeof e!="string")return e;const n=e.length-1,r=e[n];if(e[0]==="{"&&r==="}"){let s;const o=e.slice(1,n);try{s=JSON.parse("["+o+"]")}catch{s=o?o.split(","):[]}return s.map(a=>a1(t,a))}return e},nO=e=>typeof e=="string"?e.replace(" ","T"):e,l1=e=>{const t=new URL(e);return t.protocol=t.protocol.replace(/^ws/i,"http"),t.pathname=t.pathname.replace(/\/+$/,"").replace(/\/socket\/websocket$/i,"").replace(/\/socket$/i,"").replace(/\/websocket$/i,""),t.pathname===""||t.pathname==="/"?t.pathname="/api/broadcast":t.pathname=t.pathname+"/api/broadcast",t.href};var Ls=e=>typeof e=="function"?e:function(){return e},rO=typeof self<"u"?self:null,ri=typeof window<"u"?window:null,en=rO||ri||globalThis,iO="2.0.0",sO=1e4,oO=1e3,tn={connecting:0,open:1,closing:2,closed:3},rt={closed:"closed",errored:"errored",joined:"joined",joining:"joining",leaving:"leaving"},pn={close:"phx_close",error:"phx_error",join:"phx_join",reply:"phx_reply",leave:"phx_leave"},Id={longpoll:"longpoll",websocket:"websocket"},aO={complete:4},Dd="base64url.bearer.phx.",aa=class{constructor(e,t,n,r){this.channel=e,this.event=t,this.payload=n||function(){return{}},this.receivedResp=null,this.timeout=r,this.timeoutTimer=null,this.recHooks=[],this.sent=!1,this.ref=void 0}resend(e){this.timeout=e,this.reset(),this.send()}send(){this.hasReceived("timeout")||(this.startTimeout(),this.sent=!0,this.channel.socket.push({topic:this.channel.topic,event:this.event,payload:this.payload(),ref:this.ref,join_ref:this.channel.joinRef()}))}receive(e,t){return this.hasReceived(e)&&t(this.receivedResp.response),this.recHooks.push({status:e,callback:t}),this}reset(){this.cancelRefEvent(),this.ref=null,this.refEvent=null,this.receivedResp=null,this.sent=!1}destroy(){this.cancelRefEvent(),this.cancelTimeout()}matchReceive({status:e,response:t,_ref:n}){this.recHooks.filter(r=>r.status===e).forEach(r=>r.callback(t))}cancelRefEvent(){this.refEvent&&this.channel.off(this.refEvent)}cancelTimeout(){clearTimeout(this.timeoutTimer),this.timeoutTimer=null}startTimeout(){this.timeoutTimer&&this.cancelTimeout(),this.ref=this.channel.socket.makeRef(),this.refEvent=this.channel.replyEventName(this.ref),this.channel.on(this.refEvent,e=>{this.cancelRefEvent(),this.cancelTimeout(),this.receivedResp=e,this.matchReceive(e)}),this.timeoutTimer=setTimeout(()=>{this.trigger("timeout",{})},this.timeout)}hasReceived(e){return this.receivedResp&&this.receivedResp.status===e}trigger(e,t){this.channel.trigger(this.refEvent,{status:e,response:t})}},u1=class{constructor(e,t){this.callback=e,this.timerCalc=t,this.timer=void 0,this.tries=0}reset(){this.tries=0,clearTimeout(this.timer)}scheduleTimeout(){clearTimeout(this.timer),this.timer=setTimeout(()=>{this.tries=this.tries+1,this.callback()},this.timerCalc(this.tries+1))}},lO=class{constructor(e,t,n){this.state=rt.closed,this.topic=e,this.params=Ls(t||{}),this.socket=n,this.bindings=[],this.bindingRef=0,this.timeout=this.socket.timeout,this.joinedOnce=!1,this.joinPush=new aa(this,pn.join,this.params,this.timeout),this.pushBuffer=[],this.stateChangeRefs=[],this.rejoinTimer=new u1(()=>{this.socket.isConnected()&&this.rejoin()},this.socket.rejoinAfterMs),this.stateChangeRefs.push(this.socket.onError(()=>this.rejoinTimer.reset())),this.stateChangeRefs.push(this.socket.onOpen(()=>{this.rejoinTimer.reset(),this.isErrored()&&this.rejoin()})),this.joinPush.receive("ok",()=>{this.state=rt.joined,this.rejoinTimer.reset(),this.pushBuffer.forEach(r=>r.send()),this.pushBuffer=[]}),this.joinPush.receive("error",r=>{this.state=rt.errored,this.socket.hasLogger()&&this.socket.log("channel",`error ${this.topic}`,r),this.socket.isConnected()&&this.rejoinTimer.scheduleTimeout()}),this.onClose(()=>{this.rejoinTimer.reset(),this.socket.hasLogger()&&this.socket.log("channel",`close ${this.topic}`),this.state=rt.closed,this.socket.remove(this)}),this.onError(r=>{this.socket.hasLogger()&&this.socket.log("channel",`error ${this.topic}`,r),this.isJoining()&&this.joinPush.reset(),this.state=rt.errored,this.socket.isConnected()&&this.rejoinTimer.scheduleTimeout()}),this.joinPush.receive("timeout",()=>{this.socket.hasLogger()&&this.socket.log("channel",`timeout ${this.topic}`,this.joinPush.timeout),new aa(this,pn.leave,Ls({}),this.timeout).send(),this.state=rt.errored,this.joinPush.reset(),this.socket.isConnected()&&this.rejoinTimer.scheduleTimeout()}),this.on(pn.reply,(r,i)=>{this.trigger(this.replyEventName(i),r)})}join(e=this.timeout){if(this.joinedOnce)throw new Error("tried to join multiple times. 'join' can only be called a single time per channel instance");return this.timeout=e,this.joinedOnce=!0,this.rejoin(),this.joinPush}teardown(){this.pushBuffer.forEach(e=>e.destroy()),this.pushBuffer=[],this.rejoinTimer.reset(),this.joinPush.destroy(),this.state=rt.closed,this.bindings=[]}onClose(e){this.on(pn.close,e)}onError(e){return this.on(pn.error,t=>e(t))}on(e,t){let n=this.bindingRef++;return this.bindings.push({event:e,ref:n,callback:t}),n}off(e,t){this.bindings=this.bindings.filter(n=>!(n.event===e&&(typeof t>"u"||t===n.ref)))}canPush(){return this.socket.isConnected()&&this.isJoined()}push(e,t,n=this.timeout){if(t=t||{},!this.joinedOnce)throw new Error(`tried to push '${e}' to '${this.topic}' before joining. Use channel.join() before pushing events`);let r=new aa(this,e,function(){return t},n);return this.canPush()?r.send():(r.startTimeout(),this.pushBuffer.push(r)),r}leave(e=this.timeout){this.rejoinTimer.reset(),this.joinPush.cancelTimeout(),this.state=rt.leaving;let t=()=>{this.socket.hasLogger()&&this.socket.log("channel",`leave ${this.topic}`),this.trigger(pn.close,"leave")},n=new aa(this,pn.leave,Ls({}),e);return n.receive("ok",()=>t()).receive("timeout",()=>t()),n.send(),this.canPush()||n.trigger("ok",{}),n}onMessage(e,t,n){return t}filterBindings(e,t,n){return!0}isMember(e,t,n,r){return this.topic!==e?!1:r&&r!==this.joinRef()?(this.socket.hasLogger()&&this.socket.log("channel","dropping outdated message",{topic:e,event:t,payload:n,joinRef:r}),!1):!0}joinRef(){return this.joinPush.ref}rejoin(e=this.timeout){this.isLeaving()||(this.socket.leaveOpenTopic(this.topic),this.state=rt.joining,this.joinPush.resend(e))}trigger(e,t,n,r){let i=this.onMessage(e,t,n,r);if(t&&!i)throw new Error("channel onMessage callbacks must return the payload, modified or unmodified");let s=this.bindings.filter(o=>o.event===e&&this.filterBindings(o,t,n));for(let o=0;o<s.length;o++)s[o].callback(i,n,r||this.joinRef())}replyEventName(e){return`chan_reply_${e}`}isClosed(){return this.state===rt.closed}isErrored(){return this.state===rt.errored}isJoined(){return this.state===rt.joined}isJoining(){return this.state===rt.joining}isLeaving(){return this.state===rt.leaving}},yl=class{static request(e,t,n,r,i,s,o){if(en.XDomainRequest){let a=new en.XDomainRequest;return this.xdomainRequest(a,e,t,r,i,s,o)}else if(en.XMLHttpRequest){let a=new en.XMLHttpRequest;return this.xhrRequest(a,e,t,n,r,i,s,o)}else{if(en.fetch&&en.AbortController)return this.fetchRequest(e,t,n,r,i,s,o);throw new Error("No suitable XMLHttpRequest implementation found")}}static fetchRequest(e,t,n,r,i,s,o){let a={method:e,headers:n,body:r},l=null;return i&&(l=new AbortController,setTimeout(()=>l.abort(),i),a.signal=l.signal),en.fetch(t,a).then(u=>u.text()).then(u=>this.parseJSON(u)).then(u=>o&&o(u)).catch(u=>{u.name==="AbortError"&&s?s():o&&o(null)}),l}static xdomainRequest(e,t,n,r,i,s,o){return e.timeout=i,e.open(t,n),e.onload=()=>{let a=this.parseJSON(e.responseText);o&&o(a)},s&&(e.ontimeout=s),e.onprogress=()=>{},e.send(r),e}static xhrRequest(e,t,n,r,i,s,o,a){e.open(t,n,!0),e.timeout=s;for(let[l,u]of Object.entries(r))e.setRequestHeader(l,u);return e.onerror=()=>a&&a(null),e.onreadystatechange=()=>{if(e.readyState===aO.complete&&a){let l=this.parseJSON(e.responseText);a(l)}},o&&(e.ontimeout=o),e.send(i),e}static parseJSON(e){if(!e||e==="")return null;try{return JSON.parse(e)}catch{return console&&console.log("failed to parse JSON response",e),null}}static serialize(e,t){let n=[];for(var r in e){if(!Object.prototype.hasOwnProperty.call(e,r))continue;let i=t?`${t}[${r}]`:r,s=e[r];typeof s=="object"?n.push(this.serialize(s,i)):n.push(encodeURIComponent(i)+"="+encodeURIComponent(s))}return n.join("&")}static appendParams(e,t){if(Object.keys(t).length===0)return e;let n=e.match(/\?/)?"&":"?";return`${e}${n}${this.serialize(t)}`}},uO=e=>{let t="",n=new Uint8Array(e),r=n.byteLength;for(let i=0;i<r;i++)t+=String.fromCharCode(n[i]);return btoa(t)},Jr=class{constructor(e,t){t&&t.length===2&&t[1].startsWith(Dd)&&(this.authToken=atob(t[1].slice(Dd.length))),this.endPoint=null,this.token=null,this.skipHeartbeat=!0,this.reqs=new Set,this.awaitingBatchAck=!1,this.currentBatch=null,this.currentBatchTimer=null,this.batchBuffer=[],this.onopen=function(){},this.onerror=function(){},this.onmessage=function(){},this.onclose=function(){},this.pollEndpoint=this.normalizeEndpoint(e),this.readyState=tn.connecting,setTimeout(()=>this.poll(),0)}normalizeEndpoint(e){return e.replace("ws://","http://").replace("wss://","https://").replace(new RegExp("(.*)/"+Id.websocket),"$1/"+Id.longpoll)}endpointURL(){return yl.appendParams(this.pollEndpoint,{token:this.token})}closeAndRetry(e,t,n){this.close(e,t,n),this.readyState=tn.connecting}ontimeout(){this.onerror("timeout"),this.closeAndRetry(1005,"timeout",!1)}isActive(){return this.readyState===tn.open||this.readyState===tn.connecting}poll(){const e={Accept:"application/json"};this.authToken&&(e["X-Phoenix-AuthToken"]=this.authToken),this.ajax("GET",e,null,()=>this.ontimeout(),t=>{if(t){var{status:n,token:r,messages:i}=t;if(n===410&&this.token!==null){this.onerror(410),this.closeAndRetry(3410,"session_gone",!1);return}this.token=r}else n=0;switch(n){case 200:i.forEach(s=>{setTimeout(()=>this.onmessage({data:s}),0)}),this.poll();break;case 204:this.poll();break;case 410:this.readyState=tn.open,this.onopen({}),this.poll();break;case 403:this.onerror(403),this.close(1008,"forbidden",!1);break;case 0:case 500:this.onerror(500),this.closeAndRetry(1011,"internal server error",500);break;default:throw new Error(`unhandled poll status ${n}`)}})}send(e){typeof e!="string"&&(e=uO(e)),this.currentBatch?this.currentBatch.push(e):this.awaitingBatchAck?this.batchBuffer.push(e):(this.currentBatch=[e],this.currentBatchTimer=setTimeout(()=>{this.batchSend(this.currentBatch),this.currentBatch=null},0))}batchSend(e){this.awaitingBatchAck=!0,this.ajax("POST",{"Content-Type":"application/x-ndjson"},e.join(`
`),()=>this.onerror("timeout"),t=>{this.awaitingBatchAck=!1,!t||t.status!==200?(this.onerror(t&&t.status),this.closeAndRetry(1011,"internal server error",!1)):this.batchBuffer.length>0&&(this.batchSend(this.batchBuffer),this.batchBuffer=[])})}close(e,t,n){for(let i of this.reqs)i.abort();this.readyState=tn.closed;let r=Object.assign({code:1e3,reason:void 0,wasClean:!0},{code:e,reason:t,wasClean:n});this.batchBuffer=[],clearTimeout(this.currentBatchTimer),this.currentBatchTimer=null,typeof CloseEvent<"u"?this.onclose(new CloseEvent("close",r)):this.onclose(r)}ajax(e,t,n,r,i){let s,o=()=>{this.reqs.delete(s),r()};s=yl.request(e,this.endpointURL(),t,n,this.timeout,o,a=>{this.reqs.delete(s),this.isActive()&&i(a)}),this.reqs.add(s)}},cO=class ws{constructor(t,n={}){let r=n.events||{state:"presence_state",diff:"presence_diff"};this.state={},this.pendingDiffs=[],this.channel=t,this.joinRef=null,this.caller={onJoin:function(){},onLeave:function(){},onSync:function(){}},this.channel.on(r.state,i=>{let{onJoin:s,onLeave:o,onSync:a}=this.caller;this.joinRef=this.channel.joinRef(),this.state=ws.syncState(this.state,i,s,o),this.pendingDiffs.forEach(l=>{this.state=ws.syncDiff(this.state,l,s,o)}),this.pendingDiffs=[],a()}),this.channel.on(r.diff,i=>{let{onJoin:s,onLeave:o,onSync:a}=this.caller;this.inPendingSyncState()?this.pendingDiffs.push(i):(this.state=ws.syncDiff(this.state,i,s,o),a())})}onJoin(t){this.caller.onJoin=t}onLeave(t){this.caller.onLeave=t}onSync(t){this.caller.onSync=t}list(t){return ws.list(this.state,t)}inPendingSyncState(){return!this.joinRef||this.joinRef!==this.channel.joinRef()}static syncState(t,n,r,i){let s=this.clone(t),o={},a={};return this.map(s,(l,u)=>{n[l]||(a[l]=u)}),this.map(n,(l,u)=>{let c=s[l];if(c){let d=u.metas.map(v=>v.phx_ref),h=c.metas.map(v=>v.phx_ref),f=u.metas.filter(v=>h.indexOf(v.phx_ref)<0),p=c.metas.filter(v=>d.indexOf(v.phx_ref)<0);f.length>0&&(o[l]=u,o[l].metas=f),p.length>0&&(a[l]=this.clone(c),a[l].metas=p)}else o[l]=u}),this.syncDiff(s,{joins:o,leaves:a},r,i)}static syncDiff(t,n,r,i){let{joins:s,leaves:o}=this.clone(n);return r||(r=function(){}),i||(i=function(){}),this.map(s,(a,l)=>{let u=t[a];if(t[a]=this.clone(l),u){let c=t[a].metas.map(h=>h.phx_ref),d=u.metas.filter(h=>c.indexOf(h.phx_ref)<0);t[a].metas.unshift(...d)}r(a,u,l)}),this.map(o,(a,l)=>{let u=t[a];if(!u)return;let c=l.metas.map(d=>d.phx_ref);u.metas=u.metas.filter(d=>c.indexOf(d.phx_ref)<0),i(a,u,l),u.metas.length===0&&delete t[a]}),t}static list(t,n){return n||(n=function(r,i){return i}),this.map(t,(r,i)=>n(r,i))}static map(t,n){return Object.getOwnPropertyNames(t).map(r=>n(r,t[r]))}static clone(t){return JSON.parse(JSON.stringify(t))}},la={HEADER_LENGTH:1,META_LENGTH:4,KINDS:{push:0,reply:1,broadcast:2},encode(e,t){if(e.payload.constructor===ArrayBuffer)return t(this.binaryEncode(e));{let n=[e.join_ref,e.ref,e.topic,e.event,e.payload];return t(JSON.stringify(n))}},decode(e,t){if(e.constructor===ArrayBuffer)return t(this.binaryDecode(e));{let[n,r,i,s,o]=JSON.parse(e);return t({join_ref:n,ref:r,topic:i,event:s,payload:o})}},binaryEncode(e){let{join_ref:t,ref:n,event:r,topic:i,payload:s}=e,o=this.META_LENGTH+t.length+n.length+i.length+r.length,a=new ArrayBuffer(this.HEADER_LENGTH+o),l=new DataView(a),u=0;l.setUint8(u++,this.KINDS.push),l.setUint8(u++,t.length),l.setUint8(u++,n.length),l.setUint8(u++,i.length),l.setUint8(u++,r.length),Array.from(t,d=>l.setUint8(u++,d.charCodeAt(0))),Array.from(n,d=>l.setUint8(u++,d.charCodeAt(0))),Array.from(i,d=>l.setUint8(u++,d.charCodeAt(0))),Array.from(r,d=>l.setUint8(u++,d.charCodeAt(0)));var c=new Uint8Array(a.byteLength+s.byteLength);return c.set(new Uint8Array(a),0),c.set(new Uint8Array(s),a.byteLength),c.buffer},binaryDecode(e){let t=new DataView(e),n=t.getUint8(0),r=new TextDecoder;switch(n){case this.KINDS.push:return this.decodePush(e,t,r);case this.KINDS.reply:return this.decodeReply(e,t,r);case this.KINDS.broadcast:return this.decodeBroadcast(e,t,r)}},decodePush(e,t,n){let r=t.getUint8(1),i=t.getUint8(2),s=t.getUint8(3),o=this.HEADER_LENGTH+this.META_LENGTH-1,a=n.decode(e.slice(o,o+r));o=o+r;let l=n.decode(e.slice(o,o+i));o=o+i;let u=n.decode(e.slice(o,o+s));o=o+s;let c=e.slice(o,e.byteLength);return{join_ref:a,ref:null,topic:l,event:u,payload:c}},decodeReply(e,t,n){let r=t.getUint8(1),i=t.getUint8(2),s=t.getUint8(3),o=t.getUint8(4),a=this.HEADER_LENGTH+this.META_LENGTH,l=n.decode(e.slice(a,a+r));a=a+r;let u=n.decode(e.slice(a,a+i));a=a+i;let c=n.decode(e.slice(a,a+s));a=a+s;let d=n.decode(e.slice(a,a+o));a=a+o;let h=e.slice(a,e.byteLength),f={status:d,response:h};return{join_ref:l,ref:u,topic:c,event:pn.reply,payload:f}},decodeBroadcast(e,t,n){let r=t.getUint8(1),i=t.getUint8(2),s=this.HEADER_LENGTH+2,o=n.decode(e.slice(s,s+r));s=s+r;let a=n.decode(e.slice(s,s+i));s=s+i;let l=e.slice(s,e.byteLength);return{join_ref:null,ref:null,topic:o,event:a,payload:l}}},dO=class{constructor(e,t={}){this.stateChangeCallbacks={open:[],close:[],error:[],message:[]},this.channels=[],this.sendBuffer=[],this.ref=0,this.fallbackRef=null,this.timeout=t.timeout||sO,this.transport=t.transport||en.WebSocket||Jr,this.conn=void 0,this.primaryPassedHealthCheck=!1,this.longPollFallbackMs=t.longPollFallbackMs,this.fallbackTimer=null,this.sessionStore=t.sessionStorage||en&&en.sessionStorage,this.establishedConnections=0,this.defaultEncoder=la.encode.bind(la),this.defaultDecoder=la.decode.bind(la),this.closeWasClean=!0,this.disconnecting=!1,this.binaryType=t.binaryType||"arraybuffer",this.connectClock=1,this.pageHidden=!1,this.encode=void 0,this.decode=void 0,this.transport!==Jr?(this.encode=t.encode||this.defaultEncoder,this.decode=t.decode||this.defaultDecoder):(this.encode=this.defaultEncoder,this.decode=this.defaultDecoder);let n=null;ri&&ri.addEventListener&&(ri.addEventListener("pagehide",r=>{this.conn&&(this.disconnect(),n=this.connectClock)}),ri.addEventListener("pageshow",r=>{n===this.connectClock&&(n=null,this.connect())}),ri.addEventListener("visibilitychange",()=>{document.visibilityState==="hidden"?this.pageHidden=!0:(this.pageHidden=!1,!this.isConnected()&&!this.closeWasClean&&this.teardown(()=>this.connect()))})),this.heartbeatIntervalMs=t.heartbeatIntervalMs||3e4,this.autoSendHeartbeat=t.autoSendHeartbeat??!0,this.heartbeatCallback=t.heartbeatCallback??(()=>{}),this.rejoinAfterMs=r=>t.rejoinAfterMs?t.rejoinAfterMs(r):[1e3,2e3,5e3][r-1]||1e4,this.reconnectAfterMs=r=>t.reconnectAfterMs?t.reconnectAfterMs(r):[10,50,100,150,200,250,500,1e3,2e3][r-1]||5e3,this.logger=t.logger||null,!this.logger&&t.debug&&(this.logger=(r,i,s)=>{console.log(`${r}: ${i}`,s)}),this.longpollerTimeout=t.longpollerTimeout||2e4,this.params=Ls(t.params||{}),this.endPoint=`${e}/${Id.websocket}`,this.vsn=t.vsn||iO,this.heartbeatTimeoutTimer=null,this.heartbeatTimer=null,this.heartbeatSentAt=null,this.pendingHeartbeatRef=null,this.reconnectTimer=new u1(()=>{if(this.pageHidden){this.log("Not reconnecting as page is hidden!"),this.teardown();return}this.teardown(async()=>{t.beforeReconnect&&await t.beforeReconnect(),this.connect()})},this.reconnectAfterMs),this.authToken=t.authToken}getLongPollTransport(){return Jr}replaceTransport(e){this.connectClock++,this.closeWasClean=!0,clearTimeout(this.fallbackTimer),this.reconnectTimer.reset(),this.conn&&(this.conn.close(),this.conn=null),this.transport=e}protocol(){return location.protocol.match(/^https/)?"wss":"ws"}endPointURL(){let e=yl.appendParams(yl.appendParams(this.endPoint,this.params()),{vsn:this.vsn});return e.charAt(0)!=="/"?e:e.charAt(1)==="/"?`${this.protocol()}:${e}`:`${this.protocol()}://${location.host}${e}`}disconnect(e,t,n){this.connectClock++,this.disconnecting=!0,this.closeWasClean=!0,clearTimeout(this.fallbackTimer),this.reconnectTimer.reset(),this.teardown(()=>{this.disconnecting=!1,e&&e()},t,n)}connect(e){e&&(console&&console.log("passing params to connect is deprecated. Instead pass :params to the Socket constructor"),this.params=Ls(e)),!(this.conn&&!this.disconnecting)&&(this.longPollFallbackMs&&this.transport!==Jr?this.connectWithFallback(Jr,this.longPollFallbackMs):this.transportConnect())}log(e,t,n){this.logger&&this.logger(e,t,n)}hasLogger(){return this.logger!==null}onOpen(e){let t=this.makeRef();return this.stateChangeCallbacks.open.push([t,e]),t}onClose(e){let t=this.makeRef();return this.stateChangeCallbacks.close.push([t,e]),t}onError(e){let t=this.makeRef();return this.stateChangeCallbacks.error.push([t,e]),t}onMessage(e){let t=this.makeRef();return this.stateChangeCallbacks.message.push([t,e]),t}onHeartbeat(e){this.heartbeatCallback=e}ping(e){if(!this.isConnected())return!1;let t=this.makeRef(),n=Date.now();this.push({topic:"phoenix",event:"heartbeat",payload:{},ref:t});let r=this.onMessage(i=>{i.ref===t&&(this.off([r]),e(Date.now()-n))});return!0}transportName(e){switch(e){case Jr:return"LongPoll";default:return e.name}}transportConnect(){this.connectClock++,this.closeWasClean=!1;let e;this.authToken&&(e=["phoenix",`${Dd}${btoa(this.authToken).replace(/=/g,"")}`]),this.conn=new this.transport(this.endPointURL(),e),this.conn.binaryType=this.binaryType,this.conn.timeout=this.longpollerTimeout,this.conn.onopen=()=>this.onConnOpen(),this.conn.onerror=t=>this.onConnError(t),this.conn.onmessage=t=>this.onConnMessage(t),this.conn.onclose=t=>this.onConnClose(t)}getSession(e){return this.sessionStore&&this.sessionStore.getItem(e)}storeSession(e,t){this.sessionStore&&this.sessionStore.setItem(e,t)}connectWithFallback(e,t=2500){clearTimeout(this.fallbackTimer);let n=!1,r=!0,i,s,o=this.transportName(e),a=l=>{this.log("transport",`falling back to ${o}...`,l),this.off([i,s]),r=!1,this.replaceTransport(e),this.transportConnect()};if(this.getSession(`phx:fallback:${o}`))return a("memorized");this.fallbackTimer=setTimeout(a,t),s=this.onError(l=>{this.log("transport","error",l),r&&!n&&(clearTimeout(this.fallbackTimer),a(l))}),this.fallbackRef&&this.off([this.fallbackRef]),this.fallbackRef=this.onOpen(()=>{if(n=!0,!r){let l=this.transportName(e);return this.primaryPassedHealthCheck||this.storeSession(`phx:fallback:${l}`,"true"),this.log("transport",`established ${l} fallback`)}clearTimeout(this.fallbackTimer),this.fallbackTimer=setTimeout(a,t),this.ping(l=>{this.log("transport","connected to primary after",l),this.primaryPassedHealthCheck=!0,clearTimeout(this.fallbackTimer)})}),this.transportConnect()}clearHeartbeats(){clearTimeout(this.heartbeatTimer),clearTimeout(this.heartbeatTimeoutTimer)}onConnOpen(){this.hasLogger()&&this.log("transport",`connected to ${this.endPointURL()}`),this.closeWasClean=!1,this.disconnecting=!1,this.establishedConnections++,this.flushSendBuffer(),this.reconnectTimer.reset(),this.autoSendHeartbeat&&this.resetHeartbeat(),this.triggerStateCallbacks("open")}heartbeatTimeout(){if(this.pendingHeartbeatRef){this.pendingHeartbeatRef=null,this.heartbeatSentAt=null,this.hasLogger()&&this.log("transport","heartbeat timeout. Attempting to re-establish connection");try{this.heartbeatCallback("timeout")}catch(e){this.log("error","error in heartbeat callback",e)}this.triggerChanError(),this.closeWasClean=!1,this.teardown(()=>this.reconnectTimer.scheduleTimeout(),oO,"heartbeat timeout")}}resetHeartbeat(){this.conn&&this.conn.skipHeartbeat||(this.pendingHeartbeatRef=null,this.clearHeartbeats(),this.heartbeatTimer=setTimeout(()=>this.sendHeartbeat(),this.heartbeatIntervalMs))}teardown(e,t,n){if(!this.conn)return e&&e();const r=this.conn;this.waitForBufferDone(r,()=>{t?r.close(t,n||""):r.close(),this.waitForSocketClosed(r,()=>{this.conn===r&&(this.conn.onopen=function(){},this.conn.onerror=function(){},this.conn.onmessage=function(){},this.conn.onclose=function(){},this.conn=null),e&&e()})})}waitForBufferDone(e,t,n=1){if(n===5||!e.bufferedAmount){t();return}setTimeout(()=>{this.waitForBufferDone(e,t,n+1)},150*n)}waitForSocketClosed(e,t,n=1){if(n===5||e.readyState===tn.closed){t();return}setTimeout(()=>{this.waitForSocketClosed(e,t,n+1)},150*n)}onConnClose(e){this.conn&&(this.conn.onclose=()=>{}),this.hasLogger()&&this.log("transport","close",e),this.triggerChanError(),this.clearHeartbeats(),this.closeWasClean||this.reconnectTimer.scheduleTimeout(),this.triggerStateCallbacks("close",e)}onConnError(e){this.hasLogger()&&this.log("transport",e);let t=this.transport,n=this.establishedConnections;this.triggerStateCallbacks("error",e,t,n),(t===this.transport||n>0)&&this.triggerChanError()}triggerChanError(){this.channels.forEach(e=>{e.isErrored()||e.isLeaving()||e.isClosed()||e.trigger(pn.error)})}connectionState(){switch(this.conn&&this.conn.readyState){case tn.connecting:return"connecting";case tn.open:return"open";case tn.closing:return"closing";default:return"closed"}}isConnected(){return this.connectionState()==="open"}remove(e){this.off(e.stateChangeRefs),this.channels=this.channels.filter(t=>t!==e)}off(e){for(let t in this.stateChangeCallbacks)this.stateChangeCallbacks[t]=this.stateChangeCallbacks[t].filter(([n])=>e.indexOf(n)===-1)}channel(e,t={}){let n=new lO(e,t,this);return this.channels.push(n),n}push(e){if(this.hasLogger()){let{topic:t,event:n,payload:r,ref:i,join_ref:s}=e;this.log("push",`${t} ${n} (${s}, ${i})`,r)}this.isConnected()?this.encode(e,t=>this.conn.send(t)):this.sendBuffer.push(()=>this.encode(e,t=>this.conn.send(t)))}makeRef(){let e=this.ref+1;return e===this.ref?this.ref=0:this.ref=e,this.ref.toString()}sendHeartbeat(){if(!this.isConnected()){try{this.heartbeatCallback("disconnected")}catch(e){this.log("error","error in heartbeat callback",e)}return}if(this.pendingHeartbeatRef){this.heartbeatTimeout();return}this.pendingHeartbeatRef=this.makeRef(),this.heartbeatSentAt=Date.now(),this.push({topic:"phoenix",event:"heartbeat",payload:{},ref:this.pendingHeartbeatRef});try{this.heartbeatCallback("sent")}catch(e){this.log("error","error in heartbeat callback",e)}this.heartbeatTimeoutTimer=setTimeout(()=>this.heartbeatTimeout(),this.heartbeatIntervalMs)}flushSendBuffer(){this.isConnected()&&this.sendBuffer.length>0&&(this.sendBuffer.forEach(e=>e()),this.sendBuffer=[])}onConnMessage(e){this.decode(e.data,t=>{let{topic:n,event:r,payload:i,ref:s,join_ref:o}=t;if(s&&s===this.pendingHeartbeatRef){const a=this.heartbeatSentAt?Date.now()-this.heartbeatSentAt:void 0;this.clearHeartbeats();try{this.heartbeatCallback(i.status==="ok"?"ok":"error",a)}catch(l){this.log("error","error in heartbeat callback",l)}this.pendingHeartbeatRef=null,this.heartbeatSentAt=null,this.autoSendHeartbeat&&(this.heartbeatTimer=setTimeout(()=>this.sendHeartbeat(),this.heartbeatIntervalMs))}this.hasLogger()&&this.log("receive",`${i.status||""} ${n} ${r} ${s&&"("+s+")"||""}`.trim(),i);for(let a=0;a<this.channels.length;a++){const l=this.channels[a];l.isMember(n,r,i,o)&&l.trigger(r,i,s,o)}this.triggerStateCallbacks("message",t)})}triggerStateCallbacks(e,...t){try{this.stateChangeCallbacks[e].forEach(([n,r])=>{try{r(...t)}catch(i){this.log("error",`error in ${e} callback`,i)}})}catch(n){this.log("error",`error triggering ${e} callbacks`,n)}}leaveOpenTopic(e){let t=this.channels.find(n=>n.topic===e&&(n.isJoined()||n.isJoining()));t&&(this.hasLogger()&&this.log("transport",`leaving duplicate topic "${e}"`),t.leave())}};class Ms{constructor(t,n){const r=fO(n);this.presence=new cO(t.getChannel(),r),this.presence.onJoin((i,s,o)=>{const a=Ms.onJoinPayload(i,s,o);t.getChannel().trigger("presence",a)}),this.presence.onLeave((i,s,o)=>{const a=Ms.onLeavePayload(i,s,o);t.getChannel().trigger("presence",a)}),this.presence.onSync(()=>{t.getChannel().trigger("presence",{event:"sync"})})}get state(){return Ms.transformState(this.presence.state)}static transformState(t){return t=hO(t),Object.getOwnPropertyNames(t).reduce((n,r)=>{const i=t[r];return n[r]=Oa(i),n},{})}static onJoinPayload(t,n,r){const i=Lg(n),s=Oa(r);return{event:"join",key:t,currentPresences:i,newPresences:s}}static onLeavePayload(t,n,r){const i=Lg(n),s=Oa(r);return{event:"leave",key:t,currentPresences:i,leftPresences:s}}}function Oa(e){return e.metas.map(t=>(t.presence_ref=t.phx_ref,delete t.phx_ref,delete t.phx_ref_prev,t))}function hO(e){return JSON.parse(JSON.stringify(e))}function fO(e){return(e==null?void 0:e.events)&&{events:e.events}}function Lg(e){return e!=null&&e.metas?Oa(e):[]}var Mg;(function(e){e.SYNC="sync",e.JOIN="join",e.LEAVE="leave"})(Mg||(Mg={}));class pO{get state(){return this.presenceAdapter.state}constructor(t,n){this.channel=t,this.presenceAdapter=new Ms(this.channel.channelAdapter,n)}}class mO{constructor(t,n,r){const i=gO(r);this.channel=t.getSocket().channel(n,i),this.socket=t}get state(){return this.channel.state}set state(t){this.channel.state=t}get joinedOnce(){return this.channel.joinedOnce}get joinPush(){return this.channel.joinPush}get rejoinTimer(){return this.channel.rejoinTimer}on(t,n){return this.channel.on(t,n)}off(t,n){this.channel.off(t,n)}subscribe(t){return this.channel.join(t)}unsubscribe(t){return this.channel.leave(t)}teardown(){this.channel.teardown()}onClose(t){this.channel.onClose(t)}onError(t){return this.channel.onError(t)}push(t,n,r){let i;try{i=this.channel.push(t,n,r)}catch{throw`tried to push '${t}' to '${this.channel.topic}' before joining. Use channel.subscribe() before pushing events`}if(this.channel.pushBuffer.length>JR){const s=this.channel.pushBuffer.shift();s.cancelTimeout(),this.socket.log("channel",`discarded push due to buffer overflow: ${s.event}`,s.payload())}return i}updateJoinPayload(t){const n=this.channel.joinPush.payload();this.channel.joinPush.payload=()=>Object.assign(Object.assign({},n),t)}canPush(){return this.socket.isConnected()&&this.state===$n.joined}isJoined(){return this.state===$n.joined}isJoining(){return this.state===$n.joining}isClosed(){return this.state===$n.closed}isLeaving(){return this.state===$n.leaving}updateFilterBindings(t){this.channel.filterBindings=t}updatePayloadTransform(t){this.channel.onMessage=t}getChannel(){return this.channel}}function gO(e){return{config:Object.assign({broadcast:{ack:!1,self:!1},presence:{key:"",enabled:!1},private:!1},e.config)}}var Bg;(function(e){e.ALL="*",e.INSERT="INSERT",e.UPDATE="UPDATE",e.DELETE="DELETE"})(Bg||(Bg={}));var Bs;(function(e){e.BROADCAST="broadcast",e.PRESENCE="presence",e.POSTGRES_CHANGES="postgres_changes",e.SYSTEM="system"})(Bs||(Bs={}));var mn;(function(e){e.SUBSCRIBED="SUBSCRIBED",e.TIMED_OUT="TIMED_OUT",e.CLOSED="CLOSED",e.CHANNEL_ERROR="CHANNEL_ERROR"})(mn||(mn={}));class Fs{get state(){return this.channelAdapter.state}set state(t){this.channelAdapter.state=t}get joinedOnce(){return this.channelAdapter.joinedOnce}get timeout(){return this.socket.timeout}get joinPush(){return this.channelAdapter.joinPush}get rejoinTimer(){return this.channelAdapter.rejoinTimer}constructor(t,n={config:{}},r){var i,s;if(this.topic=t,this.params=n,this.socket=r,this.bindings={},this.subTopic=t.replace(/^realtime:/i,""),this.params.config=Object.assign({broadcast:{ack:!1,self:!1},presence:{key:"",enabled:!1},private:!1},n.config),this.channelAdapter=new mO(this.socket.socketAdapter,t,this.params),this.presence=new pO(this),this._onClose(()=>{this.socket._remove(this)}),this._updateFilterTransform(),this.broadcastEndpointURL=l1(this.socket.socketAdapter.endPointURL()),this.private=this.params.config.private||!1,!this.private&&(!((s=(i=this.params.config)===null||i===void 0?void 0:i.broadcast)===null||s===void 0)&&s.replay))throw`tried to use replay on public channel '${this.topic}'. It must be a private channel.`}subscribe(t,n=this.timeout){var r,i,s;if(this.socket.isConnected()||this.socket.connect(),this.channelAdapter.isClosed()){const{config:{broadcast:o,presence:a,private:l}}=this.params,u=(i=(r=this.bindings.postgres_changes)===null||r===void 0?void 0:r.map(f=>f.filter))!==null&&i!==void 0?i:[],c=!!this.bindings[Bs.PRESENCE]&&this.bindings[Bs.PRESENCE].length>0||((s=this.params.config.presence)===null||s===void 0?void 0:s.enabled)===!0,d={},h={broadcast:o,presence:Object.assign(Object.assign({},a),{enabled:c}),postgres_changes:u,private:l};this.socket.accessTokenValue&&(d.access_token=this.socket.accessTokenValue),this._onError(f=>{t==null||t(mn.CHANNEL_ERROR,f)}),this._onClose(()=>t==null?void 0:t(mn.CLOSED)),this.updateJoinPayload(Object.assign({config:h},d)),this._updateFilterMessage(),this.channelAdapter.subscribe(n).receive("ok",async({postgres_changes:f})=>{if(this.socket._isManualToken()||this.socket.setAuth(),f===void 0){t==null||t(mn.SUBSCRIBED);return}this._updatePostgresBindings(f,t)}).receive("error",f=>{this.state=$n.errored,t==null||t(mn.CHANNEL_ERROR,new Error(JSON.stringify(Object.values(f).join(", ")||"error")))}).receive("timeout",()=>{t==null||t(mn.TIMED_OUT)})}return this}_updatePostgresBindings(t,n){var r;const i=this.bindings.postgres_changes,s=(r=i==null?void 0:i.length)!==null&&r!==void 0?r:0,o=[];for(let a=0;a<s;a++){const l=i[a],{filter:{event:u,schema:c,table:d,filter:h}}=l,f=t&&t[a];if(f&&f.event===u&&Fs.isFilterValueEqual(f.schema,c)&&Fs.isFilterValueEqual(f.table,d)&&Fs.isFilterValueEqual(f.filter,h))o.push(Object.assign(Object.assign({},l),{id:f.id}));else{this.unsubscribe(),this.state=$n.errored,n==null||n(mn.CHANNEL_ERROR,new Error("mismatch between server and client bindings for postgres changes"));return}}this.bindings.postgres_changes=o,this.state!=$n.errored&&n&&n(mn.SUBSCRIBED)}presenceState(){return this.presence.state}async track(t,n={}){return await this.send({type:"presence",event:"track",payload:t},n.timeout||this.timeout)}async untrack(t={}){return await this.send({type:"presence",event:"untrack"},t)}on(t,n,r){if(this.channelAdapter.isJoined()&&t===Bs.PRESENCE)throw this.socket.log("channel",`cannot add presence callbacks for ${this.topic} after joining.`),new Error("cannot add presence callbacks after joining a channel");return this._on(t,n,r)}async httpSend(t,n,r={}){var i;if(n==null)return Promise.reject("Payload is required for httpSend()");const s={apikey:this.socket.apiKey?this.socket.apiKey:"","Content-Type":"application/json"};this.socket.accessTokenValue&&(s.Authorization=`Bearer ${this.socket.accessTokenValue}`);const o={method:"POST",headers:s,body:JSON.stringify({messages:[{topic:this.subTopic,event:t,payload:n,private:this.private}]})},a=await this._fetchWithTimeout(this.broadcastEndpointURL,o,(i=r.timeout)!==null&&i!==void 0?i:this.timeout);if(a.status===202)return{success:!0};let l=a.statusText;try{const u=await a.json();l=u.error||u.message||l}catch{}return Promise.reject(new Error(l))}async send(t,n={}){var r,i;if(!this.channelAdapter.canPush()&&t.type==="broadcast"){console.warn("Realtime send() is automatically falling back to REST API. This behavior will be deprecated in the future. Please use httpSend() explicitly for REST delivery.");const{event:s,payload:o}=t,a={apikey:this.socket.apiKey?this.socket.apiKey:"","Content-Type":"application/json"};this.socket.accessTokenValue&&(a.Authorization=`Bearer ${this.socket.accessTokenValue}`);const l={method:"POST",headers:a,body:JSON.stringify({messages:[{topic:this.subTopic,event:s,payload:o,private:this.private}]})};try{const u=await this._fetchWithTimeout(this.broadcastEndpointURL,l,(r=n.timeout)!==null&&r!==void 0?r:this.timeout);return await((i=u.body)===null||i===void 0?void 0:i.cancel()),u.ok?"ok":"error"}catch(u){return u.name==="AbortError"?"timed out":"error"}}else return new Promise(s=>{var o,a,l;const u=this.channelAdapter.push(t.type,t,n.timeout||this.timeout);t.type==="broadcast"&&!(!((l=(a=(o=this.params)===null||o===void 0?void 0:o.config)===null||a===void 0?void 0:a.broadcast)===null||l===void 0)&&l.ack)&&s("ok"),u.receive("ok",()=>s("ok")),u.receive("error",()=>s("error")),u.receive("timeout",()=>s("timed out"))})}updateJoinPayload(t){this.channelAdapter.updateJoinPayload(t)}async unsubscribe(t=this.timeout){return new Promise(n=>{this.channelAdapter.unsubscribe(t).receive("ok",()=>n("ok")).receive("timeout",()=>n("timed out")).receive("error",()=>n("error"))})}teardown(){this.channelAdapter.teardown()}async _fetchWithTimeout(t,n,r){const i=new AbortController,s=setTimeout(()=>i.abort(),r),o=await this.socket.fetch(t,Object.assign(Object.assign({},n),{signal:i.signal}));return clearTimeout(s),o}_on(t,n,r){const i=t.toLocaleLowerCase(),s=this.channelAdapter.on(t,r),o={type:i,filter:n,callback:r,ref:s};return this.bindings[i]?this.bindings[i].push(o):this.bindings[i]=[o],this._updateFilterMessage(),this}_onClose(t){this.channelAdapter.onClose(t)}_onError(t){this.channelAdapter.onError(t)}_updateFilterMessage(){this.channelAdapter.updateFilterBindings((t,n,r)=>{var i,s,o,a,l,u,c;const d=t.event.toLocaleLowerCase();if(this._notThisChannelEvent(d,r))return!1;const h=(i=this.bindings[d])===null||i===void 0?void 0:i.find(f=>f.ref===t.ref);if(!h)return!0;if(["broadcast","presence","postgres_changes"].includes(d))if("id"in h){const f=h.id,p=(s=h.filter)===null||s===void 0?void 0:s.event;return f&&((o=n.ids)===null||o===void 0?void 0:o.includes(f))&&(p==="*"||(p==null?void 0:p.toLocaleLowerCase())===((a=n.data)===null||a===void 0?void 0:a.type.toLocaleLowerCase()))}else{const f=(u=(l=h==null?void 0:h.filter)===null||l===void 0?void 0:l.event)===null||u===void 0?void 0:u.toLocaleLowerCase();return f==="*"||f===((c=n==null?void 0:n.event)===null||c===void 0?void 0:c.toLocaleLowerCase())}else return h.type.toLocaleLowerCase()===d})}_notThisChannelEvent(t,n){const{close:r,error:i,leave:s,join:o}=o1;return n&&[r,i,s,o].includes(t)&&n!==this.joinPush.ref}_updateFilterTransform(){this.channelAdapter.updatePayloadTransform((t,n,r)=>{if(typeof n=="object"&&"ids"in n){const i=n.data,{schema:s,table:o,commit_timestamp:a,type:l,errors:u}=i;return Object.assign(Object.assign({},{schema:s,table:o,commit_timestamp:a,eventType:l,new:{},old:{},errors:u}),this._getPayloadRecords(i))}return n})}static isFilterValueEqual(t,n){return(t??void 0)===(n??void 0)}_getPayloadRecords(t){const n={new:{},old:{}};return(t.type==="INSERT"||t.type==="UPDATE")&&(n.new=Dg(t.columns,t.record)),(t.type==="UPDATE"||t.type==="DELETE")&&(n.old=Dg(t.columns,t.old_record)),n}}class yO{constructor(t,n){this.socket=new dO(t,n)}get timeout(){return this.socket.timeout}get endPoint(){return this.socket.endPoint}get transport(){return this.socket.transport}get heartbeatIntervalMs(){return this.socket.heartbeatIntervalMs}get heartbeatCallback(){return this.socket.heartbeatCallback}set heartbeatCallback(t){this.socket.heartbeatCallback=t}get heartbeatTimer(){return this.socket.heartbeatTimer}get pendingHeartbeatRef(){return this.socket.pendingHeartbeatRef}get reconnectTimer(){return this.socket.reconnectTimer}get vsn(){return this.socket.vsn}get encode(){return this.socket.encode}get decode(){return this.socket.decode}get reconnectAfterMs(){return this.socket.reconnectAfterMs}get sendBuffer(){return this.socket.sendBuffer}get stateChangeCallbacks(){return this.socket.stateChangeCallbacks}connect(){this.socket.connect()}disconnect(t,n,r,i=1e4){return new Promise(s=>{setTimeout(()=>s("timeout"),i),this.socket.disconnect(()=>{t(),s("ok")},n,r)})}push(t){this.socket.push(t)}log(t,n,r){this.socket.log(t,n,r)}makeRef(){return this.socket.makeRef()}onOpen(t){this.socket.onOpen(t)}onClose(t){this.socket.onClose(t)}onError(t){this.socket.onError(t)}onMessage(t){this.socket.onMessage(t)}isConnected(){return this.socket.isConnected()}isConnecting(){return this.socket.connectionState()==Nd.connecting}isDisconnecting(){return this.socket.connectionState()==Nd.closing}connectionState(){return this.socket.connectionState()}endPointURL(){return this.socket.endPointURL()}sendHeartbeat(){this.socket.sendHeartbeat()}getSocket(){return this.socket}}const vO={HEARTBEAT_INTERVAL:25e3},xO=[1e3,2e3,5e3,1e4],wO=1e4,kO=`
  addEventListener("message", (e) => {
    if (e.data.event === "start") {
      setInterval(() => postMessage({ event: "keepAlive" }), e.data.interval);
    }
  });`;class bO{get endPoint(){return this.socketAdapter.endPoint}get timeout(){return this.socketAdapter.timeout}get transport(){return this.socketAdapter.transport}get heartbeatCallback(){return this.socketAdapter.heartbeatCallback}get heartbeatIntervalMs(){return this.socketAdapter.heartbeatIntervalMs}get heartbeatTimer(){return this.worker?this._workerHeartbeatTimer:this.socketAdapter.heartbeatTimer}get pendingHeartbeatRef(){return this.worker?this._pendingWorkerHeartbeatRef:this.socketAdapter.pendingHeartbeatRef}get reconnectTimer(){return this.socketAdapter.reconnectTimer}get vsn(){return this.socketAdapter.vsn}get encode(){return this.socketAdapter.encode}get decode(){return this.socketAdapter.decode}get reconnectAfterMs(){return this.socketAdapter.reconnectAfterMs}get sendBuffer(){return this.socketAdapter.sendBuffer}get stateChangeCallbacks(){return this.socketAdapter.stateChangeCallbacks}constructor(t,n){var r;if(this.channels=new Array,this.accessTokenValue=null,this.accessToken=null,this.apiKey=null,this.httpEndpoint="",this.headers={},this.params={},this.ref=0,this.serializer=new QR,this._manuallySetToken=!1,this._authPromise=null,this._workerHeartbeatTimer=void 0,this._pendingWorkerHeartbeatRef=null,this._resolveFetch=s=>s?(...o)=>s(...o):(...o)=>fetch(...o),!(!((r=n==null?void 0:n.params)===null||r===void 0)&&r.apikey))throw new Error("API key is required to connect to Realtime");this.apiKey=n.params.apikey;const i=this._initializeOptions(n);this.socketAdapter=new yO(t,i),this.httpEndpoint=l1(t),this.fetch=this._resolveFetch(n==null?void 0:n.fetch)}connect(){if(!(this.isConnecting()||this.isDisconnecting()||this.isConnected())){this.accessToken&&!this._authPromise&&this._setAuthSafely("connect"),this._setupConnectionHandlers();try{this.socketAdapter.connect()}catch(t){const n=t.message;throw n.includes("Node.js")?new Error(`${n}

To use Realtime in Node.js, you need to provide a WebSocket implementation:

Option 1: Use Node.js 22+ which has native WebSocket support
Option 2: Install and provide the "ws" package:

  npm install ws

  import ws from "ws"
  const client = new RealtimeClient(url, {
    ...options,
    transport: ws
  })`):new Error(`WebSocket not available: ${n}`)}this._handleNodeJsRaceCondition()}}endpointURL(){return this.socketAdapter.endPointURL()}async disconnect(t,n){return this.isDisconnecting()?"ok":await this.socketAdapter.disconnect(()=>{clearInterval(this._workerHeartbeatTimer),this._terminateWorker()},t,n)}getChannels(){return this.channels}async removeChannel(t){const n=await t.unsubscribe();return n==="ok"&&t.teardown(),this.channels.length===0&&this.disconnect(),n}async removeAllChannels(){const t=this.channels.map(async r=>{const i=await r.unsubscribe();return r.teardown(),i}),n=await Promise.all(t);return this.disconnect(),n}log(t,n,r){this.socketAdapter.log(t,n,r)}connectionState(){return this.socketAdapter.connectionState()||Nd.closed}isConnected(){return this.socketAdapter.isConnected()}isConnecting(){return this.socketAdapter.isConnecting()}isDisconnecting(){return this.socketAdapter.isDisconnecting()}channel(t,n={config:{}}){const r=`realtime:${t}`,i=this.getChannels().find(s=>s.topic===r);if(i)return i;{const s=new Fs(`realtime:${t}`,n,this);return this.channels.push(s),s}}push(t){this.socketAdapter.push(t)}async setAuth(t=null){this._authPromise=this._performAuth(t);try{await this._authPromise}finally{this._authPromise=null}}_isManualToken(){return this._manuallySetToken}async sendHeartbeat(){this.socketAdapter.sendHeartbeat()}onHeartbeat(t){this.socketAdapter.heartbeatCallback=this._wrapHeartbeatCallback(t)}_makeRef(){return this.socketAdapter.makeRef()}_remove(t){this.channels=this.channels.filter(n=>n.topic!==t.topic)}async _performAuth(t=null){let n,r=!1;if(t)n=t,r=!0;else if(this.accessToken)try{n=await this.accessToken()}catch(i){this.log("error","Error fetching access token from callback",i),n=this.accessTokenValue}else n=this.accessTokenValue;r?this._manuallySetToken=!0:this.accessToken&&(this._manuallySetToken=!1),this.accessTokenValue!=n&&(this.accessTokenValue=n,this.channels.forEach(i=>{const s={access_token:n,version:HR};n&&i.updateJoinPayload(s),i.joinedOnce&&i.channelAdapter.isJoined()&&i.channelAdapter.push(o1.access_token,{access_token:n})}))}async _waitForAuthIfNeeded(){this._authPromise&&await this._authPromise}_setAuthSafely(t="general"){this._isManualToken()||this.setAuth().catch(n=>{this.log("error",`Error setting auth in ${t}`,n)})}_setupConnectionHandlers(){this.socketAdapter.onOpen(()=>{(this._authPromise||(this.accessToken&&!this.accessTokenValue?this.setAuth():Promise.resolve())).catch(n=>{this.log("error","error waiting for auth on connect",n)}),this.worker&&!this.workerRef&&this._startWorkerHeartbeat()}),this.socketAdapter.onClose(()=>{this.worker&&this.workerRef&&this._terminateWorker()}),this.socketAdapter.onMessage(t=>{t.ref&&t.ref===this._pendingWorkerHeartbeatRef&&(this._pendingWorkerHeartbeatRef=null)})}_handleNodeJsRaceCondition(){this.socketAdapter.isConnected()&&this.socketAdapter.getSocket().onConnOpen()}_wrapHeartbeatCallback(t){return(n,r)=>{n=="sent"&&this._setAuthSafely(),t&&t(n,r)}}_startWorkerHeartbeat(){this.workerUrl?this.log("worker",`starting worker for from ${this.workerUrl}`):this.log("worker","starting default worker");const t=this._workerObjectUrl(this.workerUrl);this.workerRef=new Worker(t),this.workerRef.onerror=n=>{this.log("worker","worker error",n.message),this._terminateWorker(),this.disconnect()},this.workerRef.onmessage=n=>{n.data.event==="keepAlive"&&this.sendHeartbeat()},this.workerRef.postMessage({event:"start",interval:this.heartbeatIntervalMs})}_terminateWorker(){this.workerRef&&(this.log("worker","terminating worker"),this.workerRef.terminate(),this.workerRef=void 0)}_workerObjectUrl(t){let n;if(t)n=t;else{const r=new Blob([kO],{type:"application/javascript"});n=URL.createObjectURL(r)}return n}_initializeOptions(t){var n,r,i,s,o,a,l,u,c;this.worker=(n=t==null?void 0:t.worker)!==null&&n!==void 0?n:!1,this.accessToken=(r=t==null?void 0:t.accessToken)!==null&&r!==void 0?r:null;const d={};d.timeout=(i=t==null?void 0:t.timeout)!==null&&i!==void 0?i:KR,d.heartbeatIntervalMs=(s=t==null?void 0:t.heartbeatIntervalMs)!==null&&s!==void 0?s:vO.HEARTBEAT_INTERVAL,d.transport=(o=t==null?void 0:t.transport)!==null&&o!==void 0?o:zR.getWebSocketConstructor(),d.params=t==null?void 0:t.params,d.logger=t==null?void 0:t.logger,d.heartbeatCallback=this._wrapHeartbeatCallback(t==null?void 0:t.heartbeatCallback),d.reconnectAfterMs=(a=t==null?void 0:t.reconnectAfterMs)!==null&&a!==void 0?a:v=>xO[v-1]||wO;let h,f;const p=(l=t==null?void 0:t.vsn)!==null&&l!==void 0?l:GR;switch(p){case WR:h=(v,w)=>w(JSON.stringify(v)),f=(v,w)=>w(JSON.parse(v));break;case s1:h=this.serializer.encode.bind(this.serializer),f=this.serializer.decode.bind(this.serializer);break;default:throw new Error(`Unsupported serializer version: ${d.vsn}`)}if(d.vsn=p,d.encode=(u=t==null?void 0:t.encode)!==null&&u!==void 0?u:h,d.decode=(c=t==null?void 0:t.decode)!==null&&c!==void 0?c:f,d.beforeReconnect=this._reconnectAuth.bind(this),(t!=null&&t.logLevel||t!=null&&t.log_level)&&(this.logLevel=t.logLevel||t.log_level,d.params=Object.assign(Object.assign({},d.params),{log_level:this.logLevel})),this.worker){if(typeof window<"u"&&!window.Worker)throw new Error("Web Worker is not supported");this.workerUrl=t==null?void 0:t.workerUrl,d.autoSendHeartbeat=!this.worker}return d}async _reconnectAuth(){await this._waitForAuthIfNeeded(),this.isConnected()||this.connect()}}var po=class extends Error{constructor(e,t){var n;super(e),this.name="IcebergError",this.status=t.status,this.icebergType=t.icebergType,this.icebergCode=t.icebergCode,this.details=t.details,this.isCommitStateUnknown=t.icebergType==="CommitStateUnknownException"||[500,502,504].includes(t.status)&&((n=t.icebergType)==null?void 0:n.includes("CommitState"))===!0}isNotFound(){return this.status===404}isConflict(){return this.status===409}isAuthenticationTimeout(){return this.status===419}};function SO(e,t,n){const r=new URL(t,e);if(n)for(const[i,s]of Object.entries(n))s!==void 0&&r.searchParams.set(i,s);return r.toString()}async function _O(e){return!e||e.type==="none"?{}:e.type==="bearer"?{Authorization:`Bearer ${e.token}`}:e.type==="header"?{[e.name]:e.value}:e.type==="custom"?await e.getHeaders():{}}function CO(e){const t=e.fetchImpl??globalThis.fetch;return{async request({method:n,path:r,query:i,body:s,headers:o}){const a=SO(e.baseUrl,r,i),l=await _O(e.auth),u=await t(a,{method:n,headers:{...s?{"Content-Type":"application/json"}:{},...l,...o},body:s?JSON.stringify(s):void 0}),c=await u.text(),d=(u.headers.get("content-type")||"").includes("application/json"),h=d&&c?JSON.parse(c):c;if(!u.ok){const f=d?h:void 0,p=f==null?void 0:f.error;throw new po((p==null?void 0:p.message)??`Request failed with status ${u.status}`,{status:u.status,icebergType:p==null?void 0:p.type,icebergCode:p==null?void 0:p.code,details:f})}return{status:u.status,headers:u.headers,data:h}}}}function ua(e){return e.join("")}var EO=class{constructor(e,t=""){this.client=e,this.prefix=t}async listNamespaces(e){const t=e?{parent:ua(e.namespace)}:void 0;return(await this.client.request({method:"GET",path:`${this.prefix}/namespaces`,query:t})).data.namespaces.map(r=>({namespace:r}))}async createNamespace(e,t){const n={namespace:e.namespace,properties:t==null?void 0:t.properties};return(await this.client.request({method:"POST",path:`${this.prefix}/namespaces`,body:n})).data}async dropNamespace(e){await this.client.request({method:"DELETE",path:`${this.prefix}/namespaces/${ua(e.namespace)}`})}async loadNamespaceMetadata(e){return{properties:(await this.client.request({method:"GET",path:`${this.prefix}/namespaces/${ua(e.namespace)}`})).data.properties}}async namespaceExists(e){try{return await this.client.request({method:"HEAD",path:`${this.prefix}/namespaces/${ua(e.namespace)}`}),!0}catch(t){if(t instanceof po&&t.status===404)return!1;throw t}}async createNamespaceIfNotExists(e,t){try{return await this.createNamespace(e,t)}catch(n){if(n instanceof po&&n.status===409)return;throw n}}};function Qr(e){return e.join("")}var TO=class{constructor(e,t="",n){this.client=e,this.prefix=t,this.accessDelegation=n}async listTables(e){return(await this.client.request({method:"GET",path:`${this.prefix}/namespaces/${Qr(e.namespace)}/tables`})).data.identifiers}async createTable(e,t){const n={};return this.accessDelegation&&(n["X-Iceberg-Access-Delegation"]=this.accessDelegation),(await this.client.request({method:"POST",path:`${this.prefix}/namespaces/${Qr(e.namespace)}/tables`,body:t,headers:n})).data.metadata}async updateTable(e,t){const n=await this.client.request({method:"POST",path:`${this.prefix}/namespaces/${Qr(e.namespace)}/tables/${e.name}`,body:t});return{"metadata-location":n.data["metadata-location"],metadata:n.data.metadata}}async dropTable(e,t){await this.client.request({method:"DELETE",path:`${this.prefix}/namespaces/${Qr(e.namespace)}/tables/${e.name}`,query:{purgeRequested:String((t==null?void 0:t.purge)??!1)}})}async loadTable(e){const t={};return this.accessDelegation&&(t["X-Iceberg-Access-Delegation"]=this.accessDelegation),(await this.client.request({method:"GET",path:`${this.prefix}/namespaces/${Qr(e.namespace)}/tables/${e.name}`,headers:t})).data.metadata}async tableExists(e){const t={};this.accessDelegation&&(t["X-Iceberg-Access-Delegation"]=this.accessDelegation);try{return await this.client.request({method:"HEAD",path:`${this.prefix}/namespaces/${Qr(e.namespace)}/tables/${e.name}`,headers:t}),!0}catch(n){if(n instanceof po&&n.status===404)return!1;throw n}}async createTableIfNotExists(e,t){try{return await this.createTable(e,t)}catch(n){if(n instanceof po&&n.status===409)return await this.loadTable({namespace:e.namespace,name:t.name});throw n}}},PO=class{constructor(e){var r;let t="v1";e.catalogName&&(t+=`/${e.catalogName}`);const n=e.baseUrl.endsWith("/")?e.baseUrl:`${e.baseUrl}/`;this.client=CO({baseUrl:n,auth:e.auth,fetchImpl:e.fetch}),this.accessDelegation=(r=e.accessDelegation)==null?void 0:r.join(","),this.namespaceOps=new EO(this.client,t),this.tableOps=new TO(this.client,t,this.accessDelegation)}async listNamespaces(e){return this.namespaceOps.listNamespaces(e)}async createNamespace(e,t){return this.namespaceOps.createNamespace(e,t)}async dropNamespace(e){await this.namespaceOps.dropNamespace(e)}async loadNamespaceMetadata(e){return this.namespaceOps.loadNamespaceMetadata(e)}async listTables(e){return this.tableOps.listTables(e)}async createTable(e,t){return this.tableOps.createTable(e,t)}async updateTable(e,t){return this.tableOps.updateTable(e,t)}async dropTable(e,t){await this.tableOps.dropTable(e,t)}async loadTable(e){return this.tableOps.loadTable(e)}async namespaceExists(e){return this.namespaceOps.namespaceExists(e)}async tableExists(e){return this.tableOps.tableExists(e)}async createNamespaceIfNotExists(e,t){return this.namespaceOps.createNamespaceIfNotExists(e,t)}async createTableIfNotExists(e,t){return this.tableOps.createTableIfNotExists(e,t)}},eu=class extends Error{constructor(e,t="storage",n,r){super(e),this.__isStorageError=!0,this.namespace=t,this.name=t==="vectors"?"StorageVectorsError":"StorageError",this.status=n,this.statusCode=r}};function tu(e){return typeof e=="object"&&e!==null&&"__isStorageError"in e}var Ld=class extends eu{constructor(e,t,n,r="storage"){super(e,r,t,n),this.name=r==="vectors"?"StorageVectorsApiError":"StorageApiError",this.status=t,this.statusCode=n}toJSON(){return{name:this.name,message:this.message,status:this.status,statusCode:this.statusCode}}},c1=class extends eu{constructor(e,t,n="storage"){super(e,n),this.name=n==="vectors"?"StorageVectorsUnknownError":"StorageUnknownError",this.originalError=t}};const AO=e=>e?(...t)=>e(...t):(...t)=>fetch(...t),RO=e=>{if(typeof e!="object"||e===null)return!1;const t=Object.getPrototypeOf(e);return(t===null||t===Object.prototype||Object.getPrototypeOf(t)===null)&&!(Symbol.toStringTag in e)&&!(Symbol.iterator in e)},Md=e=>{if(Array.isArray(e))return e.map(n=>Md(n));if(typeof e=="function"||e!==Object(e))return e;const t={};return Object.entries(e).forEach(([n,r])=>{const i=n.replace(/([-_][a-z])/gi,s=>s.toUpperCase().replace(/[-_]/g,""));t[i]=Md(r)}),t},OO=e=>!e||typeof e!="string"||e.length===0||e.length>100||e.trim()!==e||e.includes("/")||e.includes("\\")?!1:/^[\w!.\*'() &$@=;:+,?-]+$/.test(e);function mo(e){"@babel/helpers - typeof";return mo=typeof Symbol=="function"&&typeof Symbol.iterator=="symbol"?function(t){return typeof t}:function(t){return t&&typeof Symbol=="function"&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},mo(e)}function NO(e,t){if(mo(e)!="object"||!e)return e;var n=e[Symbol.toPrimitive];if(n!==void 0){var r=n.call(e,t);if(mo(r)!="object")return r;throw new TypeError("@@toPrimitive must return a primitive value.")}return(t==="string"?String:Number)(e)}function jO(e){var t=NO(e,"string");return mo(t)=="symbol"?t:t+""}function IO(e,t,n){return(t=jO(t))in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function Fg(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter(function(i){return Object.getOwnPropertyDescriptor(e,i).enumerable})),n.push.apply(n,r)}return n}function W(e){for(var t=1;t<arguments.length;t++){var n=arguments[t]!=null?arguments[t]:{};t%2?Fg(Object(n),!0).forEach(function(r){IO(e,r,n[r])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):Fg(Object(n)).forEach(function(r){Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(n,r))})}return e}const $g=e=>{var t;return e.msg||e.message||e.error_description||(typeof e.error=="string"?e.error:(t=e.error)===null||t===void 0?void 0:t.message)||JSON.stringify(e)},DO=async(e,t,n,r)=>{if(e!==null&&typeof e=="object"&&typeof e.json=="function"){const i=e;let s=parseInt(i.status,10);Number.isFinite(s)||(s=500),i.json().then(o=>{const a=(o==null?void 0:o.statusCode)||(o==null?void 0:o.code)||s+"";t(new Ld($g(o),s,a,r))}).catch(()=>{const o=s+"";t(new Ld(i.statusText||`HTTP ${s} error`,s,o,r))})}else t(new c1($g(e),e,r))},LO=(e,t,n,r)=>{const i={method:e,headers:(t==null?void 0:t.headers)||{}};return e==="GET"||e==="HEAD"||!r?W(W({},i),n):(RO(r)?(i.headers=W({"Content-Type":"application/json"},t==null?void 0:t.headers),i.body=JSON.stringify(r)):i.body=r,t!=null&&t.duplex&&(i.duplex=t.duplex),W(W({},i),n))};async function cs(e,t,n,r,i,s,o){return new Promise((a,l)=>{e(n,LO(t,r,i,s)).then(u=>{if(!u.ok)throw u;if(r!=null&&r.noResolveJson)return u;if(o==="vectors"){const c=u.headers.get("content-type");if(u.headers.get("content-length")==="0"||u.status===204)return{};if(!c||!c.includes("application/json"))return{}}return u.json()}).then(u=>a(u)).catch(u=>DO(u,l,r,o))})}function d1(e="storage"){return{get:async(t,n,r,i)=>cs(t,"GET",n,r,i,void 0,e),post:async(t,n,r,i,s)=>cs(t,"POST",n,i,s,r,e),put:async(t,n,r,i,s)=>cs(t,"PUT",n,i,s,r,e),head:async(t,n,r,i)=>cs(t,"HEAD",n,W(W({},r),{},{noResolveJson:!0}),i,void 0,e),remove:async(t,n,r,i,s)=>cs(t,"DELETE",n,i,s,r,e)}}const MO=d1("storage"),{get:go,post:Vt,put:Bd,head:BO,remove:Tf}=MO,yt=d1("vectors");var Ji=class{constructor(e,t={},n,r="storage"){this.shouldThrowOnError=!1,this.url=e,this.headers=t,this.fetch=AO(n),this.namespace=r}throwOnError(){return this.shouldThrowOnError=!0,this}setHeader(e,t){return this.headers=W(W({},this.headers),{},{[e]:t}),this}async handleOperation(e){var t=this;try{return{data:await e(),error:null}}catch(n){if(t.shouldThrowOnError)throw n;if(tu(n))return{data:null,error:n};throw n}}},FO=class{constructor(e,t){this.downloadFn=e,this.shouldThrowOnError=t}then(e,t){return this.execute().then(e,t)}async execute(){var e=this;try{return{data:(await e.downloadFn()).body,error:null}}catch(t){if(e.shouldThrowOnError)throw t;if(tu(t))return{data:null,error:t};throw t}}};let h1;h1=Symbol.toStringTag;var $O=class{constructor(e,t){this.downloadFn=e,this.shouldThrowOnError=t,this[h1]="BlobDownloadBuilder",this.promise=null}asStream(){return new FO(this.downloadFn,this.shouldThrowOnError)}then(e,t){return this.getPromise().then(e,t)}catch(e){return this.getPromise().catch(e)}finally(e){return this.getPromise().finally(e)}getPromise(){return this.promise||(this.promise=this.execute()),this.promise}async execute(){var e=this;try{return{data:await(await e.downloadFn()).blob(),error:null}}catch(t){if(e.shouldThrowOnError)throw t;if(tu(t))return{data:null,error:t};throw t}}};const UO={limit:100,offset:0,sortBy:{column:"name",order:"asc"}},Ug={cacheControl:"3600",contentType:"text/plain;charset=UTF-8",upsert:!1};var VO=class extends Ji{constructor(e,t={},n,r){super(e,t,r,"storage"),this.bucketId=n}async uploadOrUpdate(e,t,n,r){var i=this;return i.handleOperation(async()=>{let s;const o=W(W({},Ug),r);let a=W(W({},i.headers),e==="POST"&&{"x-upsert":String(o.upsert)});const l=o.metadata;typeof Blob<"u"&&n instanceof Blob?(s=new FormData,s.append("cacheControl",o.cacheControl),l&&s.append("metadata",i.encodeMetadata(l)),s.append("",n)):typeof FormData<"u"&&n instanceof FormData?(s=n,s.has("cacheControl")||s.append("cacheControl",o.cacheControl),l&&!s.has("metadata")&&s.append("metadata",i.encodeMetadata(l))):(s=n,a["cache-control"]=`max-age=${o.cacheControl}`,a["content-type"]=o.contentType,l&&(a["x-metadata"]=i.toBase64(i.encodeMetadata(l))),(typeof ReadableStream<"u"&&s instanceof ReadableStream||s&&typeof s=="object"&&"pipe"in s&&typeof s.pipe=="function")&&!o.duplex&&(o.duplex="half")),r!=null&&r.headers&&(a=W(W({},a),r.headers));const u=i._removeEmptyFolders(t),c=i._getFinalPath(u),d=await(e=="PUT"?Bd:Vt)(i.fetch,`${i.url}/object/${c}`,s,W({headers:a},o!=null&&o.duplex?{duplex:o.duplex}:{}));return{path:u,id:d.Id,fullPath:d.Key}})}async upload(e,t,n){return this.uploadOrUpdate("POST",e,t,n)}async uploadToSignedUrl(e,t,n,r){var i=this;const s=i._removeEmptyFolders(e),o=i._getFinalPath(s),a=new URL(i.url+`/object/upload/sign/${o}`);return a.searchParams.set("token",t),i.handleOperation(async()=>{let l;const u=W(W({},Ug),r),c=W(W({},i.headers),{"x-upsert":String(u.upsert)});return typeof Blob<"u"&&n instanceof Blob?(l=new FormData,l.append("cacheControl",u.cacheControl),l.append("",n)):typeof FormData<"u"&&n instanceof FormData?(l=n,l.append("cacheControl",u.cacheControl)):(l=n,c["cache-control"]=`max-age=${u.cacheControl}`,c["content-type"]=u.contentType),{path:s,fullPath:(await Bd(i.fetch,a.toString(),l,{headers:c})).Key}})}async createSignedUploadUrl(e,t){var n=this;return n.handleOperation(async()=>{let r=n._getFinalPath(e);const i=W({},n.headers);t!=null&&t.upsert&&(i["x-upsert"]="true");const s=await Vt(n.fetch,`${n.url}/object/upload/sign/${r}`,{},{headers:i}),o=new URL(n.url+s.url),a=o.searchParams.get("token");if(!a)throw new eu("No token returned by API");return{signedUrl:o.toString(),path:e,token:a}})}async update(e,t,n){return this.uploadOrUpdate("PUT",e,t,n)}async move(e,t,n){var r=this;return r.handleOperation(async()=>await Vt(r.fetch,`${r.url}/object/move`,{bucketId:r.bucketId,sourceKey:e,destinationKey:t,destinationBucket:n==null?void 0:n.destinationBucket},{headers:r.headers}))}async copy(e,t,n){var r=this;return r.handleOperation(async()=>({path:(await Vt(r.fetch,`${r.url}/object/copy`,{bucketId:r.bucketId,sourceKey:e,destinationKey:t,destinationBucket:n==null?void 0:n.destinationBucket},{headers:r.headers})).Key}))}async createSignedUrl(e,t,n){var r=this;return r.handleOperation(async()=>{let i=r._getFinalPath(e);const s=typeof(n==null?void 0:n.transform)=="object"&&n.transform!==null&&Object.keys(n.transform).length>0;let o=await Vt(r.fetch,`${r.url}/object/sign/${i}`,W({expiresIn:t},s?{transform:n.transform}:{}),{headers:r.headers});const a=n!=null&&n.download?`&download=${n.download===!0?"":n.download}`:"",l=s&&o.signedURL.includes("/object/sign/")?o.signedURL.replace("/object/sign/","/render/image/sign/"):o.signedURL;return{signedUrl:encodeURI(`${r.url}${l}${a}`)}})}async createSignedUrls(e,t,n){var r=this;return r.handleOperation(async()=>{const i=await Vt(r.fetch,`${r.url}/object/sign/${r.bucketId}`,{expiresIn:t,paths:e},{headers:r.headers}),s=n!=null&&n.download?`&download=${n.download===!0?"":n.download}`:"";return i.map(o=>W(W({},o),{},{signedUrl:o.signedURL?encodeURI(`${r.url}${o.signedURL}${s}`):null}))})}download(e,t,n){const r=typeof(t==null?void 0:t.transform)<"u"?"render/image/authenticated":"object",i=this.transformOptsToQueryString((t==null?void 0:t.transform)||{}),s=i?`?${i}`:"",o=this._getFinalPath(e),a=()=>go(this.fetch,`${this.url}/${r}/${o}${s}`,{headers:this.headers,noResolveJson:!0},n);return new $O(a,this.shouldThrowOnError)}async info(e){var t=this;const n=t._getFinalPath(e);return t.handleOperation(async()=>Md(await go(t.fetch,`${t.url}/object/info/${n}`,{headers:t.headers})))}async exists(e){var t=this;const n=t._getFinalPath(e);try{return await BO(t.fetch,`${t.url}/object/${n}`,{headers:t.headers}),{data:!0,error:null}}catch(i){if(t.shouldThrowOnError)throw i;if(tu(i)){var r;const s=i instanceof Ld?i.status:i instanceof c1?(r=i.originalError)===null||r===void 0?void 0:r.status:void 0;if(s!==void 0&&[400,404].includes(s))return{data:!1,error:i}}throw i}}getPublicUrl(e,t){const n=this._getFinalPath(e),r=[],i=t!=null&&t.download?`download=${t.download===!0?"":t.download}`:"";i!==""&&r.push(i);const s=typeof(t==null?void 0:t.transform)<"u"?"render/image":"object",o=this.transformOptsToQueryString((t==null?void 0:t.transform)||{});o!==""&&r.push(o);let a=r.join("&");return a!==""&&(a=`?${a}`),{data:{publicUrl:encodeURI(`${this.url}/${s}/public/${n}${a}`)}}}async remove(e){var t=this;return t.handleOperation(async()=>await Tf(t.fetch,`${t.url}/object/${t.bucketId}`,{prefixes:e},{headers:t.headers}))}async list(e,t,n){var r=this;return r.handleOperation(async()=>{const i=W(W(W({},UO),t),{},{prefix:e||""});return await Vt(r.fetch,`${r.url}/object/list/${r.bucketId}`,i,{headers:r.headers},n)})}async listV2(e,t){var n=this;return n.handleOperation(async()=>{const r=W({},e);return await Vt(n.fetch,`${n.url}/object/list-v2/${n.bucketId}`,r,{headers:n.headers},t)})}encodeMetadata(e){return JSON.stringify(e)}toBase64(e){return typeof Buffer<"u"?Buffer.from(e).toString("base64"):btoa(e)}_getFinalPath(e){return`${this.bucketId}/${e.replace(/^\/+/,"")}`}_removeEmptyFolders(e){return e.replace(/^\/|\/$/g,"").replace(/\/+/g,"/")}transformOptsToQueryString(e){const t=[];return e.width&&t.push(`width=${e.width}`),e.height&&t.push(`height=${e.height}`),e.resize&&t.push(`resize=${e.resize}`),e.format&&t.push(`format=${e.format}`),e.quality&&t.push(`quality=${e.quality}`),t.join("&")}};const zO="2.100.1",No={"X-Client-Info":`storage-js/${zO}`};var qO=class extends Ji{constructor(e,t={},n,r){const i=new URL(e);r!=null&&r.useNewHostname&&/supabase\.(co|in|red)$/.test(i.hostname)&&!i.hostname.includes("storage.supabase.")&&(i.hostname=i.hostname.replace("supabase.","storage.supabase."));const s=i.href.replace(/\/$/,""),o=W(W({},No),t);super(s,o,n,"storage")}async listBuckets(e){var t=this;return t.handleOperation(async()=>{const n=t.listBucketOptionsToQueryString(e);return await go(t.fetch,`${t.url}/bucket${n}`,{headers:t.headers})})}async getBucket(e){var t=this;return t.handleOperation(async()=>await go(t.fetch,`${t.url}/bucket/${e}`,{headers:t.headers}))}async createBucket(e,t={public:!1}){var n=this;return n.handleOperation(async()=>await Vt(n.fetch,`${n.url}/bucket`,{id:e,name:e,type:t.type,public:t.public,file_size_limit:t.fileSizeLimit,allowed_mime_types:t.allowedMimeTypes},{headers:n.headers}))}async updateBucket(e,t){var n=this;return n.handleOperation(async()=>await Bd(n.fetch,`${n.url}/bucket/${e}`,{id:e,name:e,public:t.public,file_size_limit:t.fileSizeLimit,allowed_mime_types:t.allowedMimeTypes},{headers:n.headers}))}async emptyBucket(e){var t=this;return t.handleOperation(async()=>await Vt(t.fetch,`${t.url}/bucket/${e}/empty`,{},{headers:t.headers}))}async deleteBucket(e){var t=this;return t.handleOperation(async()=>await Tf(t.fetch,`${t.url}/bucket/${e}`,{},{headers:t.headers}))}listBucketOptionsToQueryString(e){const t={};return e&&("limit"in e&&(t.limit=String(e.limit)),"offset"in e&&(t.offset=String(e.offset)),e.search&&(t.search=e.search),e.sortColumn&&(t.sortColumn=e.sortColumn),e.sortOrder&&(t.sortOrder=e.sortOrder)),Object.keys(t).length>0?"?"+new URLSearchParams(t).toString():""}},HO=class extends Ji{constructor(e,t={},n){const r=e.replace(/\/$/,""),i=W(W({},No),t);super(r,i,n,"storage")}async createBucket(e){var t=this;return t.handleOperation(async()=>await Vt(t.fetch,`${t.url}/bucket`,{name:e},{headers:t.headers}))}async listBuckets(e){var t=this;return t.handleOperation(async()=>{const n=new URLSearchParams;(e==null?void 0:e.limit)!==void 0&&n.set("limit",e.limit.toString()),(e==null?void 0:e.offset)!==void 0&&n.set("offset",e.offset.toString()),e!=null&&e.sortColumn&&n.set("sortColumn",e.sortColumn),e!=null&&e.sortOrder&&n.set("sortOrder",e.sortOrder),e!=null&&e.search&&n.set("search",e.search);const r=n.toString(),i=r?`${t.url}/bucket?${r}`:`${t.url}/bucket`;return await go(t.fetch,i,{headers:t.headers})})}async deleteBucket(e){var t=this;return t.handleOperation(async()=>await Tf(t.fetch,`${t.url}/bucket/${e}`,{},{headers:t.headers}))}from(e){var t=this;if(!OO(e))throw new eu("Invalid bucket name: File, folder, and bucket names must follow AWS object key naming guidelines and should avoid the use of any other characters.");const n=new PO({baseUrl:this.url,catalogName:e,auth:{type:"custom",getHeaders:async()=>t.headers},fetch:this.fetch}),r=this.shouldThrowOnError;return new Proxy(n,{get(i,s){const o=i[s];return typeof o!="function"?o:async(...a)=>{try{return{data:await o.apply(i,a),error:null}}catch(l){if(r)throw l;return{data:null,error:l}}}}})}},WO=class extends Ji{constructor(e,t={},n){const r=e.replace(/\/$/,""),i=W(W({},No),{},{"Content-Type":"application/json"},t);super(r,i,n,"vectors")}async createIndex(e){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/CreateIndex`,e,{headers:t.headers})||{})}async getIndex(e,t){var n=this;return n.handleOperation(async()=>await yt.post(n.fetch,`${n.url}/GetIndex`,{vectorBucketName:e,indexName:t},{headers:n.headers}))}async listIndexes(e){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/ListIndexes`,e,{headers:t.headers}))}async deleteIndex(e,t){var n=this;return n.handleOperation(async()=>await yt.post(n.fetch,`${n.url}/DeleteIndex`,{vectorBucketName:e,indexName:t},{headers:n.headers})||{})}},GO=class extends Ji{constructor(e,t={},n){const r=e.replace(/\/$/,""),i=W(W({},No),{},{"Content-Type":"application/json"},t);super(r,i,n,"vectors")}async putVectors(e){var t=this;if(e.vectors.length<1||e.vectors.length>500)throw new Error("Vector batch size must be between 1 and 500 items");return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/PutVectors`,e,{headers:t.headers})||{})}async getVectors(e){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/GetVectors`,e,{headers:t.headers}))}async listVectors(e){var t=this;if(e.segmentCount!==void 0){if(e.segmentCount<1||e.segmentCount>16)throw new Error("segmentCount must be between 1 and 16");if(e.segmentIndex!==void 0&&(e.segmentIndex<0||e.segmentIndex>=e.segmentCount))throw new Error(`segmentIndex must be between 0 and ${e.segmentCount-1}`)}return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/ListVectors`,e,{headers:t.headers}))}async queryVectors(e){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/QueryVectors`,e,{headers:t.headers}))}async deleteVectors(e){var t=this;if(e.keys.length<1||e.keys.length>500)throw new Error("Keys batch size must be between 1 and 500 items");return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/DeleteVectors`,e,{headers:t.headers})||{})}},KO=class extends Ji{constructor(e,t={},n){const r=e.replace(/\/$/,""),i=W(W({},No),{},{"Content-Type":"application/json"},t);super(r,i,n,"vectors")}async createBucket(e){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/CreateVectorBucket`,{vectorBucketName:e},{headers:t.headers})||{})}async getBucket(e){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/GetVectorBucket`,{vectorBucketName:e},{headers:t.headers}))}async listBuckets(e={}){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/ListVectorBuckets`,e,{headers:t.headers}))}async deleteBucket(e){var t=this;return t.handleOperation(async()=>await yt.post(t.fetch,`${t.url}/DeleteVectorBucket`,{vectorBucketName:e},{headers:t.headers})||{})}},JO=class extends KO{constructor(e,t={}){super(e,t.headers||{},t.fetch)}from(e){return new QO(this.url,this.headers,e,this.fetch)}async createBucket(e){var t=()=>super.createBucket,n=this;return t().call(n,e)}async getBucket(e){var t=()=>super.getBucket,n=this;return t().call(n,e)}async listBuckets(e={}){var t=()=>super.listBuckets,n=this;return t().call(n,e)}async deleteBucket(e){var t=()=>super.deleteBucket,n=this;return t().call(n,e)}},QO=class extends WO{constructor(e,t,n,r){super(e,t,r),this.vectorBucketName=n}async createIndex(e){var t=()=>super.createIndex,n=this;return t().call(n,W(W({},e),{},{vectorBucketName:n.vectorBucketName}))}async listIndexes(e={}){var t=()=>super.listIndexes,n=this;return t().call(n,W(W({},e),{},{vectorBucketName:n.vectorBucketName}))}async getIndex(e){var t=()=>super.getIndex,n=this;return t().call(n,n.vectorBucketName,e)}async deleteIndex(e){var t=()=>super.deleteIndex,n=this;return t().call(n,n.vectorBucketName,e)}index(e){return new XO(this.url,this.headers,this.vectorBucketName,e,this.fetch)}},XO=class extends GO{constructor(e,t,n,r,i){super(e,t,i),this.vectorBucketName=n,this.indexName=r}async putVectors(e){var t=()=>super.putVectors,n=this;return t().call(n,W(W({},e),{},{vectorBucketName:n.vectorBucketName,indexName:n.indexName}))}async getVectors(e){var t=()=>super.getVectors,n=this;return t().call(n,W(W({},e),{},{vectorBucketName:n.vectorBucketName,indexName:n.indexName}))}async listVectors(e={}){var t=()=>super.listVectors,n=this;return t().call(n,W(W({},e),{},{vectorBucketName:n.vectorBucketName,indexName:n.indexName}))}async queryVectors(e){var t=()=>super.queryVectors,n=this;return t().call(n,W(W({},e),{},{vectorBucketName:n.vectorBucketName,indexName:n.indexName}))}async deleteVectors(e){var t=()=>super.deleteVectors,n=this;return t().call(n,W(W({},e),{},{vectorBucketName:n.vectorBucketName,indexName:n.indexName}))}},YO=class extends qO{constructor(e,t={},n,r){super(e,t,n,r)}from(e){return new VO(this.url,this.headers,e,this.fetch)}get vectors(){return new JO(this.url+"/vector",{headers:this.headers,fetch:this.fetch})}get analytics(){return new HO(this.url+"/iceberg",this.headers,this.fetch)}};const f1="2.100.1",ii=30*1e3,Fd=3,Yu=Fd*ii,ZO="http://localhost:9999",eN="supabase.auth.token",tN={"X-Client-Info":`gotrue-js/${f1}`},$d="X-Supabase-Api-Version",p1={"2024-01-01":{timestamp:Date.parse("2024-01-01T00:00:00.0Z"),name:"2024-01-01"}},nN=/^([a-z0-9_-]{4})*($|[a-z0-9_-]{3}$|[a-z0-9_-]{2}$)$/i,rN=10*60*1e3;class yo extends Error{constructor(t,n,r){super(t),this.__isAuthError=!0,this.name="AuthError",this.status=n,this.code=r}}function z(e){return typeof e=="object"&&e!==null&&"__isAuthError"in e}class iN extends yo{constructor(t,n,r){super(t,n,r),this.name="AuthApiError",this.status=n,this.code=r}}function sN(e){return z(e)&&e.name==="AuthApiError"}class _r extends yo{constructor(t,n){super(t),this.name="AuthUnknownError",this.originalError=n}}class Rn extends yo{constructor(t,n,r,i){super(t,r,i),this.name=n,this.status=r}}class ft extends Rn{constructor(){super("Auth session missing!","AuthSessionMissingError",400,void 0)}}function Zu(e){return z(e)&&e.name==="AuthSessionMissingError"}class Xr extends Rn{constructor(){super("Auth session or user missing","AuthInvalidTokenResponseError",500,void 0)}}class ca extends Rn{constructor(t){super(t,"AuthInvalidCredentialsError",400,void 0)}}class da extends Rn{constructor(t,n=null){super(t,"AuthImplicitGrantRedirectError",500,void 0),this.details=null,this.details=n}toJSON(){return{name:this.name,message:this.message,status:this.status,details:this.details}}}function oN(e){return z(e)&&e.name==="AuthImplicitGrantRedirectError"}class Vg extends Rn{constructor(t,n=null){super(t,"AuthPKCEGrantCodeExchangeError",500,void 0),this.details=null,this.details=n}toJSON(){return{name:this.name,message:this.message,status:this.status,details:this.details}}}class aN extends Rn{constructor(){super("PKCE code verifier not found in storage. This can happen if the auth flow was initiated in a different browser or device, or if the storage was cleared. For SSR frameworks (Next.js, SvelteKit, etc.), use @supabase/ssr on both the server and client to store the code verifier in cookies.","AuthPKCECodeVerifierMissingError",400,"pkce_code_verifier_not_found")}}class Ud extends Rn{constructor(t,n){super(t,"AuthRetryableFetchError",n,void 0)}}function ec(e){return z(e)&&e.name==="AuthRetryableFetchError"}class zg extends Rn{constructor(t,n,r){super(t,"AuthWeakPasswordError",n,"weak_password"),this.reasons=r}}class Vd extends Rn{constructor(t){super(t,"AuthInvalidJwtError",400,"invalid_jwt")}}const vl="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".split(""),qg=` 	
\r=`.split(""),lN=(()=>{const e=new Array(128);for(let t=0;t<e.length;t+=1)e[t]=-1;for(let t=0;t<qg.length;t+=1)e[qg[t].charCodeAt(0)]=-2;for(let t=0;t<vl.length;t+=1)e[vl[t].charCodeAt(0)]=t;return e})();function Hg(e,t,n){if(e!==null)for(t.queue=t.queue<<8|e,t.queuedBits+=8;t.queuedBits>=6;){const r=t.queue>>t.queuedBits-6&63;n(vl[r]),t.queuedBits-=6}else if(t.queuedBits>0)for(t.queue=t.queue<<6-t.queuedBits,t.queuedBits=6;t.queuedBits>=6;){const r=t.queue>>t.queuedBits-6&63;n(vl[r]),t.queuedBits-=6}}function m1(e,t,n){const r=lN[e];if(r>-1)for(t.queue=t.queue<<6|r,t.queuedBits+=6;t.queuedBits>=8;)n(t.queue>>t.queuedBits-8&255),t.queuedBits-=8;else{if(r===-2)return;throw new Error(`Invalid Base64-URL character "${String.fromCharCode(e)}"`)}}function Wg(e){const t=[],n=o=>{t.push(String.fromCodePoint(o))},r={utf8seq:0,codepoint:0},i={queue:0,queuedBits:0},s=o=>{dN(o,r,n)};for(let o=0;o<e.length;o+=1)m1(e.charCodeAt(o),i,s);return t.join("")}function uN(e,t){if(e<=127){t(e);return}else if(e<=2047){t(192|e>>6),t(128|e&63);return}else if(e<=65535){t(224|e>>12),t(128|e>>6&63),t(128|e&63);return}else if(e<=1114111){t(240|e>>18),t(128|e>>12&63),t(128|e>>6&63),t(128|e&63);return}throw new Error(`Unrecognized Unicode codepoint: ${e.toString(16)}`)}function cN(e,t){for(let n=0;n<e.length;n+=1){let r=e.charCodeAt(n);if(r>55295&&r<=56319){const i=(r-55296)*1024&65535;r=(e.charCodeAt(n+1)-56320&65535|i)+65536,n+=1}uN(r,t)}}function dN(e,t,n){if(t.utf8seq===0){if(e<=127){n(e);return}for(let r=1;r<6;r+=1)if(!(e>>7-r&1)){t.utf8seq=r;break}if(t.utf8seq===2)t.codepoint=e&31;else if(t.utf8seq===3)t.codepoint=e&15;else if(t.utf8seq===4)t.codepoint=e&7;else throw new Error("Invalid UTF-8 sequence");t.utf8seq-=1}else if(t.utf8seq>0){if(e<=127)throw new Error("Invalid UTF-8 sequence");t.codepoint=t.codepoint<<6|e&63,t.utf8seq-=1,t.utf8seq===0&&n(t.codepoint)}}function Ri(e){const t=[],n={queue:0,queuedBits:0},r=i=>{t.push(i)};for(let i=0;i<e.length;i+=1)m1(e.charCodeAt(i),n,r);return new Uint8Array(t)}function hN(e){const t=[];return cN(e,n=>t.push(n)),new Uint8Array(t)}function Rr(e){const t=[],n={queue:0,queuedBits:0},r=i=>{t.push(i)};return e.forEach(i=>Hg(i,n,r)),Hg(null,n,r),t.join("")}function fN(e){return Math.round(Date.now()/1e3)+e}function pN(){return Symbol("auth-callback")}const Me=()=>typeof window<"u"&&typeof document<"u",pr={tested:!1,writable:!1},g1=()=>{if(!Me())return!1;try{if(typeof globalThis.localStorage!="object")return!1}catch{return!1}if(pr.tested)return pr.writable;const e=`lswt-${Math.random()}${Math.random()}`;try{globalThis.localStorage.setItem(e,e),globalThis.localStorage.removeItem(e),pr.tested=!0,pr.writable=!0}catch{pr.tested=!0,pr.writable=!1}return pr.writable};function mN(e){const t={},n=new URL(e);if(n.hash&&n.hash[0]==="#")try{new URLSearchParams(n.hash.substring(1)).forEach((i,s)=>{t[s]=i})}catch{}return n.searchParams.forEach((r,i)=>{t[i]=r}),t}const y1=e=>e?(...t)=>e(...t):(...t)=>fetch(...t),gN=e=>typeof e=="object"&&e!==null&&"status"in e&&"ok"in e&&"json"in e&&typeof e.json=="function",si=async(e,t,n)=>{await e.setItem(t,JSON.stringify(n))},mr=async(e,t)=>{const n=await e.getItem(t);if(!n)return null;try{return JSON.parse(n)}catch{return n}},Le=async(e,t)=>{await e.removeItem(t)};class nu{constructor(){this.promise=new nu.promiseConstructor((t,n)=>{this.resolve=t,this.reject=n})}}nu.promiseConstructor=Promise;function ha(e){const t=e.split(".");if(t.length!==3)throw new Vd("Invalid JWT structure");for(let r=0;r<t.length;r++)if(!nN.test(t[r]))throw new Vd("JWT not in base64url format");return{header:JSON.parse(Wg(t[0])),payload:JSON.parse(Wg(t[1])),signature:Ri(t[2]),raw:{header:t[0],payload:t[1]}}}async function yN(e){return await new Promise(t=>{setTimeout(()=>t(null),e)})}function vN(e,t){return new Promise((r,i)=>{(async()=>{for(let s=0;s<1/0;s++)try{const o=await e(s);if(!t(s,null,o)){r(o);return}}catch(o){if(!t(s,o)){i(o);return}}})()})}function xN(e){return("0"+e.toString(16)).substr(-2)}function wN(){const t=new Uint32Array(56);if(typeof crypto>"u"){const n="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~",r=n.length;let i="";for(let s=0;s<56;s++)i+=n.charAt(Math.floor(Math.random()*r));return i}return crypto.getRandomValues(t),Array.from(t,xN).join("")}async function kN(e){const n=new TextEncoder().encode(e),r=await crypto.subtle.digest("SHA-256",n),i=new Uint8Array(r);return Array.from(i).map(s=>String.fromCharCode(s)).join("")}async function bN(e){if(!(typeof crypto<"u"&&typeof crypto.subtle<"u"&&typeof TextEncoder<"u"))return console.warn("WebCrypto API is not supported. Code challenge method will default to use plain instead of sha256."),e;const n=await kN(e);return btoa(n).replace(/\+/g,"-").replace(/\//g,"_").replace(/=+$/,"")}async function Yr(e,t,n=!1){const r=wN();let i=r;n&&(i+="/PASSWORD_RECOVERY"),await si(e,`${t}-code-verifier`,i);const s=await bN(r);return[s,r===s?"plain":"s256"]}const SN=/^2[0-9]{3}-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])$/i;function _N(e){const t=e.headers.get($d);if(!t||!t.match(SN))return null;try{return new Date(`${t}T00:00:00.0Z`)}catch{return null}}function CN(e){if(!e)throw new Error("Missing exp claim");const t=Math.floor(Date.now()/1e3);if(e<=t)throw new Error("JWT has expired")}function EN(e){switch(e){case"RS256":return{name:"RSASSA-PKCS1-v1_5",hash:{name:"SHA-256"}};case"ES256":return{name:"ECDSA",namedCurve:"P-256",hash:{name:"SHA-256"}};default:throw new Error("Invalid alg claim")}}const TN=/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/;function Zr(e){if(!TN.test(e))throw new Error("@supabase/auth-js: Expected parameter to be UUID but is not")}function tc(){const e={};return new Proxy(e,{get:(t,n)=>{if(n==="__isUserNotAvailableProxy")return!0;if(typeof n=="symbol"){const r=n.toString();if(r==="Symbol(Symbol.toPrimitive)"||r==="Symbol(Symbol.toStringTag)"||r==="Symbol(util.inspect.custom)")return}throw new Error(`@supabase/auth-js: client was created with userStorage option and there was no user stored in the user storage. Accessing the "${n}" property of the session object is not supported. Please use getUser() instead.`)},set:(t,n)=>{throw new Error(`@supabase/auth-js: client was created with userStorage option and there was no user stored in the user storage. Setting the "${n}" property of the session object is not supported. Please use getUser() to fetch a user object you can manipulate.`)},deleteProperty:(t,n)=>{throw new Error(`@supabase/auth-js: client was created with userStorage option and there was no user stored in the user storage. Deleting the "${n}" property of the session object is not supported. Please use getUser() to fetch a user object you can manipulate.`)}})}function PN(e,t){return new Proxy(e,{get:(n,r,i)=>{if(r==="__isInsecureUserWarningProxy")return!0;if(typeof r=="symbol"){const s=r.toString();if(s==="Symbol(Symbol.toPrimitive)"||s==="Symbol(Symbol.toStringTag)"||s==="Symbol(util.inspect.custom)"||s==="Symbol(nodejs.util.inspect.custom)")return Reflect.get(n,r,i)}return!t.value&&typeof r=="string"&&(console.warn("Using the user object as returned from supabase.auth.getSession() or from some supabase.auth.onAuthStateChange() events could be insecure! This value comes directly from the storage medium (usually cookies on the server) and may not be authentic. Use supabase.auth.getUser() instead which authenticates the data by contacting the Supabase Auth server."),t.value=!0),Reflect.get(n,r,i)}})}function Gg(e){return JSON.parse(JSON.stringify(e))}const br=e=>e.msg||e.message||e.error_description||e.error||JSON.stringify(e),AN=[502,503,504];async function Kg(e){var t;if(!gN(e))throw new Ud(br(e),0);if(AN.includes(e.status))throw new Ud(br(e),e.status);let n;try{n=await e.json()}catch(s){throw new _r(br(s),s)}let r;const i=_N(e);if(i&&i.getTime()>=p1["2024-01-01"].timestamp&&typeof n=="object"&&n&&typeof n.code=="string"?r=n.code:typeof n=="object"&&n&&typeof n.error_code=="string"&&(r=n.error_code),r){if(r==="weak_password")throw new zg(br(n),e.status,((t=n.weak_password)===null||t===void 0?void 0:t.reasons)||[]);if(r==="session_not_found")throw new ft}else if(typeof n=="object"&&n&&typeof n.weak_password=="object"&&n.weak_password&&Array.isArray(n.weak_password.reasons)&&n.weak_password.reasons.length&&n.weak_password.reasons.reduce((s,o)=>s&&typeof o=="string",!0))throw new zg(br(n),e.status,n.weak_password.reasons);throw new iN(br(n),e.status||500,r)}const RN=(e,t,n,r)=>{const i={method:e,headers:(t==null?void 0:t.headers)||{}};return e==="GET"?i:(i.headers=Object.assign({"Content-Type":"application/json;charset=UTF-8"},t==null?void 0:t.headers),i.body=JSON.stringify(r),Object.assign(Object.assign({},i),n))};async function H(e,t,n,r){var i;const s=Object.assign({},r==null?void 0:r.headers);s[$d]||(s[$d]=p1["2024-01-01"].name),r!=null&&r.jwt&&(s.Authorization=`Bearer ${r.jwt}`);const o=(i=r==null?void 0:r.query)!==null&&i!==void 0?i:{};r!=null&&r.redirectTo&&(o.redirect_to=r.redirectTo);const a=Object.keys(o).length?"?"+new URLSearchParams(o).toString():"",l=await ON(e,t,n+a,{headers:s,noResolveJson:r==null?void 0:r.noResolveJson},{},r==null?void 0:r.body);return r!=null&&r.xform?r==null?void 0:r.xform(l):{data:Object.assign({},l),error:null}}async function ON(e,t,n,r,i,s){const o=RN(t,r,i,s);let a;try{a=await e(n,Object.assign({},o))}catch(l){throw console.error(l),new Ud(br(l),0)}if(a.ok||await Kg(a),r!=null&&r.noResolveJson)return a;try{return await a.json()}catch(l){await Kg(l)}}function $t(e){var t;let n=null;IN(e)&&(n=Object.assign({},e),e.expires_at||(n.expires_at=fN(e.expires_in)));const r=(t=e.user)!==null&&t!==void 0?t:e;return{data:{session:n,user:r},error:null}}function Jg(e){const t=$t(e);return!t.error&&e.weak_password&&typeof e.weak_password=="object"&&Array.isArray(e.weak_password.reasons)&&e.weak_password.reasons.length&&e.weak_password.message&&typeof e.weak_password.message=="string"&&e.weak_password.reasons.reduce((n,r)=>n&&typeof r=="string",!0)&&(t.data.weak_password=e.weak_password),t}function Un(e){var t;return{data:{user:(t=e.user)!==null&&t!==void 0?t:e},error:null}}function NN(e){return{data:e,error:null}}function jN(e){const{action_link:t,email_otp:n,hashed_token:r,redirect_to:i,verification_type:s}=e,o=Zl(e,["action_link","email_otp","hashed_token","redirect_to","verification_type"]),a={action_link:t,email_otp:n,hashed_token:r,redirect_to:i,verification_type:s},l=Object.assign({},o);return{data:{properties:a,user:l},error:null}}function Qg(e){return e}function IN(e){return e.access_token&&e.refresh_token&&e.expires_in}const nc=["global","local","others"];class DN{constructor({url:t="",headers:n={},fetch:r}){this.url=t,this.headers=n,this.fetch=y1(r),this.mfa={listFactors:this._listFactors.bind(this),deleteFactor:this._deleteFactor.bind(this)},this.oauth={listClients:this._listOAuthClients.bind(this),createClient:this._createOAuthClient.bind(this),getClient:this._getOAuthClient.bind(this),updateClient:this._updateOAuthClient.bind(this),deleteClient:this._deleteOAuthClient.bind(this),regenerateClientSecret:this._regenerateOAuthClientSecret.bind(this)},this.customProviders={listProviders:this._listCustomProviders.bind(this),createProvider:this._createCustomProvider.bind(this),getProvider:this._getCustomProvider.bind(this),updateProvider:this._updateCustomProvider.bind(this),deleteProvider:this._deleteCustomProvider.bind(this)}}async signOut(t,n=nc[0]){if(nc.indexOf(n)<0)throw new Error(`@supabase/auth-js: Parameter scope must be one of ${nc.join(", ")}`);try{return await H(this.fetch,"POST",`${this.url}/logout?scope=${n}`,{headers:this.headers,jwt:t,noResolveJson:!0}),{data:null,error:null}}catch(r){if(z(r))return{data:null,error:r};throw r}}async inviteUserByEmail(t,n={}){try{return await H(this.fetch,"POST",`${this.url}/invite`,{body:{email:t,data:n.data},headers:this.headers,redirectTo:n.redirectTo,xform:Un})}catch(r){if(z(r))return{data:{user:null},error:r};throw r}}async generateLink(t){try{const{options:n}=t,r=Zl(t,["options"]),i=Object.assign(Object.assign({},r),n);return"newEmail"in r&&(i.new_email=r==null?void 0:r.newEmail,delete i.newEmail),await H(this.fetch,"POST",`${this.url}/admin/generate_link`,{body:i,headers:this.headers,xform:jN,redirectTo:n==null?void 0:n.redirectTo})}catch(n){if(z(n))return{data:{properties:null,user:null},error:n};throw n}}async createUser(t){try{return await H(this.fetch,"POST",`${this.url}/admin/users`,{body:t,headers:this.headers,xform:Un})}catch(n){if(z(n))return{data:{user:null},error:n};throw n}}async listUsers(t){var n,r,i,s,o,a,l;try{const u={nextPage:null,lastPage:0,total:0},c=await H(this.fetch,"GET",`${this.url}/admin/users`,{headers:this.headers,noResolveJson:!0,query:{page:(r=(n=t==null?void 0:t.page)===null||n===void 0?void 0:n.toString())!==null&&r!==void 0?r:"",per_page:(s=(i=t==null?void 0:t.perPage)===null||i===void 0?void 0:i.toString())!==null&&s!==void 0?s:""},xform:Qg});if(c.error)throw c.error;const d=await c.json(),h=(o=c.headers.get("x-total-count"))!==null&&o!==void 0?o:0,f=(l=(a=c.headers.get("link"))===null||a===void 0?void 0:a.split(","))!==null&&l!==void 0?l:[];return f.length>0&&(f.forEach(p=>{const v=parseInt(p.split(";")[0].split("=")[1].substring(0,1)),w=JSON.parse(p.split(";")[1].split("=")[1]);u[`${w}Page`]=v}),u.total=parseInt(h)),{data:Object.assign(Object.assign({},d),u),error:null}}catch(u){if(z(u))return{data:{users:[]},error:u};throw u}}async getUserById(t){Zr(t);try{return await H(this.fetch,"GET",`${this.url}/admin/users/${t}`,{headers:this.headers,xform:Un})}catch(n){if(z(n))return{data:{user:null},error:n};throw n}}async updateUserById(t,n){Zr(t);try{return await H(this.fetch,"PUT",`${this.url}/admin/users/${t}`,{body:n,headers:this.headers,xform:Un})}catch(r){if(z(r))return{data:{user:null},error:r};throw r}}async deleteUser(t,n=!1){Zr(t);try{return await H(this.fetch,"DELETE",`${this.url}/admin/users/${t}`,{headers:this.headers,body:{should_soft_delete:n},xform:Un})}catch(r){if(z(r))return{data:{user:null},error:r};throw r}}async _listFactors(t){Zr(t.userId);try{const{data:n,error:r}=await H(this.fetch,"GET",`${this.url}/admin/users/${t.userId}/factors`,{headers:this.headers,xform:i=>({data:{factors:i},error:null})});return{data:n,error:r}}catch(n){if(z(n))return{data:null,error:n};throw n}}async _deleteFactor(t){Zr(t.userId),Zr(t.id);try{return{data:await H(this.fetch,"DELETE",`${this.url}/admin/users/${t.userId}/factors/${t.id}`,{headers:this.headers}),error:null}}catch(n){if(z(n))return{data:null,error:n};throw n}}async _listOAuthClients(t){var n,r,i,s,o,a,l;try{const u={nextPage:null,lastPage:0,total:0},c=await H(this.fetch,"GET",`${this.url}/admin/oauth/clients`,{headers:this.headers,noResolveJson:!0,query:{page:(r=(n=t==null?void 0:t.page)===null||n===void 0?void 0:n.toString())!==null&&r!==void 0?r:"",per_page:(s=(i=t==null?void 0:t.perPage)===null||i===void 0?void 0:i.toString())!==null&&s!==void 0?s:""},xform:Qg});if(c.error)throw c.error;const d=await c.json(),h=(o=c.headers.get("x-total-count"))!==null&&o!==void 0?o:0,f=(l=(a=c.headers.get("link"))===null||a===void 0?void 0:a.split(","))!==null&&l!==void 0?l:[];return f.length>0&&(f.forEach(p=>{const v=parseInt(p.split(";")[0].split("=")[1].substring(0,1)),w=JSON.parse(p.split(";")[1].split("=")[1]);u[`${w}Page`]=v}),u.total=parseInt(h)),{data:Object.assign(Object.assign({},d),u),error:null}}catch(u){if(z(u))return{data:{clients:[]},error:u};throw u}}async _createOAuthClient(t){try{return await H(this.fetch,"POST",`${this.url}/admin/oauth/clients`,{body:t,headers:this.headers,xform:n=>({data:n,error:null})})}catch(n){if(z(n))return{data:null,error:n};throw n}}async _getOAuthClient(t){try{return await H(this.fetch,"GET",`${this.url}/admin/oauth/clients/${t}`,{headers:this.headers,xform:n=>({data:n,error:null})})}catch(n){if(z(n))return{data:null,error:n};throw n}}async _updateOAuthClient(t,n){try{return await H(this.fetch,"PUT",`${this.url}/admin/oauth/clients/${t}`,{body:n,headers:this.headers,xform:r=>({data:r,error:null})})}catch(r){if(z(r))return{data:null,error:r};throw r}}async _deleteOAuthClient(t){try{return await H(this.fetch,"DELETE",`${this.url}/admin/oauth/clients/${t}`,{headers:this.headers,noResolveJson:!0}),{data:null,error:null}}catch(n){if(z(n))return{data:null,error:n};throw n}}async _regenerateOAuthClientSecret(t){try{return await H(this.fetch,"POST",`${this.url}/admin/oauth/clients/${t}/regenerate_secret`,{headers:this.headers,xform:n=>({data:n,error:null})})}catch(n){if(z(n))return{data:null,error:n};throw n}}async _listCustomProviders(t){try{const n={};return t!=null&&t.type&&(n.type=t.type),await H(this.fetch,"GET",`${this.url}/admin/custom-providers`,{headers:this.headers,query:n,xform:r=>{var i;return{data:{providers:(i=r==null?void 0:r.providers)!==null&&i!==void 0?i:[]},error:null}}})}catch(n){if(z(n))return{data:{providers:[]},error:n};throw n}}async _createCustomProvider(t){try{return await H(this.fetch,"POST",`${this.url}/admin/custom-providers`,{body:t,headers:this.headers,xform:n=>({data:n,error:null})})}catch(n){if(z(n))return{data:null,error:n};throw n}}async _getCustomProvider(t){try{return await H(this.fetch,"GET",`${this.url}/admin/custom-providers/${t}`,{headers:this.headers,xform:n=>({data:n,error:null})})}catch(n){if(z(n))return{data:null,error:n};throw n}}async _updateCustomProvider(t,n){try{return await H(this.fetch,"PUT",`${this.url}/admin/custom-providers/${t}`,{body:n,headers:this.headers,xform:r=>({data:r,error:null})})}catch(r){if(z(r))return{data:null,error:r};throw r}}async _deleteCustomProvider(t){try{return await H(this.fetch,"DELETE",`${this.url}/admin/custom-providers/${t}`,{headers:this.headers,noResolveJson:!0}),{data:null,error:null}}catch(n){if(z(n))return{data:null,error:n};throw n}}}function Xg(e={}){return{getItem:t=>e[t]||null,setItem:(t,n)=>{e[t]=n},removeItem:t=>{delete e[t]}}}const Xt={debug:!!(globalThis&&g1()&&globalThis.localStorage&&globalThis.localStorage.getItem("supabase.gotrue-js.locks.debug")==="true")};class v1 extends Error{constructor(t){super(t),this.isAcquireTimeout=!0}}class Yg extends v1{}async function LN(e,t,n){Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: acquire lock",e,t);const r=new globalThis.AbortController;let i;t>0&&(i=setTimeout(()=>{r.abort(),Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock acquire timed out",e)},t)),await Promise.resolve();try{return await globalThis.navigator.locks.request(e,t===0?{mode:"exclusive",ifAvailable:!0}:{mode:"exclusive",signal:r.signal},async s=>{if(s){clearTimeout(i),Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: acquired",e,s.name);try{return await n()}finally{Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: released",e,s.name)}}else{if(t===0)throw Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: not immediately available",e),new Yg(`Acquiring an exclusive Navigator LockManager lock "${e}" immediately failed`);if(Xt.debug)try{const o=await globalThis.navigator.locks.query();console.log("@supabase/gotrue-js: Navigator LockManager state",JSON.stringify(o,null,"  "))}catch(o){console.warn("@supabase/gotrue-js: Error when querying Navigator LockManager state",o)}return console.warn("@supabase/gotrue-js: Navigator LockManager returned a null lock when using #request without ifAvailable set to true, it appears this browser is not following the LockManager spec https://developer.mozilla.org/en-US/docs/Web/API/LockManager/request"),clearTimeout(i),await n()}})}catch(s){if(t>0&&clearTimeout(i),(s==null?void 0:s.name)==="AbortError"&&t>0){if(r.signal.aborted)return Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: acquire timeout, recovering by stealing lock",e),console.warn(`@supabase/gotrue-js: Lock "${e}" was not released within ${t}ms. This may indicate an orphaned lock from a component unmount (e.g., React Strict Mode). Forcefully acquiring the lock to recover.`),await Promise.resolve().then(()=>globalThis.navigator.locks.request(e,{mode:"exclusive",steal:!0},async o=>{if(o){Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: recovered (stolen)",e,o.name);try{return await n()}finally{Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: released (stolen)",e,o.name)}}else return console.warn("@supabase/gotrue-js: Navigator LockManager returned null lock even with steal: true"),await n()}));throw Xt.debug&&console.log("@supabase/gotrue-js: navigatorLock: lock was stolen by another request",e),new Yg(`Lock "${e}" was released because another request stole it`)}throw s}}function MN(){if(typeof globalThis!="object")try{Object.defineProperty(Object.prototype,"__magic__",{get:function(){return this},configurable:!0}),__magic__.globalThis=__magic__,delete Object.prototype.__magic__}catch{typeof self<"u"&&(self.globalThis=self)}}function x1(e){if(!/^0x[a-fA-F0-9]{40}$/.test(e))throw new Error(`@supabase/auth-js: Address "${e}" is invalid.`);return e.toLowerCase()}function BN(e){return parseInt(e,16)}function FN(e){const t=new TextEncoder().encode(e);return"0x"+Array.from(t,r=>r.toString(16).padStart(2,"0")).join("")}function $N(e){var t;const{chainId:n,domain:r,expirationTime:i,issuedAt:s=new Date,nonce:o,notBefore:a,requestId:l,resources:u,scheme:c,uri:d,version:h}=e;{if(!Number.isInteger(n))throw new Error(`@supabase/auth-js: Invalid SIWE message field "chainId". Chain ID must be a EIP-155 chain ID. Provided value: ${n}`);if(!r)throw new Error('@supabase/auth-js: Invalid SIWE message field "domain". Domain must be provided.');if(o&&o.length<8)throw new Error(`@supabase/auth-js: Invalid SIWE message field "nonce". Nonce must be at least 8 characters. Provided value: ${o}`);if(!d)throw new Error('@supabase/auth-js: Invalid SIWE message field "uri". URI must be provided.');if(h!=="1")throw new Error(`@supabase/auth-js: Invalid SIWE message field "version". Version must be '1'. Provided value: ${h}`);if(!((t=e.statement)===null||t===void 0)&&t.includes(`
`))throw new Error(`@supabase/auth-js: Invalid SIWE message field "statement". Statement must not include '\\n'. Provided value: ${e.statement}`)}const f=x1(e.address),p=c?`${c}://${r}`:r,v=e.statement?`${e.statement}
`:"",w=`${p} wants you to sign in with your Ethereum account:
${f}

${v}`;let m=`URI: ${d}
Version: ${h}
Chain ID: ${n}${o?`
Nonce: ${o}`:""}
Issued At: ${s.toISOString()}`;if(i&&(m+=`
Expiration Time: ${i.toISOString()}`),a&&(m+=`
Not Before: ${a.toISOString()}`),l&&(m+=`
Request ID: ${l}`),u){let g=`
Resources:`;for(const y of u){if(!y||typeof y!="string")throw new Error(`@supabase/auth-js: Invalid SIWE message field "resources". Every resource must be a valid string. Provided value: ${y}`);g+=`
- ${y}`}m+=g}return`${w}
${m}`}class Re extends Error{constructor({message:t,code:n,cause:r,name:i}){var s;super(t,{cause:r}),this.__isWebAuthnError=!0,this.name=(s=i??(r instanceof Error?r.name:void 0))!==null&&s!==void 0?s:"Unknown Error",this.code=n}}class xl extends Re{constructor(t,n){super({code:"ERROR_PASSTHROUGH_SEE_CAUSE_PROPERTY",cause:n,message:t}),this.name="WebAuthnUnknownError",this.originalError=n}}function UN({error:e,options:t}){var n,r,i;const{publicKey:s}=t;if(!s)throw Error("options was missing required publicKey property");if(e.name==="AbortError"){if(t.signal instanceof AbortSignal)return new Re({message:"Registration ceremony was sent an abort signal",code:"ERROR_CEREMONY_ABORTED",cause:e})}else if(e.name==="ConstraintError"){if(((n=s.authenticatorSelection)===null||n===void 0?void 0:n.requireResidentKey)===!0)return new Re({message:"Discoverable credentials were required but no available authenticator supported it",code:"ERROR_AUTHENTICATOR_MISSING_DISCOVERABLE_CREDENTIAL_SUPPORT",cause:e});if(t.mediation==="conditional"&&((r=s.authenticatorSelection)===null||r===void 0?void 0:r.userVerification)==="required")return new Re({message:"User verification was required during automatic registration but it could not be performed",code:"ERROR_AUTO_REGISTER_USER_VERIFICATION_FAILURE",cause:e});if(((i=s.authenticatorSelection)===null||i===void 0?void 0:i.userVerification)==="required")return new Re({message:"User verification was required but no available authenticator supported it",code:"ERROR_AUTHENTICATOR_MISSING_USER_VERIFICATION_SUPPORT",cause:e})}else{if(e.name==="InvalidStateError")return new Re({message:"The authenticator was previously registered",code:"ERROR_AUTHENTICATOR_PREVIOUSLY_REGISTERED",cause:e});if(e.name==="NotAllowedError")return new Re({message:e.message,code:"ERROR_PASSTHROUGH_SEE_CAUSE_PROPERTY",cause:e});if(e.name==="NotSupportedError")return s.pubKeyCredParams.filter(a=>a.type==="public-key").length===0?new Re({message:'No entry in pubKeyCredParams was of type "public-key"',code:"ERROR_MALFORMED_PUBKEYCREDPARAMS",cause:e}):new Re({message:"No available authenticator supported any of the specified pubKeyCredParams algorithms",code:"ERROR_AUTHENTICATOR_NO_SUPPORTED_PUBKEYCREDPARAMS_ALG",cause:e});if(e.name==="SecurityError"){const o=window.location.hostname;if(w1(o)){if(s.rp.id!==o)return new Re({message:`The RP ID "${s.rp.id}" is invalid for this domain`,code:"ERROR_INVALID_RP_ID",cause:e})}else return new Re({message:`${window.location.hostname} is an invalid domain`,code:"ERROR_INVALID_DOMAIN",cause:e})}else if(e.name==="TypeError"){if(s.user.id.byteLength<1||s.user.id.byteLength>64)return new Re({message:"User ID was not between 1 and 64 characters",code:"ERROR_INVALID_USER_ID_LENGTH",cause:e})}else if(e.name==="UnknownError")return new Re({message:"The authenticator was unable to process the specified options, or could not create a new credential",code:"ERROR_AUTHENTICATOR_GENERAL_ERROR",cause:e})}return new Re({message:"a Non-Webauthn related error has occurred",code:"ERROR_PASSTHROUGH_SEE_CAUSE_PROPERTY",cause:e})}function VN({error:e,options:t}){const{publicKey:n}=t;if(!n)throw Error("options was missing required publicKey property");if(e.name==="AbortError"){if(t.signal instanceof AbortSignal)return new Re({message:"Authentication ceremony was sent an abort signal",code:"ERROR_CEREMONY_ABORTED",cause:e})}else{if(e.name==="NotAllowedError")return new Re({message:e.message,code:"ERROR_PASSTHROUGH_SEE_CAUSE_PROPERTY",cause:e});if(e.name==="SecurityError"){const r=window.location.hostname;if(w1(r)){if(n.rpId!==r)return new Re({message:`The RP ID "${n.rpId}" is invalid for this domain`,code:"ERROR_INVALID_RP_ID",cause:e})}else return new Re({message:`${window.location.hostname} is an invalid domain`,code:"ERROR_INVALID_DOMAIN",cause:e})}else if(e.name==="UnknownError")return new Re({message:"The authenticator was unable to process the specified options, or could not create a new assertion signature",code:"ERROR_AUTHENTICATOR_GENERAL_ERROR",cause:e})}return new Re({message:"a Non-Webauthn related error has occurred",code:"ERROR_PASSTHROUGH_SEE_CAUSE_PROPERTY",cause:e})}class zN{createNewAbortSignal(){if(this.controller){const n=new Error("Cancelling existing WebAuthn API call for new one");n.name="AbortError",this.controller.abort(n)}const t=new AbortController;return this.controller=t,t.signal}cancelCeremony(){if(this.controller){const t=new Error("Manually cancelling existing WebAuthn API call");t.name="AbortError",this.controller.abort(t),this.controller=void 0}}}const qN=new zN;function HN(e){if(!e)throw new Error("Credential creation options are required");if(typeof PublicKeyCredential<"u"&&"parseCreationOptionsFromJSON"in PublicKeyCredential&&typeof PublicKeyCredential.parseCreationOptionsFromJSON=="function")return PublicKeyCredential.parseCreationOptionsFromJSON(e);const{challenge:t,user:n,excludeCredentials:r}=e,i=Zl(e,["challenge","user","excludeCredentials"]),s=Ri(t).buffer,o=Object.assign(Object.assign({},n),{id:Ri(n.id).buffer}),a=Object.assign(Object.assign({},i),{challenge:s,user:o});if(r&&r.length>0){a.excludeCredentials=new Array(r.length);for(let l=0;l<r.length;l++){const u=r[l];a.excludeCredentials[l]=Object.assign(Object.assign({},u),{id:Ri(u.id).buffer,type:u.type||"public-key",transports:u.transports})}}return a}function WN(e){if(!e)throw new Error("Credential request options are required");if(typeof PublicKeyCredential<"u"&&"parseRequestOptionsFromJSON"in PublicKeyCredential&&typeof PublicKeyCredential.parseRequestOptionsFromJSON=="function")return PublicKeyCredential.parseRequestOptionsFromJSON(e);const{challenge:t,allowCredentials:n}=e,r=Zl(e,["challenge","allowCredentials"]),i=Ri(t).buffer,s=Object.assign(Object.assign({},r),{challenge:i});if(n&&n.length>0){s.allowCredentials=new Array(n.length);for(let o=0;o<n.length;o++){const a=n[o];s.allowCredentials[o]=Object.assign(Object.assign({},a),{id:Ri(a.id).buffer,type:a.type||"public-key",transports:a.transports})}}return s}function GN(e){var t;if("toJSON"in e&&typeof e.toJSON=="function")return e.toJSON();const n=e;return{id:e.id,rawId:e.id,response:{attestationObject:Rr(new Uint8Array(e.response.attestationObject)),clientDataJSON:Rr(new Uint8Array(e.response.clientDataJSON))},type:"public-key",clientExtensionResults:e.getClientExtensionResults(),authenticatorAttachment:(t=n.authenticatorAttachment)!==null&&t!==void 0?t:void 0}}function KN(e){var t;if("toJSON"in e&&typeof e.toJSON=="function")return e.toJSON();const n=e,r=e.getClientExtensionResults(),i=e.response;return{id:e.id,rawId:e.id,response:{authenticatorData:Rr(new Uint8Array(i.authenticatorData)),clientDataJSON:Rr(new Uint8Array(i.clientDataJSON)),signature:Rr(new Uint8Array(i.signature)),userHandle:i.userHandle?Rr(new Uint8Array(i.userHandle)):void 0},type:"public-key",clientExtensionResults:r,authenticatorAttachment:(t=n.authenticatorAttachment)!==null&&t!==void 0?t:void 0}}function w1(e){return e==="localhost"||/^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$/i.test(e)}function Zg(){var e,t;return!!(Me()&&"PublicKeyCredential"in window&&window.PublicKeyCredential&&"credentials"in navigator&&typeof((e=navigator==null?void 0:navigator.credentials)===null||e===void 0?void 0:e.create)=="function"&&typeof((t=navigator==null?void 0:navigator.credentials)===null||t===void 0?void 0:t.get)=="function")}async function JN(e){try{const t=await navigator.credentials.create(e);return t?t instanceof PublicKeyCredential?{data:t,error:null}:{data:null,error:new xl("Browser returned unexpected credential type",t)}:{data:null,error:new xl("Empty credential response",t)}}catch(t){return{data:null,error:UN({error:t,options:e})}}}async function QN(e){try{const t=await navigator.credentials.get(e);return t?t instanceof PublicKeyCredential?{data:t,error:null}:{data:null,error:new xl("Browser returned unexpected credential type",t)}:{data:null,error:new xl("Empty credential response",t)}}catch(t){return{data:null,error:VN({error:t,options:e})}}}const XN={hints:["security-key"],authenticatorSelection:{authenticatorAttachment:"cross-platform",requireResidentKey:!1,userVerification:"preferred",residentKey:"discouraged"},attestation:"direct"},YN={userVerification:"preferred",hints:["security-key"],attestation:"direct"};function wl(...e){const t=i=>i!==null&&typeof i=="object"&&!Array.isArray(i),n=i=>i instanceof ArrayBuffer||ArrayBuffer.isView(i),r={};for(const i of e)if(i)for(const s in i){const o=i[s];if(o!==void 0)if(Array.isArray(o))r[s]=o;else if(n(o))r[s]=o;else if(t(o)){const a=r[s];t(a)?r[s]=wl(a,o):r[s]=wl(o)}else r[s]=o}return r}function ZN(e,t){return wl(XN,e,t||{})}function ej(e,t){return wl(YN,e,t||{})}class tj{constructor(t){this.client=t,this.enroll=this._enroll.bind(this),this.challenge=this._challenge.bind(this),this.verify=this._verify.bind(this),this.authenticate=this._authenticate.bind(this),this.register=this._register.bind(this)}async _enroll(t){return this.client.mfa.enroll(Object.assign(Object.assign({},t),{factorType:"webauthn"}))}async _challenge({factorId:t,webauthn:n,friendlyName:r,signal:i},s){var o;try{const{data:a,error:l}=await this.client.mfa.challenge({factorId:t,webauthn:n});if(!a)return{data:null,error:l};const u=i??qN.createNewAbortSignal();if(a.webauthn.type==="create"){const{user:c}=a.webauthn.credential_options.publicKey;if(!c.name){const d=r;if(d)c.name=`${c.id}:${d}`;else{const f=(await this.client.getUser()).data.user,p=((o=f==null?void 0:f.user_metadata)===null||o===void 0?void 0:o.name)||(f==null?void 0:f.email)||(f==null?void 0:f.id)||"User";c.name=`${c.id}:${p}`}}c.displayName||(c.displayName=c.name)}switch(a.webauthn.type){case"create":{const c=ZN(a.webauthn.credential_options.publicKey,s==null?void 0:s.create),{data:d,error:h}=await JN({publicKey:c,signal:u});return d?{data:{factorId:t,challengeId:a.id,webauthn:{type:a.webauthn.type,credential_response:d}},error:null}:{data:null,error:h}}case"request":{const c=ej(a.webauthn.credential_options.publicKey,s==null?void 0:s.request),{data:d,error:h}=await QN(Object.assign(Object.assign({},a.webauthn.credential_options),{publicKey:c,signal:u}));return d?{data:{factorId:t,challengeId:a.id,webauthn:{type:a.webauthn.type,credential_response:d}},error:null}:{data:null,error:h}}}}catch(a){return z(a)?{data:null,error:a}:{data:null,error:new _r("Unexpected error in challenge",a)}}}async _verify({challengeId:t,factorId:n,webauthn:r}){return this.client.mfa.verify({factorId:n,challengeId:t,webauthn:r})}async _authenticate({factorId:t,webauthn:{rpId:n=typeof window<"u"?window.location.hostname:void 0,rpOrigins:r=typeof window<"u"?[window.location.origin]:void 0,signal:i}={}},s){if(!n)return{data:null,error:new yo("rpId is required for WebAuthn authentication")};try{if(!Zg())return{data:null,error:new _r("Browser does not support WebAuthn",null)};const{data:o,error:a}=await this.challenge({factorId:t,webauthn:{rpId:n,rpOrigins:r},signal:i},{request:s});if(!o)return{data:null,error:a};const{webauthn:l}=o;return this._verify({factorId:t,challengeId:o.challengeId,webauthn:{type:l.type,rpId:n,rpOrigins:r,credential_response:l.credential_response}})}catch(o){return z(o)?{data:null,error:o}:{data:null,error:new _r("Unexpected error in authenticate",o)}}}async _register({friendlyName:t,webauthn:{rpId:n=typeof window<"u"?window.location.hostname:void 0,rpOrigins:r=typeof window<"u"?[window.location.origin]:void 0,signal:i}={}},s){if(!n)return{data:null,error:new yo("rpId is required for WebAuthn registration")};try{if(!Zg())return{data:null,error:new _r("Browser does not support WebAuthn",null)};const{data:o,error:a}=await this._enroll({friendlyName:t});if(!o)return await this.client.mfa.listFactors().then(c=>{var d;return(d=c.data)===null||d===void 0?void 0:d.all.find(h=>h.factor_type==="webauthn"&&h.friendly_name===t&&h.status!=="unverified")}).then(c=>c?this.client.mfa.unenroll({factorId:c==null?void 0:c.id}):void 0),{data:null,error:a};const{data:l,error:u}=await this._challenge({factorId:o.id,friendlyName:o.friendly_name,webauthn:{rpId:n,rpOrigins:r},signal:i},{create:s});return l?this._verify({factorId:o.id,challengeId:l.challengeId,webauthn:{rpId:n,rpOrigins:r,type:l.webauthn.type,credential_response:l.webauthn.credential_response}}):{data:null,error:u}}catch(o){return z(o)?{data:null,error:o}:{data:null,error:new _r("Unexpected error in register",o)}}}}MN();const nj={url:ZO,storageKey:eN,autoRefreshToken:!0,persistSession:!0,detectSessionInUrl:!0,headers:tN,flowType:"implicit",debug:!1,hasCustomAuthorizationHeader:!1,throwOnError:!1,lockAcquireTimeout:5e3,skipAutoInitialize:!1};async function ey(e,t,n){return await n()}const ei={};class vo{get jwks(){var t,n;return(n=(t=ei[this.storageKey])===null||t===void 0?void 0:t.jwks)!==null&&n!==void 0?n:{keys:[]}}set jwks(t){ei[this.storageKey]=Object.assign(Object.assign({},ei[this.storageKey]),{jwks:t})}get jwks_cached_at(){var t,n;return(n=(t=ei[this.storageKey])===null||t===void 0?void 0:t.cachedAt)!==null&&n!==void 0?n:Number.MIN_SAFE_INTEGER}set jwks_cached_at(t){ei[this.storageKey]=Object.assign(Object.assign({},ei[this.storageKey]),{cachedAt:t})}constructor(t){var n,r,i;this.userStorage=null,this.memoryStorage=null,this.stateChangeEmitters=new Map,this.autoRefreshTicker=null,this.autoRefreshTickTimeout=null,this.visibilityChangedCallback=null,this.refreshingDeferred=null,this.initializePromise=null,this.detectSessionInUrl=!0,this.hasCustomAuthorizationHeader=!1,this.suppressGetSessionWarning=!1,this.lockAcquired=!1,this.pendingInLock=[],this.broadcastChannel=null,this.logger=console.log;const s=Object.assign(Object.assign({},nj),t);if(this.storageKey=s.storageKey,this.instanceID=(n=vo.nextInstanceID[this.storageKey])!==null&&n!==void 0?n:0,vo.nextInstanceID[this.storageKey]=this.instanceID+1,this.logDebugMessages=!!s.debug,typeof s.debug=="function"&&(this.logger=s.debug),this.instanceID>0&&Me()){const o=`${this._logPrefix()} Multiple GoTrueClient instances detected in the same browser context. It is not an error, but this should be avoided as it may produce undefined behavior when used concurrently under the same storage key.`;console.warn(o),this.logDebugMessages&&console.trace(o)}if(this.persistSession=s.persistSession,this.autoRefreshToken=s.autoRefreshToken,this.admin=new DN({url:s.url,headers:s.headers,fetch:s.fetch}),this.url=s.url,this.headers=s.headers,this.fetch=y1(s.fetch),this.lock=s.lock||ey,this.detectSessionInUrl=s.detectSessionInUrl,this.flowType=s.flowType,this.hasCustomAuthorizationHeader=s.hasCustomAuthorizationHeader,this.throwOnError=s.throwOnError,this.lockAcquireTimeout=s.lockAcquireTimeout,s.lock?this.lock=s.lock:this.persistSession&&Me()&&(!((r=globalThis==null?void 0:globalThis.navigator)===null||r===void 0)&&r.locks)?this.lock=LN:this.lock=ey,this.jwks||(this.jwks={keys:[]},this.jwks_cached_at=Number.MIN_SAFE_INTEGER),this.mfa={verify:this._verify.bind(this),enroll:this._enroll.bind(this),unenroll:this._unenroll.bind(this),challenge:this._challenge.bind(this),listFactors:this._listFactors.bind(this),challengeAndVerify:this._challengeAndVerify.bind(this),getAuthenticatorAssuranceLevel:this._getAuthenticatorAssuranceLevel.bind(this),webauthn:new tj(this)},this.oauth={getAuthorizationDetails:this._getAuthorizationDetails.bind(this),approveAuthorization:this._approveAuthorization.bind(this),denyAuthorization:this._denyAuthorization.bind(this),listGrants:this._listOAuthGrants.bind(this),revokeGrant:this._revokeOAuthGrant.bind(this)},this.persistSession?(s.storage?this.storage=s.storage:g1()?this.storage=globalThis.localStorage:(this.memoryStorage={},this.storage=Xg(this.memoryStorage)),s.userStorage&&(this.userStorage=s.userStorage)):(this.memoryStorage={},this.storage=Xg(this.memoryStorage)),Me()&&globalThis.BroadcastChannel&&this.persistSession&&this.storageKey){try{this.broadcastChannel=new globalThis.BroadcastChannel(this.storageKey)}catch(o){console.error("Failed to create a new BroadcastChannel, multi-tab state changes will not be available",o)}(i=this.broadcastChannel)===null||i===void 0||i.addEventListener("message",async o=>{this._debug("received broadcast notification from other tab or client",o);try{await this._notifyAllSubscribers(o.data.event,o.data.session,!1)}catch(a){this._debug("#broadcastChannel","error",a)}})}s.skipAutoInitialize||this.initialize().catch(o=>{this._debug("#initialize()","error",o)})}isThrowOnErrorEnabled(){return this.throwOnError}_returnResult(t){if(this.throwOnError&&t&&t.error)throw t.error;return t}_logPrefix(){return`GoTrueClient@${this.storageKey}:${this.instanceID} (${f1}) ${new Date().toISOString()}`}_debug(...t){return this.logDebugMessages&&this.logger(this._logPrefix(),...t),this}async initialize(){return this.initializePromise?await this.initializePromise:(this.initializePromise=(async()=>await this._acquireLock(this.lockAcquireTimeout,async()=>await this._initialize()))(),await this.initializePromise)}async _initialize(){var t;try{let n={},r="none";if(Me()&&(n=mN(window.location.href),this._isImplicitGrantCallback(n)?r="implicit":await this._isPKCECallback(n)&&(r="pkce")),Me()&&this.detectSessionInUrl&&r!=="none"){const{data:i,error:s}=await this._getSessionFromURL(n,r);if(s){if(this._debug("#_initialize()","error detecting session from URL",s),oN(s)){const l=(t=s.details)===null||t===void 0?void 0:t.code;if(l==="identity_already_exists"||l==="identity_not_found"||l==="single_identity_not_deletable")return{error:s}}return{error:s}}const{session:o,redirectType:a}=i;return this._debug("#_initialize()","detected session in URL",o,"redirect type",a),await this._saveSession(o),setTimeout(async()=>{a==="recovery"?await this._notifyAllSubscribers("PASSWORD_RECOVERY",o):await this._notifyAllSubscribers("SIGNED_IN",o)},0),{error:null}}return await this._recoverAndRefresh(),{error:null}}catch(n){return z(n)?this._returnResult({error:n}):this._returnResult({error:new _r("Unexpected error during initialization",n)})}finally{await this._handleVisibilityChange(),this._debug("#_initialize()","end")}}async signInAnonymously(t){var n,r,i;try{const s=await H(this.fetch,"POST",`${this.url}/signup`,{headers:this.headers,body:{data:(r=(n=t==null?void 0:t.options)===null||n===void 0?void 0:n.data)!==null&&r!==void 0?r:{},gotrue_meta_security:{captcha_token:(i=t==null?void 0:t.options)===null||i===void 0?void 0:i.captchaToken}},xform:$t}),{data:o,error:a}=s;if(a||!o)return this._returnResult({data:{user:null,session:null},error:a});const l=o.session,u=o.user;return o.session&&(await this._saveSession(o.session),await this._notifyAllSubscribers("SIGNED_IN",l)),this._returnResult({data:{user:u,session:l},error:null})}catch(s){if(z(s))return this._returnResult({data:{user:null,session:null},error:s});throw s}}async signUp(t){var n,r,i;try{let s;if("email"in t){const{email:c,password:d,options:h}=t;let f=null,p=null;this.flowType==="pkce"&&([f,p]=await Yr(this.storage,this.storageKey)),s=await H(this.fetch,"POST",`${this.url}/signup`,{headers:this.headers,redirectTo:h==null?void 0:h.emailRedirectTo,body:{email:c,password:d,data:(n=h==null?void 0:h.data)!==null&&n!==void 0?n:{},gotrue_meta_security:{captcha_token:h==null?void 0:h.captchaToken},code_challenge:f,code_challenge_method:p},xform:$t})}else if("phone"in t){const{phone:c,password:d,options:h}=t;s=await H(this.fetch,"POST",`${this.url}/signup`,{headers:this.headers,body:{phone:c,password:d,data:(r=h==null?void 0:h.data)!==null&&r!==void 0?r:{},channel:(i=h==null?void 0:h.channel)!==null&&i!==void 0?i:"sms",gotrue_meta_security:{captcha_token:h==null?void 0:h.captchaToken}},xform:$t})}else throw new ca("You must provide either an email or phone number and a password");const{data:o,error:a}=s;if(a||!o)return await Le(this.storage,`${this.storageKey}-code-verifier`),this._returnResult({data:{user:null,session:null},error:a});const l=o.session,u=o.user;return o.session&&(await this._saveSession(o.session),await this._notifyAllSubscribers("SIGNED_IN",l)),this._returnResult({data:{user:u,session:l},error:null})}catch(s){if(await Le(this.storage,`${this.storageKey}-code-verifier`),z(s))return this._returnResult({data:{user:null,session:null},error:s});throw s}}async signInWithPassword(t){try{let n;if("email"in t){const{email:s,password:o,options:a}=t;n=await H(this.fetch,"POST",`${this.url}/token?grant_type=password`,{headers:this.headers,body:{email:s,password:o,gotrue_meta_security:{captcha_token:a==null?void 0:a.captchaToken}},xform:Jg})}else if("phone"in t){const{phone:s,password:o,options:a}=t;n=await H(this.fetch,"POST",`${this.url}/token?grant_type=password`,{headers:this.headers,body:{phone:s,password:o,gotrue_meta_security:{captcha_token:a==null?void 0:a.captchaToken}},xform:Jg})}else throw new ca("You must provide either an email or phone number and a password");const{data:r,error:i}=n;if(i)return this._returnResult({data:{user:null,session:null},error:i});if(!r||!r.session||!r.user){const s=new Xr;return this._returnResult({data:{user:null,session:null},error:s})}return r.session&&(await this._saveSession(r.session),await this._notifyAllSubscribers("SIGNED_IN",r.session)),this._returnResult({data:Object.assign({user:r.user,session:r.session},r.weak_password?{weakPassword:r.weak_password}:null),error:i})}catch(n){if(z(n))return this._returnResult({data:{user:null,session:null},error:n});throw n}}async signInWithOAuth(t){var n,r,i,s;return await this._handleProviderSignIn(t.provider,{redirectTo:(n=t.options)===null||n===void 0?void 0:n.redirectTo,scopes:(r=t.options)===null||r===void 0?void 0:r.scopes,queryParams:(i=t.options)===null||i===void 0?void 0:i.queryParams,skipBrowserRedirect:(s=t.options)===null||s===void 0?void 0:s.skipBrowserRedirect})}async exchangeCodeForSession(t){return await this.initializePromise,this._acquireLock(this.lockAcquireTimeout,async()=>this._exchangeCodeForSession(t))}async signInWithWeb3(t){const{chain:n}=t;switch(n){case"ethereum":return await this.signInWithEthereum(t);case"solana":return await this.signInWithSolana(t);default:throw new Error(`@supabase/auth-js: Unsupported chain "${n}"`)}}async signInWithEthereum(t){var n,r,i,s,o,a,l,u,c,d,h;let f,p;if("message"in t)f=t.message,p=t.signature;else{const{chain:v,wallet:w,statement:m,options:g}=t;let y;if(Me())if(typeof w=="object")y=w;else{const O=window;if("ethereum"in O&&typeof O.ethereum=="object"&&"request"in O.ethereum&&typeof O.ethereum.request=="function")y=O.ethereum;else throw new Error("@supabase/auth-js: No compatible Ethereum wallet interface on the window object (window.ethereum) detected. Make sure the user already has a wallet installed and connected for this app. Prefer passing the wallet interface object directly to signInWithWeb3({ chain: 'ethereum', wallet: resolvedUserWallet }) instead.")}else{if(typeof w!="object"||!(g!=null&&g.url))throw new Error("@supabase/auth-js: Both wallet and url must be specified in non-browser environments.");y=w}const k=new URL((n=g==null?void 0:g.url)!==null&&n!==void 0?n:window.location.href),T=await y.request({method:"eth_requestAccounts"}).then(O=>O).catch(()=>{throw new Error("@supabase/auth-js: Wallet method eth_requestAccounts is missing or invalid")});if(!T||T.length===0)throw new Error("@supabase/auth-js: No accounts available. Please ensure the wallet is connected.");const S=x1(T[0]);let P=(r=g==null?void 0:g.signInWithEthereum)===null||r===void 0?void 0:r.chainId;if(!P){const O=await y.request({method:"eth_chainId"});P=BN(O)}const A={domain:k.host,address:S,statement:m,uri:k.href,version:"1",chainId:P,nonce:(i=g==null?void 0:g.signInWithEthereum)===null||i===void 0?void 0:i.nonce,issuedAt:(o=(s=g==null?void 0:g.signInWithEthereum)===null||s===void 0?void 0:s.issuedAt)!==null&&o!==void 0?o:new Date,expirationTime:(a=g==null?void 0:g.signInWithEthereum)===null||a===void 0?void 0:a.expirationTime,notBefore:(l=g==null?void 0:g.signInWithEthereum)===null||l===void 0?void 0:l.notBefore,requestId:(u=g==null?void 0:g.signInWithEthereum)===null||u===void 0?void 0:u.requestId,resources:(c=g==null?void 0:g.signInWithEthereum)===null||c===void 0?void 0:c.resources};f=$N(A),p=await y.request({method:"personal_sign",params:[FN(f),S]})}try{const{data:v,error:w}=await H(this.fetch,"POST",`${this.url}/token?grant_type=web3`,{headers:this.headers,body:Object.assign({chain:"ethereum",message:f,signature:p},!((d=t.options)===null||d===void 0)&&d.captchaToken?{gotrue_meta_security:{captcha_token:(h=t.options)===null||h===void 0?void 0:h.captchaToken}}:null),xform:$t});if(w)throw w;if(!v||!v.session||!v.user){const m=new Xr;return this._returnResult({data:{user:null,session:null},error:m})}return v.session&&(await this._saveSession(v.session),await this._notifyAllSubscribers("SIGNED_IN",v.session)),this._returnResult({data:Object.assign({},v),error:w})}catch(v){if(z(v))return this._returnResult({data:{user:null,session:null},error:v});throw v}}async signInWithSolana(t){var n,r,i,s,o,a,l,u,c,d,h,f;let p,v;if("message"in t)p=t.message,v=t.signature;else{const{chain:w,wallet:m,statement:g,options:y}=t;let k;if(Me())if(typeof m=="object")k=m;else{const S=window;if("solana"in S&&typeof S.solana=="object"&&("signIn"in S.solana&&typeof S.solana.signIn=="function"||"signMessage"in S.solana&&typeof S.solana.signMessage=="function"))k=S.solana;else throw new Error("@supabase/auth-js: No compatible Solana wallet interface on the window object (window.solana) detected. Make sure the user already has a wallet installed and connected for this app. Prefer passing the wallet interface object directly to signInWithWeb3({ chain: 'solana', wallet: resolvedUserWallet }) instead.")}else{if(typeof m!="object"||!(y!=null&&y.url))throw new Error("@supabase/auth-js: Both wallet and url must be specified in non-browser environments.");k=m}const T=new URL((n=y==null?void 0:y.url)!==null&&n!==void 0?n:window.location.href);if("signIn"in k&&k.signIn){const S=await k.signIn(Object.assign(Object.assign(Object.assign({issuedAt:new Date().toISOString()},y==null?void 0:y.signInWithSolana),{version:"1",domain:T.host,uri:T.href}),g?{statement:g}:null));let P;if(Array.isArray(S)&&S[0]&&typeof S[0]=="object")P=S[0];else if(S&&typeof S=="object"&&"signedMessage"in S&&"signature"in S)P=S;else throw new Error("@supabase/auth-js: Wallet method signIn() returned unrecognized value");if("signedMessage"in P&&"signature"in P&&(typeof P.signedMessage=="string"||P.signedMessage instanceof Uint8Array)&&P.signature instanceof Uint8Array)p=typeof P.signedMessage=="string"?P.signedMessage:new TextDecoder().decode(P.signedMessage),v=P.signature;else throw new Error("@supabase/auth-js: Wallet method signIn() API returned object without signedMessage and signature fields")}else{if(!("signMessage"in k)||typeof k.signMessage!="function"||!("publicKey"in k)||typeof k!="object"||!k.publicKey||!("toBase58"in k.publicKey)||typeof k.publicKey.toBase58!="function")throw new Error("@supabase/auth-js: Wallet does not have a compatible signMessage() and publicKey.toBase58() API");p=[`${T.host} wants you to sign in with your Solana account:`,k.publicKey.toBase58(),...g?["",g,""]:[""],"Version: 1",`URI: ${T.href}`,`Issued At: ${(i=(r=y==null?void 0:y.signInWithSolana)===null||r===void 0?void 0:r.issuedAt)!==null&&i!==void 0?i:new Date().toISOString()}`,...!((s=y==null?void 0:y.signInWithSolana)===null||s===void 0)&&s.notBefore?[`Not Before: ${y.signInWithSolana.notBefore}`]:[],...!((o=y==null?void 0:y.signInWithSolana)===null||o===void 0)&&o.expirationTime?[`Expiration Time: ${y.signInWithSolana.expirationTime}`]:[],...!((a=y==null?void 0:y.signInWithSolana)===null||a===void 0)&&a.chainId?[`Chain ID: ${y.signInWithSolana.chainId}`]:[],...!((l=y==null?void 0:y.signInWithSolana)===null||l===void 0)&&l.nonce?[`Nonce: ${y.signInWithSolana.nonce}`]:[],...!((u=y==null?void 0:y.signInWithSolana)===null||u===void 0)&&u.requestId?[`Request ID: ${y.signInWithSolana.requestId}`]:[],...!((d=(c=y==null?void 0:y.signInWithSolana)===null||c===void 0?void 0:c.resources)===null||d===void 0)&&d.length?["Resources",...y.signInWithSolana.resources.map(P=>`- ${P}`)]:[]].join(`
`);const S=await k.signMessage(new TextEncoder().encode(p),"utf8");if(!S||!(S instanceof Uint8Array))throw new Error("@supabase/auth-js: Wallet signMessage() API returned an recognized value");v=S}}try{const{data:w,error:m}=await H(this.fetch,"POST",`${this.url}/token?grant_type=web3`,{headers:this.headers,body:Object.assign({chain:"solana",message:p,signature:Rr(v)},!((h=t.options)===null||h===void 0)&&h.captchaToken?{gotrue_meta_security:{captcha_token:(f=t.options)===null||f===void 0?void 0:f.captchaToken}}:null),xform:$t});if(m)throw m;if(!w||!w.session||!w.user){const g=new Xr;return this._returnResult({data:{user:null,session:null},error:g})}return w.session&&(await this._saveSession(w.session),await this._notifyAllSubscribers("SIGNED_IN",w.session)),this._returnResult({data:Object.assign({},w),error:m})}catch(w){if(z(w))return this._returnResult({data:{user:null,session:null},error:w});throw w}}async _exchangeCodeForSession(t){const n=await mr(this.storage,`${this.storageKey}-code-verifier`),[r,i]=(n??"").split("/");try{if(!r&&this.flowType==="pkce")throw new aN;const{data:s,error:o}=await H(this.fetch,"POST",`${this.url}/token?grant_type=pkce`,{headers:this.headers,body:{auth_code:t,code_verifier:r},xform:$t});if(await Le(this.storage,`${this.storageKey}-code-verifier`),o)throw o;if(!s||!s.session||!s.user){const a=new Xr;return this._returnResult({data:{user:null,session:null,redirectType:null},error:a})}return s.session&&(await this._saveSession(s.session),await this._notifyAllSubscribers("SIGNED_IN",s.session)),this._returnResult({data:Object.assign(Object.assign({},s),{redirectType:i??null}),error:o})}catch(s){if(await Le(this.storage,`${this.storageKey}-code-verifier`),z(s))return this._returnResult({data:{user:null,session:null,redirectType:null},error:s});throw s}}async signInWithIdToken(t){try{const{options:n,provider:r,token:i,access_token:s,nonce:o}=t,a=await H(this.fetch,"POST",`${this.url}/token?grant_type=id_token`,{headers:this.headers,body:{provider:r,id_token:i,access_token:s,nonce:o,gotrue_meta_security:{captcha_token:n==null?void 0:n.captchaToken}},xform:$t}),{data:l,error:u}=a;if(u)return this._returnResult({data:{user:null,session:null},error:u});if(!l||!l.session||!l.user){const c=new Xr;return this._returnResult({data:{user:null,session:null},error:c})}return l.session&&(await this._saveSession(l.session),await this._notifyAllSubscribers("SIGNED_IN",l.session)),this._returnResult({data:l,error:u})}catch(n){if(z(n))return this._returnResult({data:{user:null,session:null},error:n});throw n}}async signInWithOtp(t){var n,r,i,s,o;try{if("email"in t){const{email:a,options:l}=t;let u=null,c=null;this.flowType==="pkce"&&([u,c]=await Yr(this.storage,this.storageKey));const{error:d}=await H(this.fetch,"POST",`${this.url}/otp`,{headers:this.headers,body:{email:a,data:(n=l==null?void 0:l.data)!==null&&n!==void 0?n:{},create_user:(r=l==null?void 0:l.shouldCreateUser)!==null&&r!==void 0?r:!0,gotrue_meta_security:{captcha_token:l==null?void 0:l.captchaToken},code_challenge:u,code_challenge_method:c},redirectTo:l==null?void 0:l.emailRedirectTo});return this._returnResult({data:{user:null,session:null},error:d})}if("phone"in t){const{phone:a,options:l}=t,{data:u,error:c}=await H(this.fetch,"POST",`${this.url}/otp`,{headers:this.headers,body:{phone:a,data:(i=l==null?void 0:l.data)!==null&&i!==void 0?i:{},create_user:(s=l==null?void 0:l.shouldCreateUser)!==null&&s!==void 0?s:!0,gotrue_meta_security:{captcha_token:l==null?void 0:l.captchaToken},channel:(o=l==null?void 0:l.channel)!==null&&o!==void 0?o:"sms"}});return this._returnResult({data:{user:null,session:null,messageId:u==null?void 0:u.message_id},error:c})}throw new ca("You must provide either an email or phone number.")}catch(a){if(await Le(this.storage,`${this.storageKey}-code-verifier`),z(a))return this._returnResult({data:{user:null,session:null},error:a});throw a}}async verifyOtp(t){var n,r;try{let i,s;"options"in t&&(i=(n=t.options)===null||n===void 0?void 0:n.redirectTo,s=(r=t.options)===null||r===void 0?void 0:r.captchaToken);const{data:o,error:a}=await H(this.fetch,"POST",`${this.url}/verify`,{headers:this.headers,body:Object.assign(Object.assign({},t),{gotrue_meta_security:{captcha_token:s}}),redirectTo:i,xform:$t});if(a)throw a;if(!o)throw new Error("An error occurred on token verification.");const l=o.session,u=o.user;return l!=null&&l.access_token&&(await this._saveSession(l),await this._notifyAllSubscribers(t.type=="recovery"?"PASSWORD_RECOVERY":"SIGNED_IN",l)),this._returnResult({data:{user:u,session:l},error:null})}catch(i){if(z(i))return this._returnResult({data:{user:null,session:null},error:i});throw i}}async signInWithSSO(t){var n,r,i,s,o;try{let a=null,l=null;this.flowType==="pkce"&&([a,l]=await Yr(this.storage,this.storageKey));const u=await H(this.fetch,"POST",`${this.url}/sso`,{body:Object.assign(Object.assign(Object.assign(Object.assign(Object.assign({},"providerId"in t?{provider_id:t.providerId}:null),"domain"in t?{domain:t.domain}:null),{redirect_to:(r=(n=t.options)===null||n===void 0?void 0:n.redirectTo)!==null&&r!==void 0?r:void 0}),!((i=t==null?void 0:t.options)===null||i===void 0)&&i.captchaToken?{gotrue_meta_security:{captcha_token:t.options.captchaToken}}:null),{skip_http_redirect:!0,code_challenge:a,code_challenge_method:l}),headers:this.headers,xform:NN});return!((s=u.data)===null||s===void 0)&&s.url&&Me()&&!(!((o=t.options)===null||o===void 0)&&o.skipBrowserRedirect)&&window.location.assign(u.data.url),this._returnResult(u)}catch(a){if(await Le(this.storage,`${this.storageKey}-code-verifier`),z(a))return this._returnResult({data:null,error:a});throw a}}async reauthenticate(){return await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>await this._reauthenticate())}async _reauthenticate(){try{return await this._useSession(async t=>{const{data:{session:n},error:r}=t;if(r)throw r;if(!n)throw new ft;const{error:i}=await H(this.fetch,"GET",`${this.url}/reauthenticate`,{headers:this.headers,jwt:n.access_token});return this._returnResult({data:{user:null,session:null},error:i})})}catch(t){if(z(t))return this._returnResult({data:{user:null,session:null},error:t});throw t}}async resend(t){try{const n=`${this.url}/resend`;if("email"in t){const{email:r,type:i,options:s}=t,{error:o}=await H(this.fetch,"POST",n,{headers:this.headers,body:{email:r,type:i,gotrue_meta_security:{captcha_token:s==null?void 0:s.captchaToken}},redirectTo:s==null?void 0:s.emailRedirectTo});return this._returnResult({data:{user:null,session:null},error:o})}else if("phone"in t){const{phone:r,type:i,options:s}=t,{data:o,error:a}=await H(this.fetch,"POST",n,{headers:this.headers,body:{phone:r,type:i,gotrue_meta_security:{captcha_token:s==null?void 0:s.captchaToken}}});return this._returnResult({data:{user:null,session:null,messageId:o==null?void 0:o.message_id},error:a})}throw new ca("You must provide either an email or phone number and a type")}catch(n){if(z(n))return this._returnResult({data:{user:null,session:null},error:n});throw n}}async getSession(){return await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>this._useSession(async n=>n))}async _acquireLock(t,n){this._debug("#_acquireLock","begin",t);try{if(this.lockAcquired){const r=this.pendingInLock.length?this.pendingInLock[this.pendingInLock.length-1]:Promise.resolve(),i=(async()=>(await r,await n()))();return this.pendingInLock.push((async()=>{try{await i}catch{}})()),i}return await this.lock(`lock:${this.storageKey}`,t,async()=>{this._debug("#_acquireLock","lock acquired for storage key",this.storageKey);try{this.lockAcquired=!0;const r=n();for(this.pendingInLock.push((async()=>{try{await r}catch{}})()),await r;this.pendingInLock.length;){const i=[...this.pendingInLock];await Promise.all(i),this.pendingInLock.splice(0,i.length)}return await r}finally{this._debug("#_acquireLock","lock released for storage key",this.storageKey),this.lockAcquired=!1}})}finally{this._debug("#_acquireLock","end")}}async _useSession(t){this._debug("#_useSession","begin");try{const n=await this.__loadSession();return await t(n)}finally{this._debug("#_useSession","end")}}async __loadSession(){this._debug("#__loadSession()","begin"),this.lockAcquired||this._debug("#__loadSession()","used outside of an acquired lock!",new Error().stack);try{let t=null;const n=await mr(this.storage,this.storageKey);if(this._debug("#getSession()","session from storage",n),n!==null&&(this._isValidSession(n)?t=n:(this._debug("#getSession()","session from storage is not valid"),await this._removeSession())),!t)return{data:{session:null},error:null};const r=t.expires_at?t.expires_at*1e3-Date.now()<Yu:!1;if(this._debug("#__loadSession()",`session has${r?"":" not"} expired`,"expires_at",t.expires_at),!r){if(this.userStorage){const o=await mr(this.userStorage,this.storageKey+"-user");o!=null&&o.user?t.user=o.user:t.user=tc()}if(this.storage.isServer&&t.user&&!t.user.__isUserNotAvailableProxy){const o={value:this.suppressGetSessionWarning};t.user=PN(t.user,o),o.value&&(this.suppressGetSessionWarning=!0)}return{data:{session:t},error:null}}const{data:i,error:s}=await this._callRefreshToken(t.refresh_token);return s?this._returnResult({data:{session:null},error:s}):this._returnResult({data:{session:i},error:null})}finally{this._debug("#__loadSession()","end")}}async getUser(t){if(t)return await this._getUser(t);await this.initializePromise;const n=await this._acquireLock(this.lockAcquireTimeout,async()=>await this._getUser());return n.data.user&&(this.suppressGetSessionWarning=!0),n}async _getUser(t){try{return t?await H(this.fetch,"GET",`${this.url}/user`,{headers:this.headers,jwt:t,xform:Un}):await this._useSession(async n=>{var r,i,s;const{data:o,error:a}=n;if(a)throw a;return!(!((r=o.session)===null||r===void 0)&&r.access_token)&&!this.hasCustomAuthorizationHeader?{data:{user:null},error:new ft}:await H(this.fetch,"GET",`${this.url}/user`,{headers:this.headers,jwt:(s=(i=o.session)===null||i===void 0?void 0:i.access_token)!==null&&s!==void 0?s:void 0,xform:Un})})}catch(n){if(z(n))return Zu(n)&&(await this._removeSession(),await Le(this.storage,`${this.storageKey}-code-verifier`)),this._returnResult({data:{user:null},error:n});throw n}}async updateUser(t,n={}){return await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>await this._updateUser(t,n))}async _updateUser(t,n={}){try{return await this._useSession(async r=>{const{data:i,error:s}=r;if(s)throw s;if(!i.session)throw new ft;const o=i.session;let a=null,l=null;this.flowType==="pkce"&&t.email!=null&&([a,l]=await Yr(this.storage,this.storageKey));const{data:u,error:c}=await H(this.fetch,"PUT",`${this.url}/user`,{headers:this.headers,redirectTo:n==null?void 0:n.emailRedirectTo,body:Object.assign(Object.assign({},t),{code_challenge:a,code_challenge_method:l}),jwt:o.access_token,xform:Un});if(c)throw c;return o.user=u.user,await this._saveSession(o),await this._notifyAllSubscribers("USER_UPDATED",o),this._returnResult({data:{user:o.user},error:null})})}catch(r){if(await Le(this.storage,`${this.storageKey}-code-verifier`),z(r))return this._returnResult({data:{user:null},error:r});throw r}}async setSession(t){return await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>await this._setSession(t))}async _setSession(t){try{if(!t.access_token||!t.refresh_token)throw new ft;const n=Date.now()/1e3;let r=n,i=!0,s=null;const{payload:o}=ha(t.access_token);if(o.exp&&(r=o.exp,i=r<=n),i){const{data:a,error:l}=await this._callRefreshToken(t.refresh_token);if(l)return this._returnResult({data:{user:null,session:null},error:l});if(!a)return{data:{user:null,session:null},error:null};s=a}else{const{data:a,error:l}=await this._getUser(t.access_token);if(l)return this._returnResult({data:{user:null,session:null},error:l});s={access_token:t.access_token,refresh_token:t.refresh_token,user:a.user,token_type:"bearer",expires_in:r-n,expires_at:r},await this._saveSession(s),await this._notifyAllSubscribers("SIGNED_IN",s)}return this._returnResult({data:{user:s.user,session:s},error:null})}catch(n){if(z(n))return this._returnResult({data:{session:null,user:null},error:n});throw n}}async refreshSession(t){return await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>await this._refreshSession(t))}async _refreshSession(t){try{return await this._useSession(async n=>{var r;if(!t){const{data:o,error:a}=n;if(a)throw a;t=(r=o.session)!==null&&r!==void 0?r:void 0}if(!(t!=null&&t.refresh_token))throw new ft;const{data:i,error:s}=await this._callRefreshToken(t.refresh_token);return s?this._returnResult({data:{user:null,session:null},error:s}):i?this._returnResult({data:{user:i.user,session:i},error:null}):this._returnResult({data:{user:null,session:null},error:null})})}catch(n){if(z(n))return this._returnResult({data:{user:null,session:null},error:n});throw n}}async _getSessionFromURL(t,n){try{if(!Me())throw new da("No browser detected.");if(t.error||t.error_description||t.error_code)throw new da(t.error_description||"Error in URL with unspecified error_description",{error:t.error||"unspecified_error",code:t.error_code||"unspecified_code"});switch(n){case"implicit":if(this.flowType==="pkce")throw new Vg("Not a valid PKCE flow url.");break;case"pkce":if(this.flowType==="implicit")throw new da("Not a valid implicit grant flow url.");break;default:}if(n==="pkce"){if(this._debug("#_initialize()","begin","is PKCE flow",!0),!t.code)throw new Vg("No code detected.");const{data:g,error:y}=await this._exchangeCodeForSession(t.code);if(y)throw y;const k=new URL(window.location.href);return k.searchParams.delete("code"),window.history.replaceState(window.history.state,"",k.toString()),{data:{session:g.session,redirectType:null},error:null}}const{provider_token:r,provider_refresh_token:i,access_token:s,refresh_token:o,expires_in:a,expires_at:l,token_type:u}=t;if(!s||!a||!o||!u)throw new da("No session defined in URL");const c=Math.round(Date.now()/1e3),d=parseInt(a);let h=c+d;l&&(h=parseInt(l));const f=h-c;f*1e3<=ii&&console.warn(`@supabase/gotrue-js: Session as retrieved from URL expires in ${f}s, should have been closer to ${d}s`);const p=h-d;c-p>=120?console.warn("@supabase/gotrue-js: Session as retrieved from URL was issued over 120s ago, URL could be stale",p,h,c):c-p<0&&console.warn("@supabase/gotrue-js: Session as retrieved from URL was issued in the future? Check the device clock for skew",p,h,c);const{data:v,error:w}=await this._getUser(s);if(w)throw w;const m={provider_token:r,provider_refresh_token:i,access_token:s,expires_in:d,expires_at:h,refresh_token:o,token_type:u,user:v.user};return window.location.hash="",this._debug("#_getSessionFromURL()","clearing window.location.hash"),this._returnResult({data:{session:m,redirectType:t.type},error:null})}catch(r){if(z(r))return this._returnResult({data:{session:null,redirectType:null},error:r});throw r}}_isImplicitGrantCallback(t){return typeof this.detectSessionInUrl=="function"?this.detectSessionInUrl(new URL(window.location.href),t):!!(t.access_token||t.error_description)}async _isPKCECallback(t){const n=await mr(this.storage,`${this.storageKey}-code-verifier`);return!!(t.code&&n)}async signOut(t={scope:"global"}){return await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>await this._signOut(t))}async _signOut({scope:t}={scope:"global"}){return await this._useSession(async n=>{var r;const{data:i,error:s}=n;if(s&&!Zu(s))return this._returnResult({error:s});const o=(r=i.session)===null||r===void 0?void 0:r.access_token;if(o){const{error:a}=await this.admin.signOut(o,t);if(a&&!(sN(a)&&(a.status===404||a.status===401||a.status===403)||Zu(a)))return this._returnResult({error:a})}return t!=="others"&&(await this._removeSession(),await Le(this.storage,`${this.storageKey}-code-verifier`)),this._returnResult({error:null})})}onAuthStateChange(t){const n=pN(),r={id:n,callback:t,unsubscribe:()=>{this._debug("#unsubscribe()","state change callback with id removed",n),this.stateChangeEmitters.delete(n)}};return this._debug("#onAuthStateChange()","registered callback with id",n),this.stateChangeEmitters.set(n,r),(async()=>(await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>{this._emitInitialSession(n)})))(),{data:{subscription:r}}}async _emitInitialSession(t){return await this._useSession(async n=>{var r,i;try{const{data:{session:s},error:o}=n;if(o)throw o;await((r=this.stateChangeEmitters.get(t))===null||r===void 0?void 0:r.callback("INITIAL_SESSION",s)),this._debug("INITIAL_SESSION","callback id",t,"session",s)}catch(s){await((i=this.stateChangeEmitters.get(t))===null||i===void 0?void 0:i.callback("INITIAL_SESSION",null)),this._debug("INITIAL_SESSION","callback id",t,"error",s),console.error(s)}})}async resetPasswordForEmail(t,n={}){let r=null,i=null;this.flowType==="pkce"&&([r,i]=await Yr(this.storage,this.storageKey,!0));try{return await H(this.fetch,"POST",`${this.url}/recover`,{body:{email:t,code_challenge:r,code_challenge_method:i,gotrue_meta_security:{captcha_token:n.captchaToken}},headers:this.headers,redirectTo:n.redirectTo})}catch(s){if(await Le(this.storage,`${this.storageKey}-code-verifier`),z(s))return this._returnResult({data:null,error:s});throw s}}async getUserIdentities(){var t;try{const{data:n,error:r}=await this.getUser();if(r)throw r;return this._returnResult({data:{identities:(t=n.user.identities)!==null&&t!==void 0?t:[]},error:null})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}}async linkIdentity(t){return"token"in t?this.linkIdentityIdToken(t):this.linkIdentityOAuth(t)}async linkIdentityOAuth(t){var n;try{const{data:r,error:i}=await this._useSession(async s=>{var o,a,l,u,c;const{data:d,error:h}=s;if(h)throw h;const f=await this._getUrlForProvider(`${this.url}/user/identities/authorize`,t.provider,{redirectTo:(o=t.options)===null||o===void 0?void 0:o.redirectTo,scopes:(a=t.options)===null||a===void 0?void 0:a.scopes,queryParams:(l=t.options)===null||l===void 0?void 0:l.queryParams,skipBrowserRedirect:!0});return await H(this.fetch,"GET",f,{headers:this.headers,jwt:(c=(u=d.session)===null||u===void 0?void 0:u.access_token)!==null&&c!==void 0?c:void 0})});if(i)throw i;return Me()&&!(!((n=t.options)===null||n===void 0)&&n.skipBrowserRedirect)&&window.location.assign(r==null?void 0:r.url),this._returnResult({data:{provider:t.provider,url:r==null?void 0:r.url},error:null})}catch(r){if(z(r))return this._returnResult({data:{provider:t.provider,url:null},error:r});throw r}}async linkIdentityIdToken(t){return await this._useSession(async n=>{var r;try{const{error:i,data:{session:s}}=n;if(i)throw i;const{options:o,provider:a,token:l,access_token:u,nonce:c}=t,d=await H(this.fetch,"POST",`${this.url}/token?grant_type=id_token`,{headers:this.headers,jwt:(r=s==null?void 0:s.access_token)!==null&&r!==void 0?r:void 0,body:{provider:a,id_token:l,access_token:u,nonce:c,link_identity:!0,gotrue_meta_security:{captcha_token:o==null?void 0:o.captchaToken}},xform:$t}),{data:h,error:f}=d;return f?this._returnResult({data:{user:null,session:null},error:f}):!h||!h.session||!h.user?this._returnResult({data:{user:null,session:null},error:new Xr}):(h.session&&(await this._saveSession(h.session),await this._notifyAllSubscribers("USER_UPDATED",h.session)),this._returnResult({data:h,error:f}))}catch(i){if(await Le(this.storage,`${this.storageKey}-code-verifier`),z(i))return this._returnResult({data:{user:null,session:null},error:i});throw i}})}async unlinkIdentity(t){try{return await this._useSession(async n=>{var r,i;const{data:s,error:o}=n;if(o)throw o;return await H(this.fetch,"DELETE",`${this.url}/user/identities/${t.identity_id}`,{headers:this.headers,jwt:(i=(r=s.session)===null||r===void 0?void 0:r.access_token)!==null&&i!==void 0?i:void 0})})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}}async _refreshAccessToken(t){const n=`#_refreshAccessToken(${t.substring(0,5)}...)`;this._debug(n,"begin");try{const r=Date.now();return await vN(async i=>(i>0&&await yN(200*Math.pow(2,i-1)),this._debug(n,"refreshing attempt",i),await H(this.fetch,"POST",`${this.url}/token?grant_type=refresh_token`,{body:{refresh_token:t},headers:this.headers,xform:$t})),(i,s)=>{const o=200*Math.pow(2,i);return s&&ec(s)&&Date.now()+o-r<ii})}catch(r){if(this._debug(n,"error",r),z(r))return this._returnResult({data:{session:null,user:null},error:r});throw r}finally{this._debug(n,"end")}}_isValidSession(t){return typeof t=="object"&&t!==null&&"access_token"in t&&"refresh_token"in t&&"expires_at"in t}async _handleProviderSignIn(t,n){const r=await this._getUrlForProvider(`${this.url}/authorize`,t,{redirectTo:n.redirectTo,scopes:n.scopes,queryParams:n.queryParams});return this._debug("#_handleProviderSignIn()","provider",t,"options",n,"url",r),Me()&&!n.skipBrowserRedirect&&window.location.assign(r),{data:{provider:t,url:r},error:null}}async _recoverAndRefresh(){var t,n;const r="#_recoverAndRefresh()";this._debug(r,"begin");try{const i=await mr(this.storage,this.storageKey);if(i&&this.userStorage){let o=await mr(this.userStorage,this.storageKey+"-user");!this.storage.isServer&&Object.is(this.storage,this.userStorage)&&!o&&(o={user:i.user},await si(this.userStorage,this.storageKey+"-user",o)),i.user=(t=o==null?void 0:o.user)!==null&&t!==void 0?t:tc()}else if(i&&!i.user&&!i.user){const o=await mr(this.storage,this.storageKey+"-user");o&&(o!=null&&o.user)?(i.user=o.user,await Le(this.storage,this.storageKey+"-user"),await si(this.storage,this.storageKey,i)):i.user=tc()}if(this._debug(r,"session from storage",i),!this._isValidSession(i)){this._debug(r,"session is not valid"),i!==null&&await this._removeSession();return}const s=((n=i.expires_at)!==null&&n!==void 0?n:1/0)*1e3-Date.now()<Yu;if(this._debug(r,`session has${s?"":" not"} expired with margin of ${Yu}s`),s){if(this.autoRefreshToken&&i.refresh_token){const{error:o}=await this._callRefreshToken(i.refresh_token);o&&(console.error(o),ec(o)||(this._debug(r,"refresh failed with a non-retryable error, removing the session",o),await this._removeSession()))}}else if(i.user&&i.user.__isUserNotAvailableProxy===!0)try{const{data:o,error:a}=await this._getUser(i.access_token);!a&&(o!=null&&o.user)?(i.user=o.user,await this._saveSession(i),await this._notifyAllSubscribers("SIGNED_IN",i)):this._debug(r,"could not get user data, skipping SIGNED_IN notification")}catch(o){console.error("Error getting user data:",o),this._debug(r,"error getting user data, skipping SIGNED_IN notification",o)}else await this._notifyAllSubscribers("SIGNED_IN",i)}catch(i){this._debug(r,"error",i),console.error(i);return}finally{this._debug(r,"end")}}async _callRefreshToken(t){var n,r;if(!t)throw new ft;if(this.refreshingDeferred)return this.refreshingDeferred.promise;const i=`#_callRefreshToken(${t.substring(0,5)}...)`;this._debug(i,"begin");try{this.refreshingDeferred=new nu;const{data:s,error:o}=await this._refreshAccessToken(t);if(o)throw o;if(!s.session)throw new ft;await this._saveSession(s.session),await this._notifyAllSubscribers("TOKEN_REFRESHED",s.session);const a={data:s.session,error:null};return this.refreshingDeferred.resolve(a),a}catch(s){if(this._debug(i,"error",s),z(s)){const o={data:null,error:s};return ec(s)||await this._removeSession(),(n=this.refreshingDeferred)===null||n===void 0||n.resolve(o),o}throw(r=this.refreshingDeferred)===null||r===void 0||r.reject(s),s}finally{this.refreshingDeferred=null,this._debug(i,"end")}}async _notifyAllSubscribers(t,n,r=!0){const i=`#_notifyAllSubscribers(${t})`;this._debug(i,"begin",n,`broadcast = ${r}`);try{this.broadcastChannel&&r&&this.broadcastChannel.postMessage({event:t,session:n});const s=[],o=Array.from(this.stateChangeEmitters.values()).map(async a=>{try{await a.callback(t,n)}catch(l){s.push(l)}});if(await Promise.all(o),s.length>0){for(let a=0;a<s.length;a+=1)console.error(s[a]);throw s[0]}}finally{this._debug(i,"end")}}async _saveSession(t){this._debug("#_saveSession()",t),this.suppressGetSessionWarning=!0,await Le(this.storage,`${this.storageKey}-code-verifier`);const n=Object.assign({},t),r=n.user&&n.user.__isUserNotAvailableProxy===!0;if(this.userStorage){!r&&n.user&&await si(this.userStorage,this.storageKey+"-user",{user:n.user});const i=Object.assign({},n);delete i.user;const s=Gg(i);await si(this.storage,this.storageKey,s)}else{const i=Gg(n);await si(this.storage,this.storageKey,i)}}async _removeSession(){this._debug("#_removeSession()"),this.suppressGetSessionWarning=!1,await Le(this.storage,this.storageKey),await Le(this.storage,this.storageKey+"-code-verifier"),await Le(this.storage,this.storageKey+"-user"),this.userStorage&&await Le(this.userStorage,this.storageKey+"-user"),await this._notifyAllSubscribers("SIGNED_OUT",null)}_removeVisibilityChangedCallback(){this._debug("#_removeVisibilityChangedCallback()");const t=this.visibilityChangedCallback;this.visibilityChangedCallback=null;try{t&&Me()&&(window!=null&&window.removeEventListener)&&window.removeEventListener("visibilitychange",t)}catch(n){console.error("removing visibilitychange callback failed",n)}}async _startAutoRefresh(){await this._stopAutoRefresh(),this._debug("#_startAutoRefresh()");const t=setInterval(()=>this._autoRefreshTokenTick(),ii);this.autoRefreshTicker=t,t&&typeof t=="object"&&typeof t.unref=="function"?t.unref():typeof Deno<"u"&&typeof Deno.unrefTimer=="function"&&Deno.unrefTimer(t);const n=setTimeout(async()=>{await this.initializePromise,await this._autoRefreshTokenTick()},0);this.autoRefreshTickTimeout=n,n&&typeof n=="object"&&typeof n.unref=="function"?n.unref():typeof Deno<"u"&&typeof Deno.unrefTimer=="function"&&Deno.unrefTimer(n)}async _stopAutoRefresh(){this._debug("#_stopAutoRefresh()");const t=this.autoRefreshTicker;this.autoRefreshTicker=null,t&&clearInterval(t);const n=this.autoRefreshTickTimeout;this.autoRefreshTickTimeout=null,n&&clearTimeout(n)}async startAutoRefresh(){this._removeVisibilityChangedCallback(),await this._startAutoRefresh()}async stopAutoRefresh(){this._removeVisibilityChangedCallback(),await this._stopAutoRefresh()}async _autoRefreshTokenTick(){this._debug("#_autoRefreshTokenTick()","begin");try{await this._acquireLock(0,async()=>{try{const t=Date.now();try{return await this._useSession(async n=>{const{data:{session:r}}=n;if(!r||!r.refresh_token||!r.expires_at){this._debug("#_autoRefreshTokenTick()","no session");return}const i=Math.floor((r.expires_at*1e3-t)/ii);this._debug("#_autoRefreshTokenTick()",`access token expires in ${i} ticks, a tick lasts ${ii}ms, refresh threshold is ${Fd} ticks`),i<=Fd&&await this._callRefreshToken(r.refresh_token)})}catch(n){console.error("Auto refresh tick failed with error. This is likely a transient error.",n)}}finally{this._debug("#_autoRefreshTokenTick()","end")}})}catch(t){if(t.isAcquireTimeout||t instanceof v1)this._debug("auto refresh token tick lock not available");else throw t}}async _handleVisibilityChange(){if(this._debug("#_handleVisibilityChange()"),!Me()||!(window!=null&&window.addEventListener))return this.autoRefreshToken&&this.startAutoRefresh(),!1;try{this.visibilityChangedCallback=async()=>{try{await this._onVisibilityChanged(!1)}catch(t){this._debug("#visibilityChangedCallback","error",t)}},window==null||window.addEventListener("visibilitychange",this.visibilityChangedCallback),await this._onVisibilityChanged(!0)}catch(t){console.error("_handleVisibilityChange",t)}}async _onVisibilityChanged(t){const n=`#_onVisibilityChanged(${t})`;this._debug(n,"visibilityState",document.visibilityState),document.visibilityState==="visible"?(this.autoRefreshToken&&this._startAutoRefresh(),t||(await this.initializePromise,await this._acquireLock(this.lockAcquireTimeout,async()=>{if(document.visibilityState!=="visible"){this._debug(n,"acquired the lock to recover the session, but the browser visibilityState is no longer visible, aborting");return}await this._recoverAndRefresh()}))):document.visibilityState==="hidden"&&this.autoRefreshToken&&this._stopAutoRefresh()}async _getUrlForProvider(t,n,r){const i=[`provider=${encodeURIComponent(n)}`];if(r!=null&&r.redirectTo&&i.push(`redirect_to=${encodeURIComponent(r.redirectTo)}`),r!=null&&r.scopes&&i.push(`scopes=${encodeURIComponent(r.scopes)}`),this.flowType==="pkce"){const[s,o]=await Yr(this.storage,this.storageKey),a=new URLSearchParams({code_challenge:`${encodeURIComponent(s)}`,code_challenge_method:`${encodeURIComponent(o)}`});i.push(a.toString())}if(r!=null&&r.queryParams){const s=new URLSearchParams(r.queryParams);i.push(s.toString())}return r!=null&&r.skipBrowserRedirect&&i.push(`skip_http_redirect=${r.skipBrowserRedirect}`),`${t}?${i.join("&")}`}async _unenroll(t){try{return await this._useSession(async n=>{var r;const{data:i,error:s}=n;return s?this._returnResult({data:null,error:s}):await H(this.fetch,"DELETE",`${this.url}/factors/${t.factorId}`,{headers:this.headers,jwt:(r=i==null?void 0:i.session)===null||r===void 0?void 0:r.access_token})})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}}async _enroll(t){try{return await this._useSession(async n=>{var r,i;const{data:s,error:o}=n;if(o)return this._returnResult({data:null,error:o});const a=Object.assign({friendly_name:t.friendlyName,factor_type:t.factorType},t.factorType==="phone"?{phone:t.phone}:t.factorType==="totp"?{issuer:t.issuer}:{}),{data:l,error:u}=await H(this.fetch,"POST",`${this.url}/factors`,{body:a,headers:this.headers,jwt:(r=s==null?void 0:s.session)===null||r===void 0?void 0:r.access_token});return u?this._returnResult({data:null,error:u}):(t.factorType==="totp"&&l.type==="totp"&&(!((i=l==null?void 0:l.totp)===null||i===void 0)&&i.qr_code)&&(l.totp.qr_code=`data:image/svg+xml;utf-8,${l.totp.qr_code}`),this._returnResult({data:l,error:null}))})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}}async _verify(t){return this._acquireLock(this.lockAcquireTimeout,async()=>{try{return await this._useSession(async n=>{var r;const{data:i,error:s}=n;if(s)return this._returnResult({data:null,error:s});const o=Object.assign({challenge_id:t.challengeId},"webauthn"in t?{webauthn:Object.assign(Object.assign({},t.webauthn),{credential_response:t.webauthn.type==="create"?GN(t.webauthn.credential_response):KN(t.webauthn.credential_response)})}:{code:t.code}),{data:a,error:l}=await H(this.fetch,"POST",`${this.url}/factors/${t.factorId}/verify`,{body:o,headers:this.headers,jwt:(r=i==null?void 0:i.session)===null||r===void 0?void 0:r.access_token});return l?this._returnResult({data:null,error:l}):(await this._saveSession(Object.assign({expires_at:Math.round(Date.now()/1e3)+a.expires_in},a)),await this._notifyAllSubscribers("MFA_CHALLENGE_VERIFIED",a),this._returnResult({data:a,error:l}))})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}})}async _challenge(t){return this._acquireLock(this.lockAcquireTimeout,async()=>{try{return await this._useSession(async n=>{var r;const{data:i,error:s}=n;if(s)return this._returnResult({data:null,error:s});const o=await H(this.fetch,"POST",`${this.url}/factors/${t.factorId}/challenge`,{body:t,headers:this.headers,jwt:(r=i==null?void 0:i.session)===null||r===void 0?void 0:r.access_token});if(o.error)return o;const{data:a}=o;if(a.type!=="webauthn")return{data:a,error:null};switch(a.webauthn.type){case"create":return{data:Object.assign(Object.assign({},a),{webauthn:Object.assign(Object.assign({},a.webauthn),{credential_options:Object.assign(Object.assign({},a.webauthn.credential_options),{publicKey:HN(a.webauthn.credential_options.publicKey)})})}),error:null};case"request":return{data:Object.assign(Object.assign({},a),{webauthn:Object.assign(Object.assign({},a.webauthn),{credential_options:Object.assign(Object.assign({},a.webauthn.credential_options),{publicKey:WN(a.webauthn.credential_options.publicKey)})})}),error:null}}})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}})}async _challengeAndVerify(t){const{data:n,error:r}=await this._challenge({factorId:t.factorId});return r?this._returnResult({data:null,error:r}):await this._verify({factorId:t.factorId,challengeId:n.id,code:t.code})}async _listFactors(){var t;const{data:{user:n},error:r}=await this.getUser();if(r)return{data:null,error:r};const i={all:[],phone:[],totp:[],webauthn:[]};for(const s of(t=n==null?void 0:n.factors)!==null&&t!==void 0?t:[])i.all.push(s),s.status==="verified"&&i[s.factor_type].push(s);return{data:i,error:null}}async _getAuthenticatorAssuranceLevel(t){var n,r,i,s;if(t)try{const{payload:f}=ha(t);let p=null;f.aal&&(p=f.aal);let v=p;const{data:{user:w},error:m}=await this.getUser(t);if(m)return this._returnResult({data:null,error:m});((r=(n=w==null?void 0:w.factors)===null||n===void 0?void 0:n.filter(k=>k.status==="verified"))!==null&&r!==void 0?r:[]).length>0&&(v="aal2");const y=f.amr||[];return{data:{currentLevel:p,nextLevel:v,currentAuthenticationMethods:y},error:null}}catch(f){if(z(f))return this._returnResult({data:null,error:f});throw f}const{data:{session:o},error:a}=await this.getSession();if(a)return this._returnResult({data:null,error:a});if(!o)return{data:{currentLevel:null,nextLevel:null,currentAuthenticationMethods:[]},error:null};const{payload:l}=ha(o.access_token);let u=null;l.aal&&(u=l.aal);let c=u;((s=(i=o.user.factors)===null||i===void 0?void 0:i.filter(f=>f.status==="verified"))!==null&&s!==void 0?s:[]).length>0&&(c="aal2");const h=l.amr||[];return{data:{currentLevel:u,nextLevel:c,currentAuthenticationMethods:h},error:null}}async _getAuthorizationDetails(t){try{return await this._useSession(async n=>{const{data:{session:r},error:i}=n;return i?this._returnResult({data:null,error:i}):r?await H(this.fetch,"GET",`${this.url}/oauth/authorizations/${t}`,{headers:this.headers,jwt:r.access_token,xform:s=>({data:s,error:null})}):this._returnResult({data:null,error:new ft})})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}}async _approveAuthorization(t,n){try{return await this._useSession(async r=>{const{data:{session:i},error:s}=r;if(s)return this._returnResult({data:null,error:s});if(!i)return this._returnResult({data:null,error:new ft});const o=await H(this.fetch,"POST",`${this.url}/oauth/authorizations/${t}/consent`,{headers:this.headers,jwt:i.access_token,body:{action:"approve"},xform:a=>({data:a,error:null})});return o.data&&o.data.redirect_url&&Me()&&!(n!=null&&n.skipBrowserRedirect)&&window.location.assign(o.data.redirect_url),o})}catch(r){if(z(r))return this._returnResult({data:null,error:r});throw r}}async _denyAuthorization(t,n){try{return await this._useSession(async r=>{const{data:{session:i},error:s}=r;if(s)return this._returnResult({data:null,error:s});if(!i)return this._returnResult({data:null,error:new ft});const o=await H(this.fetch,"POST",`${this.url}/oauth/authorizations/${t}/consent`,{headers:this.headers,jwt:i.access_token,body:{action:"deny"},xform:a=>({data:a,error:null})});return o.data&&o.data.redirect_url&&Me()&&!(n!=null&&n.skipBrowserRedirect)&&window.location.assign(o.data.redirect_url),o})}catch(r){if(z(r))return this._returnResult({data:null,error:r});throw r}}async _listOAuthGrants(){try{return await this._useSession(async t=>{const{data:{session:n},error:r}=t;return r?this._returnResult({data:null,error:r}):n?await H(this.fetch,"GET",`${this.url}/user/oauth/grants`,{headers:this.headers,jwt:n.access_token,xform:i=>({data:i,error:null})}):this._returnResult({data:null,error:new ft})})}catch(t){if(z(t))return this._returnResult({data:null,error:t});throw t}}async _revokeOAuthGrant(t){try{return await this._useSession(async n=>{const{data:{session:r},error:i}=n;return i?this._returnResult({data:null,error:i}):r?(await H(this.fetch,"DELETE",`${this.url}/user/oauth/grants`,{headers:this.headers,jwt:r.access_token,query:{client_id:t.clientId},noResolveJson:!0}),{data:{},error:null}):this._returnResult({data:null,error:new ft})})}catch(n){if(z(n))return this._returnResult({data:null,error:n});throw n}}async fetchJwk(t,n={keys:[]}){let r=n.keys.find(a=>a.kid===t);if(r)return r;const i=Date.now();if(r=this.jwks.keys.find(a=>a.kid===t),r&&this.jwks_cached_at+rN>i)return r;const{data:s,error:o}=await H(this.fetch,"GET",`${this.url}/.well-known/jwks.json`,{headers:this.headers});if(o)throw o;return!s.keys||s.keys.length===0||(this.jwks=s,this.jwks_cached_at=i,r=s.keys.find(a=>a.kid===t),!r)?null:r}async getClaims(t,n={}){try{let r=t;if(!r){const{data:f,error:p}=await this.getSession();if(p||!f.session)return this._returnResult({data:null,error:p});r=f.session.access_token}const{header:i,payload:s,signature:o,raw:{header:a,payload:l}}=ha(r);n!=null&&n.allowExpired||CN(s.exp);const u=!i.alg||i.alg.startsWith("HS")||!i.kid||!("crypto"in globalThis&&"subtle"in globalThis.crypto)?null:await this.fetchJwk(i.kid,n!=null&&n.keys?{keys:n.keys}:n==null?void 0:n.jwks);if(!u){const{error:f}=await this.getUser(r);if(f)throw f;return{data:{claims:s,header:i,signature:o},error:null}}const c=EN(i.alg),d=await crypto.subtle.importKey("jwk",u,c,!0,["verify"]);if(!await crypto.subtle.verify(c,d,o,hN(`${a}.${l}`)))throw new Vd("Invalid JWT signature");return{data:{claims:s,header:i,signature:o},error:null}}catch(r){if(z(r))return this._returnResult({data:null,error:r});throw r}}}vo.nextInstanceID={};const rj=vo,ij="2.100.1";let ks="";typeof Deno<"u"?ks="deno":typeof document<"u"?ks="web":typeof navigator<"u"&&navigator.product==="ReactNative"?ks="react-native":ks="node";const sj={"X-Client-Info":`supabase-js-${ks}/${ij}`},oj={headers:sj},aj={schema:"public"},lj={autoRefreshToken:!0,persistSession:!0,detectSessionInUrl:!0,flowType:"implicit"},uj={};function xo(e){"@babel/helpers - typeof";return xo=typeof Symbol=="function"&&typeof Symbol.iterator=="symbol"?function(t){return typeof t}:function(t){return t&&typeof Symbol=="function"&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},xo(e)}function cj(e,t){if(xo(e)!="object"||!e)return e;var n=e[Symbol.toPrimitive];if(n!==void 0){var r=n.call(e,t);if(xo(r)!="object")return r;throw new TypeError("@@toPrimitive must return a primitive value.")}return(t==="string"?String:Number)(e)}function dj(e){var t=cj(e,"string");return xo(t)=="symbol"?t:t+""}function hj(e,t,n){return(t=dj(t))in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function ty(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter(function(i){return Object.getOwnPropertyDescriptor(e,i).enumerable})),n.push.apply(n,r)}return n}function _e(e){for(var t=1;t<arguments.length;t++){var n=arguments[t]!=null?arguments[t]:{};t%2?ty(Object(n),!0).forEach(function(r){hj(e,r,n[r])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):ty(Object(n)).forEach(function(r){Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(n,r))})}return e}const fj=e=>e?(...t)=>e(...t):(...t)=>fetch(...t),pj=()=>Headers,mj=(e,t,n)=>{const r=fj(n),i=pj();return async(s,o)=>{var a;const l=(a=await t())!==null&&a!==void 0?a:e;let u=new i(o==null?void 0:o.headers);return u.has("apikey")||u.set("apikey",e),u.has("Authorization")||u.set("Authorization",`Bearer ${l}`),r(s,_e(_e({},o),{},{headers:u}))}};function gj(e){return e.endsWith("/")?e:e+"/"}function yj(e,t){var n,r;const{db:i,auth:s,realtime:o,global:a}=e,{db:l,auth:u,realtime:c,global:d}=t,h={db:_e(_e({},l),i),auth:_e(_e({},u),s),realtime:_e(_e({},c),o),storage:{},global:_e(_e(_e({},d),a),{},{headers:_e(_e({},(n=d==null?void 0:d.headers)!==null&&n!==void 0?n:{}),(r=a==null?void 0:a.headers)!==null&&r!==void 0?r:{})}),accessToken:async()=>""};return e.accessToken?h.accessToken=e.accessToken:delete h.accessToken,h}function vj(e){const t=e==null?void 0:e.trim();if(!t)throw new Error("supabaseUrl is required.");if(!t.match(/^https?:\/\//i))throw new Error("Invalid supabaseUrl: Must be a valid HTTP or HTTPS URL.");try{return new URL(gj(t))}catch{throw Error("Invalid supabaseUrl: Provided URL is malformed.")}}var xj=class extends rj{constructor(e){super(e)}},wj=class{constructor(e,t,n){var r,i;this.supabaseUrl=e,this.supabaseKey=t;const s=vj(e);if(!t)throw new Error("supabaseKey is required.");this.realtimeUrl=new URL("realtime/v1",s),this.realtimeUrl.protocol=this.realtimeUrl.protocol.replace("http","ws"),this.authUrl=new URL("auth/v1",s),this.storageUrl=new URL("storage/v1",s),this.functionsUrl=new URL("functions/v1",s);const o=`sb-${s.hostname.split(".")[0]}-auth-token`,a={db:aj,realtime:uj,auth:_e(_e({},lj),{},{storageKey:o}),global:oj},l=yj(n??{},a);if(this.storageKey=(r=l.auth.storageKey)!==null&&r!==void 0?r:"",this.headers=(i=l.global.headers)!==null&&i!==void 0?i:{},l.accessToken)this.accessToken=l.accessToken,this.auth=new Proxy({},{get:(c,d)=>{throw new Error(`@supabase/supabase-js: Supabase Client is configured with the accessToken option, accessing supabase.auth.${String(d)} is not possible`)}});else{var u;this.auth=this._initSupabaseAuthClient((u=l.auth)!==null&&u!==void 0?u:{},this.headers,l.global.fetch)}this.fetch=mj(t,this._getAccessToken.bind(this),l.global.fetch),this.realtime=this._initRealtimeClient(_e({headers:this.headers,accessToken:this._getAccessToken.bind(this)},l.realtime)),this.accessToken&&Promise.resolve(this.accessToken()).then(c=>this.realtime.setAuth(c)).catch(c=>console.warn("Failed to set initial Realtime auth token:",c)),this.rest=new VR(new URL("rest/v1",s).href,{headers:this.headers,schema:l.db.schema,fetch:this.fetch,timeout:l.db.timeout,urlLengthLimit:l.db.urlLengthLimit}),this.storage=new YO(this.storageUrl.href,this.headers,this.fetch,n==null?void 0:n.storage),l.accessToken||this._listenForAuthEvents()}get functions(){return new IR(this.functionsUrl.href,{headers:this.headers,customFetch:this.fetch})}from(e){return this.rest.from(e)}schema(e){return this.rest.schema(e)}rpc(e,t={},n={head:!1,get:!1,count:void 0}){return this.rest.rpc(e,t,n)}channel(e,t={config:{}}){return this.realtime.channel(e,t)}getChannels(){return this.realtime.getChannels()}removeChannel(e){return this.realtime.removeChannel(e)}removeAllChannels(){return this.realtime.removeAllChannels()}async _getAccessToken(){var e=this,t,n;if(e.accessToken)return await e.accessToken();const{data:r}=await e.auth.getSession();return(t=(n=r.session)===null||n===void 0?void 0:n.access_token)!==null&&t!==void 0?t:e.supabaseKey}_initSupabaseAuthClient({autoRefreshToken:e,persistSession:t,detectSessionInUrl:n,storage:r,userStorage:i,storageKey:s,flowType:o,lock:a,debug:l,throwOnError:u},c,d){const h={Authorization:`Bearer ${this.supabaseKey}`,apikey:`${this.supabaseKey}`};return new xj({url:this.authUrl.href,headers:_e(_e({},h),c),storageKey:s,autoRefreshToken:e,persistSession:t,detectSessionInUrl:n,storage:r,userStorage:i,flowType:o,lock:a,debug:l,throwOnError:u,fetch:d,hasCustomAuthorizationHeader:Object.keys(this.headers).some(f=>f.toLowerCase()==="authorization")})}_initRealtimeClient(e){return new bO(this.realtimeUrl.href,_e(_e({},e),{},{params:_e(_e({},{apikey:this.supabaseKey}),e==null?void 0:e.params)}))}_listenForAuthEvents(){return this.auth.onAuthStateChange((e,t)=>{this._handleTokenChanged(e,"CLIENT",t==null?void 0:t.access_token)})}_handleTokenChanged(e,t,n){(e==="TOKEN_REFRESHED"||e==="SIGNED_IN")&&this.changedAccessToken!==n?(this.changedAccessToken=n,this.realtime.setAuth(n)):e==="SIGNED_OUT"&&(this.realtime.setAuth(),t=="STORAGE"&&this.auth.signOut(),this.changedAccessToken=void 0)}};const kj=(e,t,n)=>new wj(e,t,n);function bj(){if(typeof window<"u")return!1;const e=globalThis.process;if(!e)return!1;const t=e.version;if(t==null)return!1;const n=t.match(/^v(\d+)\./);return n?parseInt(n[1],10)<=18:!1}bj()&&console.warn("⚠️  Node.js 18 and below are deprecated and will no longer be supported in future versions of @supabase/supabase-js. Please upgrade to Node.js 20 or later. For more information, visit: https://github.com/orgs/supabase/discussions/37217");const Sj="https://lsjltfkiqxrmffcercmj.supabase.co",_j="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxzamx0ZmtpcXhybWZmY2VyY21qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ1NTg0MDIsImV4cCI6MjA5MDEzNDQwMn0.04N2_MUZWt0MMecQcparMUh1TF_kfiu-fC_1iJtHats",Cj=kj(Sj,_j);async function Ej(e,t="deepseek-chat"){const{data:n,error:r}=await Cj.functions.invoke("deepseek-chat",{body:{messages:e,model:t}});if(r)throw r;if(n.error)throw new Error(n.error.message||n.error);return n.choices[0].message.content}const ny={變數:{content:'在 JavaScript 中，變數就像是一個有名字的箱子，你可以把值放進去：\n\n• `let` — 可以改的變數（推薦）\n• `const` — 不能改的常數（更推薦）\n• `var` — 舊語法，有 scope 陷阱，不推薦\n\n```js\nconst name = "小迪";\nlet score = 0;\nscore = 100; // OK！\n// name = "大迪"; // 錯！const 不能改\n```',suggestions:["什麼是 scope？","什麼時候用 let vs const？","回到地圖"]},函式:{content:`函式是一段可以重複使用的程式碼：

\`\`\`js
// 函式宣告
function add(a, b) {
  return a + b;
}

// 箭頭函式（更簡潔）
const add = (a, b) => a + b;
\`\`\`

在 DI 專案中，\`calculator.js\` 裡面全是純函式 — 給相同輸入永遠得到相同輸出，不修改外部狀態。`,suggestions:["什麼是純函式？","什麼是箭頭函式？","回到地圖"]},純函式:{content:`純函式有兩個特性：
1. **相同輸入 → 相同輸出**（不依賴外部變數）
2. **沒有副作用**（不修改外部狀態）

\`\`\`js
// ✅ 純函式
function add(a, b) { return a + b; }

// ❌ 不純 — 依賴外部變數
let tax = 0.05;
function total(price) { return price * (1 + tax); }

// ❌ 不純 — 修改外部狀態
let count = 0;
function inc() { count++; return count; }
\`\`\`

DI 專案的 \`calculator.js\` 全是純函式，這讓測試變得超簡單！`,suggestions:["為什麼純函式重要？","什麼是副作用？","回到地圖"]},scope:{content:"Scope（作用域）決定了變數在哪裡可以被存取：\n\n• **Block scope** — `let`/`const` 只活在 `{}` 裡面\n• **Function scope** — `var` 活在整個函式裡\n• **Global scope** — 最外層宣告的全域變數\n\n```js\nif (true) {\n  let x = 1;\n  var y = 2;\n}\n// console.log(x); // 錯！x 在 block 外不存在\nconsole.log(y); // 2 — var 逃出了 block！\n```\n\n這就是為什麼我們不推薦 `var`。",suggestions:["什麼是閉包？","什麼是變數？","回到地圖"]},sql:{content:`在 DI 專案中，Supabase（基於 PostgreSQL）是我們的資料庫。基本 SQL 語法：

\`\`\`sql
-- 查詢資料
SELECT name, stock FROM products WHERE stock < 10;

-- 排序
SELECT * FROM orders ORDER BY created_at DESC;

-- 聚合
SELECT category, AVG(price) FROM products GROUP BY category;

-- JOIN 關聯
SELECT o.id, p.name
FROM orders o
JOIN products p ON o.product_id = p.id;
\`\`\``,suggestions:["什麼是 JOIN？","什麼是 GROUP BY？","回到地圖"]},async:{content:`JavaScript 的非同步就像叫外賣 — 你不用站在門口等，可以先做別的事：

\`\`\`js
// Promise
fetch("/api/data")
  .then(res => res.json())
  .then(data => console.log(data));

// async/await（更好讀）
async function getData() {
  const res = await fetch("/api/data");
  const data = await res.json();
  return data;
}
\`\`\`

DI 專案的 \`aiProxyService.js\` 大量使用 async/await 來處理 API 呼叫。`,suggestions:["什麼是 Promise？","什麼是 EventBus？","回到地圖"]},eventbus:{content:`EventBus（事件匯流排）是發布/訂閱模式的實作：

\`\`\`js
// 訂閱：我對「庫存變動」感興趣
bus.on("inventory-change", (data) => {
  console.log(\`\${data.product} 庫存變成 \${data.stock}\`);
});

// 發布：庫存真的變了！
bus.emit("inventory-change", { product: "螺絲", stock: 42 });
\`\`\`

好處是：發送者和接收者不需要互相知道對方存在，降低耦合度。

DI 專案中 \`eventBus.js\` 用它來串接不同模組。`,suggestions:["什麼是 Semaphore？","什麼是 Circuit Breaker？","回到地圖"]},semaphore:{content:`Semaphore（信號量）限制同時執行的任務數量：

想像一間有 3 個座位的餐廳：
- 前 3 位客人可以直接入座
- 第 4 位客人必須等
- 有人離開後，等待的人才能進去

\`\`\`js
const sem = new AsyncSemaphore(3);
await sem.acquire(); // 搶到座位
// ... 做事 ...
sem.release(); // 離開座位
\`\`\`

DI 專案中用 Semaphore 限制同時發送的 AI API 請求數量，避免被限速。`,suggestions:["什麼是 async/await？","什麼是 Circuit Breaker？","回到地圖"]},"circuit breaker":{content:`Circuit Breaker（熔斷器）保護系統不被連續錯誤壓垮：

三個狀態：
- **CLOSED**（正常）→ 請求正常通過
- **OPEN**（熔斷）→ 連續失敗太多次，直接拒絕請求
- **HALF_OPEN**（試探）→ 冷卻後讓一個請求通過測試

就像家裡的電路跳閘 — 過載時自動斷電保護，等穩定了再手動合回去。

DI 專案的 \`aiProxyService.js\` 用它保護 AI API 呼叫。`,suggestions:["什麼是 Semaphore？","什麼是 ReAct 迴圈？","回到地圖"]},react迴圈:{content:`ReAct（Reasoning + Acting）是 AI Agent 的核心模式：

\`\`\`
迴圈：
  1. 思考（Thought）— 分析目前狀況
  2. 行動（Action）— 選擇並呼叫工具
  3. 觀察（Observation）— 看工具回傳了什麼
  → 回到 1，直到找到答案
\`\`\`

DI 專案的 \`chatAgentLoop.js\` 就是這個模式的實作！

Agent 不是「一次回答」，而是「多步推理」。`,suggestions:["什麼是 Agent？","什麼是 async/await？","回到地圖"]},bom:{content:`BOM（Bill of Materials，物料清單）是製造業的核心概念：

一台車的 BOM：
\`\`\`
車 (×1)
├── 引擎 (×1)
│   ├── 活塞 (×4)
│   └── 火星塞 (×4)
├── 輪胎 (×4)
└── 座椅 (×5)
\`\`\`

「BOM 展開」就是遞迴把這棵樹攤平，算出所有零件的需求量。

DI 專案的 \`bomCalculator.js\` 中的 \`explodeBOM()\` 就是做這件事 — 它用遞迴 + 環路偵測來處理複雜的 BOM 結構。`,suggestions:["什麼是遞迴？","什麼是安全庫存？","回到地圖"]},安全庫存:{content:`安全庫存是為了應對不確定性而額外儲備的庫存量：

公式：**安全庫存 = Z × σ × √LT**

• Z = 服務水準對應的 Z 分數（95% → 1.65，99% → 2.33）
• σ = 需求的標準差（需求波動度）
• LT = 前置時間（天數）

例如：需求標準差 20，前置時間 7 天，95% 服務水準：
→ 1.65 × 20 × √7 ≈ 87 個

DI 專案中 \`calculator.js\` 的 \`calculateDaysToStockout\` 會用到安全庫存來判斷缺貨風險。`,suggestions:["什麼是 BOM？","什麼是風險量化？","回到地圖"]}},Tj=[{keywords:["變數","let","const","var","variable"],topic:"變數"},{keywords:["函式","function","箭頭","arrow"],topic:"函式"},{keywords:["純函式","pure function","副作用"],topic:"純函式"},{keywords:["scope","作用域","閉包"],topic:"scope"},{keywords:["sql","select","where","join","group by","資料庫","查詢"],topic:"sql"},{keywords:["async","await","promise","非同步","異步"],topic:"async"},{keywords:["eventbus","event bus","事件","pub/sub","發布訂閱"],topic:"eventbus"},{keywords:["semaphore","信號量","並發","限流"],topic:"semaphore"},{keywords:["circuit breaker","熔斷","斷路"],topic:"circuit breaker"},{keywords:["react loop","react 迴圈","reasoning","agent 思考"],topic:"react迴圈"},{keywords:["bom","物料","展開","零件"],topic:"bom"},{keywords:["安全庫存","safety stock","服務水準"],topic:"安全庫存"}];function Pj(e){const t=e.toLowerCase();for(const n of Tj)for(const r of n.keywords)if(t.includes(r))return n.topic;return null}function Aj(e,t,n,r){var u;const i=Object.values(e).filter(c=>c.completed).length,s=Object.values(t).filter(c=>c.completed).length,o=ln.reduce((c,d)=>c+d.quests.length,0);if(i===0)return{content:`你還沒完成任何關卡！建議從「World 1: JavaScript 基礎」開始。先閱讀講義，再去挑戰！

第一關非常簡單 — 就是宣告一些變數。你可以的！💪`,suggestions:["帶我去 World 1","什麼是變數？","有什麼建議？"]};let a=null;for(const c of ln)if(!c.quests.every(h=>{var f;return(f=e[h.id])==null?void 0:f.completed})){a=c;break}const l=a?((u=a.quests.find(c=>{var d;return!((d=e[c.id])!=null&&d.completed)}))==null?void 0:u.name)||"全部完成":"全部通關！";return{content:`你的冒險進度：

• 等級：Lv.${r.level} ${r.title}
• XP：${n}
• 完成關卡：${i}/${o}
• 完成挑戰：${s} 個

目前在：${a?`${a.emoji} ${a.name}`:"全部通關！🎉"}
下一個挑戰：${l}`,suggestions:a?[`帶我去 ${a.name}`,"有什麼建議？","回到地圖"]:["我好厲害！","回到地圖"]}}function Rj(e){let t=0;for(let i=0;i<ln.length;i++)if(!ln[i].quests.every(o=>{var a;return(a=e[o.id])==null?void 0:a.completed})){t=i;break}const n=ln[t],r={1:"建議先花 10 分鐘讀完 World 1 的講義，了解變數、函式、條件式這些基礎。挑戰中的程式碼都是從真實的 DI 專案來的，不是虛構的範例！",2:"World 2 的重點是「純函式」和「驗證」。記住：好的函式只做一件事，而且相同輸入永遠給相同輸出。BOM 遞迴 Boss 有點難 — 先搞懂基本遞迴再去挑戰。",3:"SQL 的關鍵是理解「聲明式」思維 — 你告訴資料庫你「要什麼」，而不是「怎麼做」。先掌握 SELECT + WHERE，再學 JOIN 和 GROUP BY。",4:"React 的核心就是：資料 → UI。把資料的變化想成「狀態機」，UI 只是狀態的映射。Context、useEffect 都是圍繞這個概念設計的。",5:"Agent 模式的世界！async/await 是基礎中的基礎，EventBus 讓模組解耦，Semaphore 控制並發，Circuit Breaker 保護系統。一步步來！",6:"最後一個世界！這裡不只是寫程式，更要理解商業邏輯。安全庫存公式、風險量化、What-If 分析 — 都是業界每天在用的東西。"};return{content:`你現在在 ${n.emoji} ${n.name}。

${r[n.id]}`,suggestions:[`${n.name} 的講義在哪？`,"我卡在哪？","回到地圖"]}}function Oj(){const{questStatus:e,challengeStatus:t,totalXp:n,levelInfo:r}=Ki(),[i,s]=C.useState([{id:1,role:"assistant",content:`嗨！我是小迪 🤖，你的程式學習夥伴。

我可以：
• 解釋程式概念（變數、函式、SQL、async...）
• 查看你的學習進度
• 給你學習建議

有什麼想問的？`,suggestions:["我的進度如何？","有什麼建議？","什麼是純函式？"]}]),[o,a]=C.useState(""),[l,u]=C.useState(!1),c=C.useRef(null),d=()=>{var w;(w=c.current)==null||w.scrollIntoView({behavior:"smooth"})};C.useEffect(()=>{d()},[i]);const h=w=>{const m=w.toLowerCase();if(m.includes("進度")||m.includes("等級")||m.includes("xp")||m.includes("做到哪"))return Aj(e,t,n,r);if(m.includes("建議")||m.includes("怎麼學")||m.includes("下一步")||m.includes("卡在"))return Rj(e);if(m.includes("回到地圖")||m.includes("帶我去"))return{content:"好的！點擊下方按鈕前往地圖，選擇你想去的世界。",suggestions:["我的進度如何？","有什麼建議？"],showMapLink:!0};if(m.includes("講義")||m.includes("教材")||m.includes("在哪"))return{content:`每個世界都有自己的講義！進入方式：

1. 在地圖中展開任一世界
2. 點擊最上方的「📖 閱讀講義」
3. 或在關卡詳情頁點「開始閱讀」

建議流程：**先讀講義 → 再做挑戰** 效果最好！`,suggestions:["帶我去地圖","有什麼建議？","我的進度如何？"]};if(m.includes("卡關")||m.includes("不會")||m.includes("好難")||m.includes("提示")||m.includes("hint"))return{content:`卡關很正常！這裡有幾個建議：

1. **回去看講義** — 每個世界都有詳細教材
2. **用提示系統** — 挑戰頁面右上角有「💡 提示」按鈕（最多 3 級提示）
3. **看參考程式碼** — Boss 關卡會提供真實專案的程式碼供參考
4. **問我概念** — 直接問我你不懂的概念

別忘了：每個挑戰的程式碼都是從真實的 DI 專案來的，學會了就是實戰能力！`,suggestions:["解釋什麼是純函式","解釋什麼是 BOM","我的進度如何？"]};const g=Pj(w);return g&&ny[g]?ny[g]:m.match(/^(嗨|你好|hi|hello|hey|哈囉)/)?{content:`嗨！我是小迪，你目前是 Lv.${r.level} ${r.title}，共 ${n} XP。有什麼我可以幫忙的嗎？`,suggestions:["我的進度如何？","有什麼建議？","解釋什麼是 async"]}:m.includes("厲害")||m.includes("太強")||m.includes("awesome")?{content:`你確實很厲害！已經拿到 ${n} XP 了！繼續加油，距離下一級還有 ${r.xpForNext-r.currentXp} XP。

每一關都是真實的企業級程式碼，能通過這些挑戰絕對不簡單。`,suggestions:["下一步做什麼？","回到地圖"]}:null},f=async w=>{const m=w||o;if(!m.trim())return;const g={id:i.length+1,role:"user",content:m};s(y=>[...y,g]),a(""),u(!0);try{const y=h(m);if(y)await new Promise(k=>setTimeout(k,500)),s(k=>[...k,{id:k.length+1,role:"assistant",content:y.content,suggestions:y.suggestions,showMapLink:y.showMapLink}]);else{const k=[{role:"system",content:`你是「小迪」，一個友善的程式學習夥伴（DI Quest 學習平台的 NPC）。
你的任務是用繁體中文幫助使用者學習程式設計，特別是 JavaScript、SQL、React、async 模式、以及供應鏈相關的程式邏輯。
回答要簡潔、有趣、鼓勵性質。如果問題涉及程式碼，用簡單的範例說明。
使用者目前等級：Lv.${r.level} ${r.title}，共 ${n} XP。
請保持回答在 300 字以內。`},...i.slice(-6).map(S=>({role:S.role==="assistant"?"assistant":"user",content:S.content})),{role:"user",content:m}],T=await Ej(k);s(S=>[...S,{id:S.length+1,role:"assistant",content:T,suggestions:["我的進度如何？","有什麼建議？","回到地圖"]}])}}catch(y){console.error("DeepSeek API error:",y),s(k=>[...k,{id:k.length+1,role:"assistant",content:`抱歉，我暫時無法連接 AI 服務 😅

你可以試試問我特定的程式概念（如：什麼是純函式？什麼是 async？），或查看你的學習進度！`,suggestions:["什麼是純函式？","我的進度如何？","有什麼建議？"]}])}finally{u(!1)}},p=w=>{f(w)},v=[{icon:jr,label:"解釋概念",action:()=>f("解釋什麼是純函式")},{icon:PC,label:"我卡關了",action:()=>f("我卡關了怎麼辦")},{icon:Sx,label:"學習建議",action:()=>f("有什麼建議？")},{icon:gd,label:"查看進度",action:()=>f("我的進度如何？")}];return x.jsxs("div",{className:"h-[calc(100vh-73px)] flex flex-col max-w-4xl mx-auto",children:[x.jsxs("div",{className:"flex-1 overflow-y-auto p-6 space-y-4",children:[x.jsx(s2,{children:i.map(w=>x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},exit:{opacity:0,y:-20},className:`flex gap-4 ${w.role==="user"?"flex-row-reverse":""}`,children:[x.jsx("div",{className:`w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0 ${w.role==="user"?"bg-brand-primary/20":"bg-brand-accent/20"}`,children:w.role==="user"?x.jsx(FC,{className:"w-5 h-5 text-brand-primary"}):x.jsx(gm,{className:"w-5 h-5 text-brand-accent"})}),x.jsxs("div",{className:`max-w-[80%] ${w.role==="user"?"text-right":""}`,children:[x.jsx("div",{className:`inline-block px-4 py-3 rounded-2xl ${w.role==="user"?"bg-brand-primary text-white":"bg-slate-800 text-slate-200"}`,children:x.jsx("p",{className:"text-left whitespace-pre-wrap text-sm leading-relaxed",children:w.content})}),w.showMapLink&&x.jsx("div",{className:"mt-2",children:x.jsxs(Fe,{to:"/di-quest/map",className:"inline-flex items-center gap-2 px-4 py-2 bg-brand-primary text-white rounded-lg text-sm hover:bg-blue-600 transition-colors",children:[x.jsx(gd,{className:"w-4 h-4"}),"前往關卡地圖"]})}),w.suggestions&&w.suggestions.length>0&&x.jsx("div",{className:"flex flex-wrap gap-2 mt-3",children:w.suggestions.map((m,g)=>x.jsx("button",{onClick:()=>p(m),className:"px-3 py-1.5 bg-slate-800 hover:bg-slate-700 text-slate-300 text-sm rounded-full transition-colors border border-slate-700",children:m},g))})]})]},w.id))}),l&&x.jsxs(We.div,{initial:{opacity:0,y:20},animate:{opacity:1,y:0},className:"flex gap-4",children:[x.jsx("div",{className:"w-10 h-10 rounded-full bg-brand-accent/20 flex items-center justify-center",children:x.jsx(gm,{className:"w-5 h-5 text-brand-accent"})}),x.jsxs("div",{className:"bg-slate-800 px-4 py-3 rounded-2xl flex items-center gap-2",children:[x.jsx("span",{className:"text-slate-400",children:"小迪正在思考"}),x.jsxs("div",{className:"flex gap-1",children:[x.jsx(We.span,{animate:{opacity:[0,1,0]},transition:{duration:1,repeat:1/0,delay:0},className:"w-1.5 h-1.5 bg-brand-accent rounded-full"}),x.jsx(We.span,{animate:{opacity:[0,1,0]},transition:{duration:1,repeat:1/0,delay:.2},className:"w-1.5 h-1.5 bg-brand-accent rounded-full"}),x.jsx(We.span,{animate:{opacity:[0,1,0]},transition:{duration:1,repeat:1/0,delay:.4},className:"w-1.5 h-1.5 bg-brand-accent rounded-full"})]})]})]}),x.jsx("div",{ref:c})]}),x.jsx("div",{className:"px-6 py-3 border-t border-slate-800",children:x.jsx("div",{className:"flex gap-2 overflow-x-auto pb-2",children:v.map((w,m)=>x.jsxs("button",{onClick:w.action,className:"flex items-center gap-2 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-full text-sm transition-colors whitespace-nowrap",children:[x.jsx(w.icon,{className:"w-4 h-4"}),w.label]},m))})}),x.jsxs("div",{className:"p-6 pt-0",children:[x.jsxs("div",{className:"flex gap-3",children:[x.jsxs("div",{className:"flex-1 relative",children:[x.jsx("input",{type:"text",value:o,onChange:w=>a(w.target.value),onKeyDown:w=>w.key==="Enter"&&f(),placeholder:"問小迪任何問題⋯（例如：什麼是純函式？）",className:"w-full px-4 py-3 bg-slate-800 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:border-brand-primary transition-colors"}),x.jsx(IC,{className:"absolute right-4 top-1/2 -translate-y-1/2 w-5 h-5 text-brand-accent"})]}),x.jsxs("button",{onClick:()=>f(),disabled:!o.trim()||l,className:"px-6 py-3 bg-brand-primary text-white rounded-xl hover:bg-blue-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2",children:[x.jsx(_x,{className:"w-4 h-4"}),"發送"]})]}),x.jsx("p",{className:"text-xs text-slate-500 mt-2 text-center",children:"小迪可以解釋程式概念、查看進度、給學習建議"})]})]})}function Nj(e,t){const n={};return(e[e.length-1]===""?[...e,""]:e).join((n.padRight?" ":"")+","+(n.padLeft===!1?"":" ")).trim()}const jj=/^[$_\p{ID_Start}][$_\u{200C}\u{200D}\p{ID_Continue}]*$/u,Ij=/^[$_\p{ID_Start}][-$_\u{200C}\u{200D}\p{ID_Continue}]*$/u,Dj={};function ry(e,t){return(Dj.jsx?Ij:jj).test(e)}const Lj=/[ \t\n\f\r]/g;function Mj(e){return typeof e=="object"?e.type==="text"?iy(e.value):!1:iy(e)}function iy(e){return e.replace(Lj,"")===""}class jo{constructor(t,n,r){this.normal=n,this.property=t,r&&(this.space=r)}}jo.prototype.normal={};jo.prototype.property={};jo.prototype.space=void 0;function k1(e,t){const n={},r={};for(const i of e)Object.assign(n,i.property),Object.assign(r,i.normal);return new jo(n,r,t)}function zd(e){return e.toLowerCase()}class dt{constructor(t,n){this.attribute=n,this.property=t}}dt.prototype.attribute="";dt.prototype.booleanish=!1;dt.prototype.boolean=!1;dt.prototype.commaOrSpaceSeparated=!1;dt.prototype.commaSeparated=!1;dt.prototype.defined=!1;dt.prototype.mustUseProperty=!1;dt.prototype.number=!1;dt.prototype.overloadedBoolean=!1;dt.prototype.property="";dt.prototype.spaceSeparated=!1;dt.prototype.space=void 0;let Bj=0;const Z=Hr(),Ae=Hr(),qd=Hr(),D=Hr(),fe=Hr(),Oi=Hr(),pt=Hr();function Hr(){return 2**++Bj}const Hd=Object.freeze(Object.defineProperty({__proto__:null,boolean:Z,booleanish:Ae,commaOrSpaceSeparated:pt,commaSeparated:Oi,number:D,overloadedBoolean:qd,spaceSeparated:fe},Symbol.toStringTag,{value:"Module"})),rc=Object.keys(Hd);class Pf extends dt{constructor(t,n,r,i){let s=-1;if(super(t,n),sy(this,"space",i),typeof r=="number")for(;++s<rc.length;){const o=rc[s];sy(this,rc[s],(r&Hd[o])===Hd[o])}}}Pf.prototype.defined=!0;function sy(e,t,n){n&&(e[t]=n)}function Qi(e){const t={},n={};for(const[r,i]of Object.entries(e.properties)){const s=new Pf(r,e.transform(e.attributes||{},r),i,e.space);e.mustUseProperty&&e.mustUseProperty.includes(r)&&(s.mustUseProperty=!0),t[r]=s,n[zd(r)]=r,n[zd(s.attribute)]=r}return new jo(t,n,e.space)}const b1=Qi({properties:{ariaActiveDescendant:null,ariaAtomic:Ae,ariaAutoComplete:null,ariaBusy:Ae,ariaChecked:Ae,ariaColCount:D,ariaColIndex:D,ariaColSpan:D,ariaControls:fe,ariaCurrent:null,ariaDescribedBy:fe,ariaDetails:null,ariaDisabled:Ae,ariaDropEffect:fe,ariaErrorMessage:null,ariaExpanded:Ae,ariaFlowTo:fe,ariaGrabbed:Ae,ariaHasPopup:null,ariaHidden:Ae,ariaInvalid:null,ariaKeyShortcuts:null,ariaLabel:null,ariaLabelledBy:fe,ariaLevel:D,ariaLive:null,ariaModal:Ae,ariaMultiLine:Ae,ariaMultiSelectable:Ae,ariaOrientation:null,ariaOwns:fe,ariaPlaceholder:null,ariaPosInSet:D,ariaPressed:Ae,ariaReadOnly:Ae,ariaRelevant:null,ariaRequired:Ae,ariaRoleDescription:fe,ariaRowCount:D,ariaRowIndex:D,ariaRowSpan:D,ariaSelected:Ae,ariaSetSize:D,ariaSort:null,ariaValueMax:D,ariaValueMin:D,ariaValueNow:D,ariaValueText:null,role:null},transform(e,t){return t==="role"?t:"aria-"+t.slice(4).toLowerCase()}});function S1(e,t){return t in e?e[t]:t}function _1(e,t){return S1(e,t.toLowerCase())}const Fj=Qi({attributes:{acceptcharset:"accept-charset",classname:"class",htmlfor:"for",httpequiv:"http-equiv"},mustUseProperty:["checked","multiple","muted","selected"],properties:{abbr:null,accept:Oi,acceptCharset:fe,accessKey:fe,action:null,allow:null,allowFullScreen:Z,allowPaymentRequest:Z,allowUserMedia:Z,alt:null,as:null,async:Z,autoCapitalize:null,autoComplete:fe,autoFocus:Z,autoPlay:Z,blocking:fe,capture:null,charSet:null,checked:Z,cite:null,className:fe,cols:D,colSpan:null,content:null,contentEditable:Ae,controls:Z,controlsList:fe,coords:D|Oi,crossOrigin:null,data:null,dateTime:null,decoding:null,default:Z,defer:Z,dir:null,dirName:null,disabled:Z,download:qd,draggable:Ae,encType:null,enterKeyHint:null,fetchPriority:null,form:null,formAction:null,formEncType:null,formMethod:null,formNoValidate:Z,formTarget:null,headers:fe,height:D,hidden:qd,high:D,href:null,hrefLang:null,htmlFor:fe,httpEquiv:fe,id:null,imageSizes:null,imageSrcSet:null,inert:Z,inputMode:null,integrity:null,is:null,isMap:Z,itemId:null,itemProp:fe,itemRef:fe,itemScope:Z,itemType:fe,kind:null,label:null,lang:null,language:null,list:null,loading:null,loop:Z,low:D,manifest:null,max:null,maxLength:D,media:null,method:null,min:null,minLength:D,multiple:Z,muted:Z,name:null,nonce:null,noModule:Z,noValidate:Z,onAbort:null,onAfterPrint:null,onAuxClick:null,onBeforeMatch:null,onBeforePrint:null,onBeforeToggle:null,onBeforeUnload:null,onBlur:null,onCancel:null,onCanPlay:null,onCanPlayThrough:null,onChange:null,onClick:null,onClose:null,onContextLost:null,onContextMenu:null,onContextRestored:null,onCopy:null,onCueChange:null,onCut:null,onDblClick:null,onDrag:null,onDragEnd:null,onDragEnter:null,onDragExit:null,onDragLeave:null,onDragOver:null,onDragStart:null,onDrop:null,onDurationChange:null,onEmptied:null,onEnded:null,onError:null,onFocus:null,onFormData:null,onHashChange:null,onInput:null,onInvalid:null,onKeyDown:null,onKeyPress:null,onKeyUp:null,onLanguageChange:null,onLoad:null,onLoadedData:null,onLoadedMetadata:null,onLoadEnd:null,onLoadStart:null,onMessage:null,onMessageError:null,onMouseDown:null,onMouseEnter:null,onMouseLeave:null,onMouseMove:null,onMouseOut:null,onMouseOver:null,onMouseUp:null,onOffline:null,onOnline:null,onPageHide:null,onPageShow:null,onPaste:null,onPause:null,onPlay:null,onPlaying:null,onPopState:null,onProgress:null,onRateChange:null,onRejectionHandled:null,onReset:null,onResize:null,onScroll:null,onScrollEnd:null,onSecurityPolicyViolation:null,onSeeked:null,onSeeking:null,onSelect:null,onSlotChange:null,onStalled:null,onStorage:null,onSubmit:null,onSuspend:null,onTimeUpdate:null,onToggle:null,onUnhandledRejection:null,onUnload:null,onVolumeChange:null,onWaiting:null,onWheel:null,open:Z,optimum:D,pattern:null,ping:fe,placeholder:null,playsInline:Z,popover:null,popoverTarget:null,popoverTargetAction:null,poster:null,preload:null,readOnly:Z,referrerPolicy:null,rel:fe,required:Z,reversed:Z,rows:D,rowSpan:D,sandbox:fe,scope:null,scoped:Z,seamless:Z,selected:Z,shadowRootClonable:Z,shadowRootDelegatesFocus:Z,shadowRootMode:null,shape:null,size:D,sizes:null,slot:null,span:D,spellCheck:Ae,src:null,srcDoc:null,srcLang:null,srcSet:null,start:D,step:null,style:null,tabIndex:D,target:null,title:null,translate:null,type:null,typeMustMatch:Z,useMap:null,value:Ae,width:D,wrap:null,writingSuggestions:null,align:null,aLink:null,archive:fe,axis:null,background:null,bgColor:null,border:D,borderColor:null,bottomMargin:D,cellPadding:null,cellSpacing:null,char:null,charOff:null,classId:null,clear:null,code:null,codeBase:null,codeType:null,color:null,compact:Z,declare:Z,event:null,face:null,frame:null,frameBorder:null,hSpace:D,leftMargin:D,link:null,longDesc:null,lowSrc:null,marginHeight:D,marginWidth:D,noResize:Z,noHref:Z,noShade:Z,noWrap:Z,object:null,profile:null,prompt:null,rev:null,rightMargin:D,rules:null,scheme:null,scrolling:Ae,standby:null,summary:null,text:null,topMargin:D,valueType:null,version:null,vAlign:null,vLink:null,vSpace:D,allowTransparency:null,autoCorrect:null,autoSave:null,disablePictureInPicture:Z,disableRemotePlayback:Z,prefix:null,property:null,results:D,security:null,unselectable:null},space:"html",transform:_1}),$j=Qi({attributes:{accentHeight:"accent-height",alignmentBaseline:"alignment-baseline",arabicForm:"arabic-form",baselineShift:"baseline-shift",capHeight:"cap-height",className:"class",clipPath:"clip-path",clipRule:"clip-rule",colorInterpolation:"color-interpolation",colorInterpolationFilters:"color-interpolation-filters",colorProfile:"color-profile",colorRendering:"color-rendering",crossOrigin:"crossorigin",dataType:"datatype",dominantBaseline:"dominant-baseline",enableBackground:"enable-background",fillOpacity:"fill-opacity",fillRule:"fill-rule",floodColor:"flood-color",floodOpacity:"flood-opacity",fontFamily:"font-family",fontSize:"font-size",fontSizeAdjust:"font-size-adjust",fontStretch:"font-stretch",fontStyle:"font-style",fontVariant:"font-variant",fontWeight:"font-weight",glyphName:"glyph-name",glyphOrientationHorizontal:"glyph-orientation-horizontal",glyphOrientationVertical:"glyph-orientation-vertical",hrefLang:"hreflang",horizAdvX:"horiz-adv-x",horizOriginX:"horiz-origin-x",horizOriginY:"horiz-origin-y",imageRendering:"image-rendering",letterSpacing:"letter-spacing",lightingColor:"lighting-color",markerEnd:"marker-end",markerMid:"marker-mid",markerStart:"marker-start",navDown:"nav-down",navDownLeft:"nav-down-left",navDownRight:"nav-down-right",navLeft:"nav-left",navNext:"nav-next",navPrev:"nav-prev",navRight:"nav-right",navUp:"nav-up",navUpLeft:"nav-up-left",navUpRight:"nav-up-right",onAbort:"onabort",onActivate:"onactivate",onAfterPrint:"onafterprint",onBeforePrint:"onbeforeprint",onBegin:"onbegin",onCancel:"oncancel",onCanPlay:"oncanplay",onCanPlayThrough:"oncanplaythrough",onChange:"onchange",onClick:"onclick",onClose:"onclose",onCopy:"oncopy",onCueChange:"oncuechange",onCut:"oncut",onDblClick:"ondblclick",onDrag:"ondrag",onDragEnd:"ondragend",onDragEnter:"ondragenter",onDragExit:"ondragexit",onDragLeave:"ondragleave",onDragOver:"ondragover",onDragStart:"ondragstart",onDrop:"ondrop",onDurationChange:"ondurationchange",onEmptied:"onemptied",onEnd:"onend",onEnded:"onended",onError:"onerror",onFocus:"onfocus",onFocusIn:"onfocusin",onFocusOut:"onfocusout",onHashChange:"onhashchange",onInput:"oninput",onInvalid:"oninvalid",onKeyDown:"onkeydown",onKeyPress:"onkeypress",onKeyUp:"onkeyup",onLoad:"onload",onLoadedData:"onloadeddata",onLoadedMetadata:"onloadedmetadata",onLoadStart:"onloadstart",onMessage:"onmessage",onMouseDown:"onmousedown",onMouseEnter:"onmouseenter",onMouseLeave:"onmouseleave",onMouseMove:"onmousemove",onMouseOut:"onmouseout",onMouseOver:"onmouseover",onMouseUp:"onmouseup",onMouseWheel:"onmousewheel",onOffline:"onoffline",onOnline:"ononline",onPageHide:"onpagehide",onPageShow:"onpageshow",onPaste:"onpaste",onPause:"onpause",onPlay:"onplay",onPlaying:"onplaying",onPopState:"onpopstate",onProgress:"onprogress",onRateChange:"onratechange",onRepeat:"onrepeat",onReset:"onreset",onResize:"onresize",onScroll:"onscroll",onSeeked:"onseeked",onSeeking:"onseeking",onSelect:"onselect",onShow:"onshow",onStalled:"onstalled",onStorage:"onstorage",onSubmit:"onsubmit",onSuspend:"onsuspend",onTimeUpdate:"ontimeupdate",onToggle:"ontoggle",onUnload:"onunload",onVolumeChange:"onvolumechange",onWaiting:"onwaiting",onZoom:"onzoom",overlinePosition:"overline-position",overlineThickness:"overline-thickness",paintOrder:"paint-order",panose1:"panose-1",pointerEvents:"pointer-events",referrerPolicy:"referrerpolicy",renderingIntent:"rendering-intent",shapeRendering:"shape-rendering",stopColor:"stop-color",stopOpacity:"stop-opacity",strikethroughPosition:"strikethrough-position",strikethroughThickness:"strikethrough-thickness",strokeDashArray:"stroke-dasharray",strokeDashOffset:"stroke-dashoffset",strokeLineCap:"stroke-linecap",strokeLineJoin:"stroke-linejoin",strokeMiterLimit:"stroke-miterlimit",strokeOpacity:"stroke-opacity",strokeWidth:"stroke-width",tabIndex:"tabindex",textAnchor:"text-anchor",textDecoration:"text-decoration",textRendering:"text-rendering",transformOrigin:"transform-origin",typeOf:"typeof",underlinePosition:"underline-position",underlineThickness:"underline-thickness",unicodeBidi:"unicode-bidi",unicodeRange:"unicode-range",unitsPerEm:"units-per-em",vAlphabetic:"v-alphabetic",vHanging:"v-hanging",vIdeographic:"v-ideographic",vMathematical:"v-mathematical",vectorEffect:"vector-effect",vertAdvY:"vert-adv-y",vertOriginX:"vert-origin-x",vertOriginY:"vert-origin-y",wordSpacing:"word-spacing",writingMode:"writing-mode",xHeight:"x-height",playbackOrder:"playbackorder",timelineBegin:"timelinebegin"},properties:{about:pt,accentHeight:D,accumulate:null,additive:null,alignmentBaseline:null,alphabetic:D,amplitude:D,arabicForm:null,ascent:D,attributeName:null,attributeType:null,azimuth:D,bandwidth:null,baselineShift:null,baseFrequency:null,baseProfile:null,bbox:null,begin:null,bias:D,by:null,calcMode:null,capHeight:D,className:fe,clip:null,clipPath:null,clipPathUnits:null,clipRule:null,color:null,colorInterpolation:null,colorInterpolationFilters:null,colorProfile:null,colorRendering:null,content:null,contentScriptType:null,contentStyleType:null,crossOrigin:null,cursor:null,cx:null,cy:null,d:null,dataType:null,defaultAction:null,descent:D,diffuseConstant:D,direction:null,display:null,dur:null,divisor:D,dominantBaseline:null,download:Z,dx:null,dy:null,edgeMode:null,editable:null,elevation:D,enableBackground:null,end:null,event:null,exponent:D,externalResourcesRequired:null,fill:null,fillOpacity:D,fillRule:null,filter:null,filterRes:null,filterUnits:null,floodColor:null,floodOpacity:null,focusable:null,focusHighlight:null,fontFamily:null,fontSize:null,fontSizeAdjust:null,fontStretch:null,fontStyle:null,fontVariant:null,fontWeight:null,format:null,fr:null,from:null,fx:null,fy:null,g1:Oi,g2:Oi,glyphName:Oi,glyphOrientationHorizontal:null,glyphOrientationVertical:null,glyphRef:null,gradientTransform:null,gradientUnits:null,handler:null,hanging:D,hatchContentUnits:null,hatchUnits:null,height:null,href:null,hrefLang:null,horizAdvX:D,horizOriginX:D,horizOriginY:D,id:null,ideographic:D,imageRendering:null,initialVisibility:null,in:null,in2:null,intercept:D,k:D,k1:D,k2:D,k3:D,k4:D,kernelMatrix:pt,kernelUnitLength:null,keyPoints:null,keySplines:null,keyTimes:null,kerning:null,lang:null,lengthAdjust:null,letterSpacing:null,lightingColor:null,limitingConeAngle:D,local:null,markerEnd:null,markerMid:null,markerStart:null,markerHeight:null,markerUnits:null,markerWidth:null,mask:null,maskContentUnits:null,maskUnits:null,mathematical:null,max:null,media:null,mediaCharacterEncoding:null,mediaContentEncodings:null,mediaSize:D,mediaTime:null,method:null,min:null,mode:null,name:null,navDown:null,navDownLeft:null,navDownRight:null,navLeft:null,navNext:null,navPrev:null,navRight:null,navUp:null,navUpLeft:null,navUpRight:null,numOctaves:null,observer:null,offset:null,onAbort:null,onActivate:null,onAfterPrint:null,onBeforePrint:null,onBegin:null,onCancel:null,onCanPlay:null,onCanPlayThrough:null,onChange:null,onClick:null,onClose:null,onCopy:null,onCueChange:null,onCut:null,onDblClick:null,onDrag:null,onDragEnd:null,onDragEnter:null,onDragExit:null,onDragLeave:null,onDragOver:null,onDragStart:null,onDrop:null,onDurationChange:null,onEmptied:null,onEnd:null,onEnded:null,onError:null,onFocus:null,onFocusIn:null,onFocusOut:null,onHashChange:null,onInput:null,onInvalid:null,onKeyDown:null,onKeyPress:null,onKeyUp:null,onLoad:null,onLoadedData:null,onLoadedMetadata:null,onLoadStart:null,onMessage:null,onMouseDown:null,onMouseEnter:null,onMouseLeave:null,onMouseMove:null,onMouseOut:null,onMouseOver:null,onMouseUp:null,onMouseWheel:null,onOffline:null,onOnline:null,onPageHide:null,onPageShow:null,onPaste:null,onPause:null,onPlay:null,onPlaying:null,onPopState:null,onProgress:null,onRateChange:null,onRepeat:null,onReset:null,onResize:null,onScroll:null,onSeeked:null,onSeeking:null,onSelect:null,onShow:null,onStalled:null,onStorage:null,onSubmit:null,onSuspend:null,onTimeUpdate:null,onToggle:null,onUnload:null,onVolumeChange:null,onWaiting:null,onZoom:null,opacity:null,operator:null,order:null,orient:null,orientation:null,origin:null,overflow:null,overlay:null,overlinePosition:D,overlineThickness:D,paintOrder:null,panose1:null,path:null,pathLength:D,patternContentUnits:null,patternTransform:null,patternUnits:null,phase:null,ping:fe,pitch:null,playbackOrder:null,pointerEvents:null,points:null,pointsAtX:D,pointsAtY:D,pointsAtZ:D,preserveAlpha:null,preserveAspectRatio:null,primitiveUnits:null,propagate:null,property:pt,r:null,radius:null,referrerPolicy:null,refX:null,refY:null,rel:pt,rev:pt,renderingIntent:null,repeatCount:null,repeatDur:null,requiredExtensions:pt,requiredFeatures:pt,requiredFonts:pt,requiredFormats:pt,resource:null,restart:null,result:null,rotate:null,rx:null,ry:null,scale:null,seed:null,shapeRendering:null,side:null,slope:null,snapshotTime:null,specularConstant:D,specularExponent:D,spreadMethod:null,spacing:null,startOffset:null,stdDeviation:null,stemh:null,stemv:null,stitchTiles:null,stopColor:null,stopOpacity:null,strikethroughPosition:D,strikethroughThickness:D,string:null,stroke:null,strokeDashArray:pt,strokeDashOffset:null,strokeLineCap:null,strokeLineJoin:null,strokeMiterLimit:D,strokeOpacity:D,strokeWidth:null,style:null,surfaceScale:D,syncBehavior:null,syncBehaviorDefault:null,syncMaster:null,syncTolerance:null,syncToleranceDefault:null,systemLanguage:pt,tabIndex:D,tableValues:null,target:null,targetX:D,targetY:D,textAnchor:null,textDecoration:null,textRendering:null,textLength:null,timelineBegin:null,title:null,transformBehavior:null,type:null,typeOf:pt,to:null,transform:null,transformOrigin:null,u1:null,u2:null,underlinePosition:D,underlineThickness:D,unicode:null,unicodeBidi:null,unicodeRange:null,unitsPerEm:D,values:null,vAlphabetic:D,vMathematical:D,vectorEffect:null,vHanging:D,vIdeographic:D,version:null,vertAdvY:D,vertOriginX:D,vertOriginY:D,viewBox:null,viewTarget:null,visibility:null,width:null,widths:null,wordSpacing:null,writingMode:null,x:null,x1:null,x2:null,xChannelSelector:null,xHeight:D,y:null,y1:null,y2:null,yChannelSelector:null,z:null,zoomAndPan:null},space:"svg",transform:S1}),C1=Qi({properties:{xLinkActuate:null,xLinkArcRole:null,xLinkHref:null,xLinkRole:null,xLinkShow:null,xLinkTitle:null,xLinkType:null},space:"xlink",transform(e,t){return"xlink:"+t.slice(5).toLowerCase()}}),E1=Qi({attributes:{xmlnsxlink:"xmlns:xlink"},properties:{xmlnsXLink:null,xmlns:null},space:"xmlns",transform:_1}),T1=Qi({properties:{xmlBase:null,xmlLang:null,xmlSpace:null},space:"xml",transform(e,t){return"xml:"+t.slice(3).toLowerCase()}}),Uj={classId:"classID",dataType:"datatype",itemId:"itemID",strokeDashArray:"strokeDasharray",strokeDashOffset:"strokeDashoffset",strokeLineCap:"strokeLinecap",strokeLineJoin:"strokeLinejoin",strokeMiterLimit:"strokeMiterlimit",typeOf:"typeof",xLinkActuate:"xlinkActuate",xLinkArcRole:"xlinkArcrole",xLinkHref:"xlinkHref",xLinkRole:"xlinkRole",xLinkShow:"xlinkShow",xLinkTitle:"xlinkTitle",xLinkType:"xlinkType",xmlnsXLink:"xmlnsXlink"},Vj=/[A-Z]/g,oy=/-[a-z]/g,zj=/^data[-\w.:]+$/i;function qj(e,t){const n=zd(t);let r=t,i=dt;if(n in e.normal)return e.property[e.normal[n]];if(n.length>4&&n.slice(0,4)==="data"&&zj.test(t)){if(t.charAt(4)==="-"){const s=t.slice(5).replace(oy,Wj);r="data"+s.charAt(0).toUpperCase()+s.slice(1)}else{const s=t.slice(4);if(!oy.test(s)){let o=s.replace(Vj,Hj);o.charAt(0)!=="-"&&(o="-"+o),t="data"+o}}i=Pf}return new i(r,t)}function Hj(e){return"-"+e.toLowerCase()}function Wj(e){return e.charAt(1).toUpperCase()}const Gj=k1([b1,Fj,C1,E1,T1],"html"),Af=k1([b1,$j,C1,E1,T1],"svg");function Kj(e){return e.join(" ").trim()}var Rf={},ay=/\/\*[^*]*\*+([^/*][^*]*\*+)*\//g,Jj=/\n/g,Qj=/^\s*/,Xj=/^(\*?[-#/*\\\w]+(\[[0-9a-z_-]+\])?)\s*/,Yj=/^:\s*/,Zj=/^((?:'(?:\\'|.)*?'|"(?:\\"|.)*?"|\([^)]*?\)|[^};])+)/,eI=/^[;\s]*/,tI=/^\s+|\s+$/g,nI=`
`,ly="/",uy="*",Cr="",rI="comment",iI="declaration";function sI(e,t){if(typeof e!="string")throw new TypeError("First argument must be a string");if(!e)return[];t=t||{};var n=1,r=1;function i(p){var v=p.match(Jj);v&&(n+=v.length);var w=p.lastIndexOf(nI);r=~w?p.length-w:r+p.length}function s(){var p={line:n,column:r};return function(v){return v.position=new o(p),u(),v}}function o(p){this.start=p,this.end={line:n,column:r},this.source=t.source}o.prototype.content=e;function a(p){var v=new Error(t.source+":"+n+":"+r+": "+p);if(v.reason=p,v.filename=t.source,v.line=n,v.column=r,v.source=e,!t.silent)throw v}function l(p){var v=p.exec(e);if(v){var w=v[0];return i(w),e=e.slice(w.length),v}}function u(){l(Qj)}function c(p){var v;for(p=p||[];v=d();)v!==!1&&p.push(v);return p}function d(){var p=s();if(!(ly!=e.charAt(0)||uy!=e.charAt(1))){for(var v=2;Cr!=e.charAt(v)&&(uy!=e.charAt(v)||ly!=e.charAt(v+1));)++v;if(v+=2,Cr===e.charAt(v-1))return a("End of comment missing");var w=e.slice(2,v-2);return r+=2,i(w),e=e.slice(v),r+=2,p({type:rI,comment:w})}}function h(){var p=s(),v=l(Xj);if(v){if(d(),!l(Yj))return a("property missing ':'");var w=l(Zj),m=p({type:iI,property:cy(v[0].replace(ay,Cr)),value:w?cy(w[0].replace(ay,Cr)):Cr});return l(eI),m}}function f(){var p=[];c(p);for(var v;v=h();)v!==!1&&(p.push(v),c(p));return p}return u(),f()}function cy(e){return e?e.replace(tI,Cr):Cr}var oI=sI,aI=Ia&&Ia.__importDefault||function(e){return e&&e.__esModule?e:{default:e}};Object.defineProperty(Rf,"__esModule",{value:!0});Rf.default=uI;const lI=aI(oI);function uI(e,t){let n=null;if(!e||typeof e!="string")return n;const r=(0,lI.default)(e),i=typeof t=="function";return r.forEach(s=>{if(s.type!=="declaration")return;const{property:o,value:a}=s;i?t(o,a,s):a&&(n=n||{},n[o]=a)}),n}var ru={};Object.defineProperty(ru,"__esModule",{value:!0});ru.camelCase=void 0;var cI=/^--[a-zA-Z0-9_-]+$/,dI=/-([a-z])/g,hI=/^[^-]+$/,fI=/^-(webkit|moz|ms|o|khtml)-/,pI=/^-(ms)-/,mI=function(e){return!e||hI.test(e)||cI.test(e)},gI=function(e,t){return t.toUpperCase()},dy=function(e,t){return"".concat(t,"-")},yI=function(e,t){return t===void 0&&(t={}),mI(e)?e:(e=e.toLowerCase(),t.reactCompat?e=e.replace(pI,dy):e=e.replace(fI,dy),e.replace(dI,gI))};ru.camelCase=yI;var vI=Ia&&Ia.__importDefault||function(e){return e&&e.__esModule?e:{default:e}},xI=vI(Rf),wI=ru;function Wd(e,t){var n={};return!e||typeof e!="string"||(0,xI.default)(e,function(r,i){r&&i&&(n[(0,wI.camelCase)(r,t)]=i)}),n}Wd.default=Wd;var kI=Wd;const bI=th(kI),P1=A1("end"),Of=A1("start");function A1(e){return t;function t(n){const r=n&&n.position&&n.position[e]||{};if(typeof r.line=="number"&&r.line>0&&typeof r.column=="number"&&r.column>0)return{line:r.line,column:r.column,offset:typeof r.offset=="number"&&r.offset>-1?r.offset:void 0}}}function SI(e){const t=Of(e),n=P1(e);if(t&&n)return{start:t,end:n}}function $s(e){return!e||typeof e!="object"?"":"position"in e||"type"in e?hy(e.position):"start"in e||"end"in e?hy(e):"line"in e||"column"in e?Gd(e):""}function Gd(e){return fy(e&&e.line)+":"+fy(e&&e.column)}function hy(e){return Gd(e&&e.start)+"-"+Gd(e&&e.end)}function fy(e){return e&&typeof e=="number"?e:1}class Je extends Error{constructor(t,n,r){super(),typeof n=="string"&&(r=n,n=void 0);let i="",s={},o=!1;if(n&&("line"in n&&"column"in n?s={place:n}:"start"in n&&"end"in n?s={place:n}:"type"in n?s={ancestors:[n],place:n.position}:s={...n}),typeof t=="string"?i=t:!s.cause&&t&&(o=!0,i=t.message,s.cause=t),!s.ruleId&&!s.source&&typeof r=="string"){const l=r.indexOf(":");l===-1?s.ruleId=r:(s.source=r.slice(0,l),s.ruleId=r.slice(l+1))}if(!s.place&&s.ancestors&&s.ancestors){const l=s.ancestors[s.ancestors.length-1];l&&(s.place=l.position)}const a=s.place&&"start"in s.place?s.place.start:s.place;this.ancestors=s.ancestors||void 0,this.cause=s.cause||void 0,this.column=a?a.column:void 0,this.fatal=void 0,this.file="",this.message=i,this.line=a?a.line:void 0,this.name=$s(s.place)||"1:1",this.place=s.place||void 0,this.reason=this.message,this.ruleId=s.ruleId||void 0,this.source=s.source||void 0,this.stack=o&&s.cause&&typeof s.cause.stack=="string"?s.cause.stack:"",this.actual=void 0,this.expected=void 0,this.note=void 0,this.url=void 0}}Je.prototype.file="";Je.prototype.name="";Je.prototype.reason="";Je.prototype.message="";Je.prototype.stack="";Je.prototype.column=void 0;Je.prototype.line=void 0;Je.prototype.ancestors=void 0;Je.prototype.cause=void 0;Je.prototype.fatal=void 0;Je.prototype.place=void 0;Je.prototype.ruleId=void 0;Je.prototype.source=void 0;const Nf={}.hasOwnProperty,_I=new Map,CI=/[A-Z]/g,EI=new Set(["table","tbody","thead","tfoot","tr"]),TI=new Set(["td","th"]),R1="https://github.com/syntax-tree/hast-util-to-jsx-runtime";function PI(e,t){if(!t||t.Fragment===void 0)throw new TypeError("Expected `Fragment` in options");const n=t.filePath||void 0;let r;if(t.development){if(typeof t.jsxDEV!="function")throw new TypeError("Expected `jsxDEV` in options when `development: true`");r=LI(n,t.jsxDEV)}else{if(typeof t.jsx!="function")throw new TypeError("Expected `jsx` in production options");if(typeof t.jsxs!="function")throw new TypeError("Expected `jsxs` in production options");r=DI(n,t.jsx,t.jsxs)}const i={Fragment:t.Fragment,ancestors:[],components:t.components||{},create:r,elementAttributeNameCase:t.elementAttributeNameCase||"react",evaluater:t.createEvaluater?t.createEvaluater():void 0,filePath:n,ignoreInvalidStyle:t.ignoreInvalidStyle||!1,passKeys:t.passKeys!==!1,passNode:t.passNode||!1,schema:t.space==="svg"?Af:Gj,stylePropertyNameCase:t.stylePropertyNameCase||"dom",tableCellAlignToStyle:t.tableCellAlignToStyle!==!1},s=O1(i,e,void 0);return s&&typeof s!="string"?s:i.create(e,i.Fragment,{children:s||void 0},void 0)}function O1(e,t,n){if(t.type==="element")return AI(e,t,n);if(t.type==="mdxFlowExpression"||t.type==="mdxTextExpression")return RI(e,t);if(t.type==="mdxJsxFlowElement"||t.type==="mdxJsxTextElement")return NI(e,t,n);if(t.type==="mdxjsEsm")return OI(e,t);if(t.type==="root")return jI(e,t,n);if(t.type==="text")return II(e,t)}function AI(e,t,n){const r=e.schema;let i=r;t.tagName.toLowerCase()==="svg"&&r.space==="html"&&(i=Af,e.schema=i),e.ancestors.push(t);const s=j1(e,t.tagName,!1),o=MI(e,t);let a=If(e,t);return EI.has(t.tagName)&&(a=a.filter(function(l){return typeof l=="string"?!Mj(l):!0})),N1(e,o,s,t),jf(o,a),e.ancestors.pop(),e.schema=r,e.create(t,s,o,n)}function RI(e,t){if(t.data&&t.data.estree&&e.evaluater){const r=t.data.estree.body[0];return r.type,e.evaluater.evaluateExpression(r.expression)}wo(e,t.position)}function OI(e,t){if(t.data&&t.data.estree&&e.evaluater)return e.evaluater.evaluateProgram(t.data.estree);wo(e,t.position)}function NI(e,t,n){const r=e.schema;let i=r;t.name==="svg"&&r.space==="html"&&(i=Af,e.schema=i),e.ancestors.push(t);const s=t.name===null?e.Fragment:j1(e,t.name,!0),o=BI(e,t),a=If(e,t);return N1(e,o,s,t),jf(o,a),e.ancestors.pop(),e.schema=r,e.create(t,s,o,n)}function jI(e,t,n){const r={};return jf(r,If(e,t)),e.create(t,e.Fragment,r,n)}function II(e,t){return t.value}function N1(e,t,n,r){typeof n!="string"&&n!==e.Fragment&&e.passNode&&(t.node=r)}function jf(e,t){if(t.length>0){const n=t.length>1?t:t[0];n&&(e.children=n)}}function DI(e,t,n){return r;function r(i,s,o,a){const u=Array.isArray(o.children)?n:t;return a?u(s,o,a):u(s,o)}}function LI(e,t){return n;function n(r,i,s,o){const a=Array.isArray(s.children),l=Of(r);return t(i,s,o,a,{columnNumber:l?l.column-1:void 0,fileName:e,lineNumber:l?l.line:void 0},void 0)}}function MI(e,t){const n={};let r,i;for(i in t.properties)if(i!=="children"&&Nf.call(t.properties,i)){const s=FI(e,i,t.properties[i]);if(s){const[o,a]=s;e.tableCellAlignToStyle&&o==="align"&&typeof a=="string"&&TI.has(t.tagName)?r=a:n[o]=a}}if(r){const s=n.style||(n.style={});s[e.stylePropertyNameCase==="css"?"text-align":"textAlign"]=r}return n}function BI(e,t){const n={};for(const r of t.attributes)if(r.type==="mdxJsxExpressionAttribute")if(r.data&&r.data.estree&&e.evaluater){const s=r.data.estree.body[0];s.type;const o=s.expression;o.type;const a=o.properties[0];a.type,Object.assign(n,e.evaluater.evaluateExpression(a.argument))}else wo(e,t.position);else{const i=r.name;let s;if(r.value&&typeof r.value=="object")if(r.value.data&&r.value.data.estree&&e.evaluater){const a=r.value.data.estree.body[0];a.type,s=e.evaluater.evaluateExpression(a.expression)}else wo(e,t.position);else s=r.value===null?!0:r.value;n[i]=s}return n}function If(e,t){const n=[];let r=-1;const i=e.passKeys?new Map:_I;for(;++r<t.children.length;){const s=t.children[r];let o;if(e.passKeys){const l=s.type==="element"?s.tagName:s.type==="mdxJsxFlowElement"||s.type==="mdxJsxTextElement"?s.name:void 0;if(l){const u=i.get(l)||0;o=l+"-"+u,i.set(l,u+1)}}const a=O1(e,s,o);a!==void 0&&n.push(a)}return n}function FI(e,t,n){const r=qj(e.schema,t);if(!(n==null||typeof n=="number"&&Number.isNaN(n))){if(Array.isArray(n)&&(n=r.commaSeparated?Nj(n):Kj(n)),r.property==="style"){let i=typeof n=="object"?n:$I(e,String(n));return e.stylePropertyNameCase==="css"&&(i=UI(i)),["style",i]}return[e.elementAttributeNameCase==="react"&&r.space?Uj[r.property]||r.property:r.attribute,n]}}function $I(e,t){try{return bI(t,{reactCompat:!0})}catch(n){if(e.ignoreInvalidStyle)return{};const r=n,i=new Je("Cannot parse `style` attribute",{ancestors:e.ancestors,cause:r,ruleId:"style",source:"hast-util-to-jsx-runtime"});throw i.file=e.filePath||void 0,i.url=R1+"#cannot-parse-style-attribute",i}}function j1(e,t,n){let r;if(!n)r={type:"Literal",value:t};else if(t.includes(".")){const i=t.split(".");let s=-1,o;for(;++s<i.length;){const a=ry(i[s])?{type:"Identifier",name:i[s]}:{type:"Literal",value:i[s]};o=o?{type:"MemberExpression",object:o,property:a,computed:!!(s&&a.type==="Literal"),optional:!1}:a}r=o}else r=ry(t)&&!/^[a-z]/.test(t)?{type:"Identifier",name:t}:{type:"Literal",value:t};if(r.type==="Literal"){const i=r.value;return Nf.call(e.components,i)?e.components[i]:i}if(e.evaluater)return e.evaluater.evaluateExpression(r);wo(e)}function wo(e,t){const n=new Je("Cannot handle MDX estrees without `createEvaluater`",{ancestors:e.ancestors,place:t,ruleId:"mdx-estree",source:"hast-util-to-jsx-runtime"});throw n.file=e.filePath||void 0,n.url=R1+"#cannot-handle-mdx-estrees-without-createevaluater",n}function UI(e){const t={};let n;for(n in e)Nf.call(e,n)&&(t[VI(n)]=e[n]);return t}function VI(e){let t=e.replace(CI,zI);return t.slice(0,3)==="ms-"&&(t="-"+t),t}function zI(e){return"-"+e.toLowerCase()}const ic={action:["form"],cite:["blockquote","del","ins","q"],data:["object"],formAction:["button","input"],href:["a","area","base","link"],icon:["menuitem"],itemId:null,manifest:["html"],ping:["a","area"],poster:["video"],src:["audio","embed","iframe","img","input","script","source","track","video"]},qI={};function Df(e,t){const n=qI,r=typeof n.includeImageAlt=="boolean"?n.includeImageAlt:!0,i=typeof n.includeHtml=="boolean"?n.includeHtml:!0;return I1(e,r,i)}function I1(e,t,n){if(HI(e)){if("value"in e)return e.type==="html"&&!n?"":e.value;if(t&&"alt"in e&&e.alt)return e.alt;if("children"in e)return py(e.children,t,n)}return Array.isArray(e)?py(e,t,n):""}function py(e,t,n){const r=[];let i=-1;for(;++i<e.length;)r[i]=I1(e[i],t,n);return r.join("")}function HI(e){return!!(e&&typeof e=="object")}const my=document.createElement("i");function Lf(e){const t="&"+e+";";my.innerHTML=t;const n=my.textContent;return n.charCodeAt(n.length-1)===59&&e!=="semi"||n===t?!1:n}function wt(e,t,n,r){const i=e.length;let s=0,o;if(t<0?t=-t>i?0:i+t:t=t>i?i:t,n=n>0?n:0,r.length<1e4)o=Array.from(r),o.unshift(t,n),e.splice(...o);else for(n&&e.splice(t,n);s<r.length;)o=r.slice(s,s+1e4),o.unshift(t,0),e.splice(...o),s+=1e4,t+=1e4}function Ot(e,t){return e.length>0?(wt(e,e.length,0,t),e):t}const gy={}.hasOwnProperty;function D1(e){const t={};let n=-1;for(;++n<e.length;)WI(t,e[n]);return t}function WI(e,t){let n;for(n in t){const i=(gy.call(e,n)?e[n]:void 0)||(e[n]={}),s=t[n];let o;if(s)for(o in s){gy.call(i,o)||(i[o]=[]);const a=s[o];GI(i[o],Array.isArray(a)?a:a?[a]:[])}}}function GI(e,t){let n=-1;const r=[];for(;++n<t.length;)(t[n].add==="after"?e:r).push(t[n]);wt(e,0,0,r)}function L1(e,t){const n=Number.parseInt(e,t);return n<9||n===11||n>13&&n<32||n>126&&n<160||n>55295&&n<57344||n>64975&&n<65008||(n&65535)===65535||(n&65535)===65534||n>1114111?"�":String.fromCodePoint(n)}function Gt(e){return e.replace(/[\t\n\r ]+/g," ").replace(/^ | $/g,"").toLowerCase().toUpperCase()}const Ze=dr(/[A-Za-z]/),Ge=dr(/[\dA-Za-z]/),KI=dr(/[#-'*+\--9=?A-Z^-~]/);function kl(e){return e!==null&&(e<32||e===127)}const Kd=dr(/\d/),JI=dr(/[\dA-Fa-f]/),QI=dr(/[!-/:-@[-`{-~]/);function G(e){return e!==null&&e<-2}function ce(e){return e!==null&&(e<0||e===32)}function te(e){return e===-2||e===-1||e===32}const iu=dr(new RegExp("\\p{P}|\\p{S}","u")),$r=dr(/\s/);function dr(e){return t;function t(n){return n!==null&&n>-1&&e.test(String.fromCharCode(n))}}function Xi(e){const t=[];let n=-1,r=0,i=0;for(;++n<e.length;){const s=e.charCodeAt(n);let o="";if(s===37&&Ge(e.charCodeAt(n+1))&&Ge(e.charCodeAt(n+2)))i=2;else if(s<128)/[!#$&-;=?-Z_a-z~]/.test(String.fromCharCode(s))||(o=String.fromCharCode(s));else if(s>55295&&s<57344){const a=e.charCodeAt(n+1);s<56320&&a>56319&&a<57344?(o=String.fromCharCode(s,a),i=1):o="�"}else o=String.fromCharCode(s);o&&(t.push(e.slice(r,n),encodeURIComponent(o)),r=n+i+1,o=""),i&&(n+=i,i=0)}return t.join("")+e.slice(r)}function se(e,t,n,r){const i=r?r-1:Number.POSITIVE_INFINITY;let s=0;return o;function o(l){return te(l)?(e.enter(n),a(l)):t(l)}function a(l){return te(l)&&s++<i?(e.consume(l),a):(e.exit(n),t(l))}}const XI={tokenize:YI};function YI(e){const t=e.attempt(this.parser.constructs.contentInitial,r,i);let n;return t;function r(a){if(a===null){e.consume(a);return}return e.enter("lineEnding"),e.consume(a),e.exit("lineEnding"),se(e,t,"linePrefix")}function i(a){return e.enter("paragraph"),s(a)}function s(a){const l=e.enter("chunkText",{contentType:"text",previous:n});return n&&(n.next=l),n=l,o(a)}function o(a){if(a===null){e.exit("chunkText"),e.exit("paragraph"),e.consume(a);return}return G(a)?(e.consume(a),e.exit("chunkText"),s):(e.consume(a),o)}}const ZI={tokenize:eD},yy={tokenize:tD};function eD(e){const t=this,n=[];let r=0,i,s,o;return a;function a(y){if(r<n.length){const k=n[r];return t.containerState=k[1],e.attempt(k[0].continuation,l,u)(y)}return u(y)}function l(y){if(r++,t.containerState._closeFlow){t.containerState._closeFlow=void 0,i&&g();const k=t.events.length;let T=k,S;for(;T--;)if(t.events[T][0]==="exit"&&t.events[T][1].type==="chunkFlow"){S=t.events[T][1].end;break}m(r);let P=k;for(;P<t.events.length;)t.events[P][1].end={...S},P++;return wt(t.events,T+1,0,t.events.slice(k)),t.events.length=P,u(y)}return a(y)}function u(y){if(r===n.length){if(!i)return h(y);if(i.currentConstruct&&i.currentConstruct.concrete)return p(y);t.interrupt=!!(i.currentConstruct&&!i._gfmTableDynamicInterruptHack)}return t.containerState={},e.check(yy,c,d)(y)}function c(y){return i&&g(),m(r),h(y)}function d(y){return t.parser.lazy[t.now().line]=r!==n.length,o=t.now().offset,p(y)}function h(y){return t.containerState={},e.attempt(yy,f,p)(y)}function f(y){return r++,n.push([t.currentConstruct,t.containerState]),h(y)}function p(y){if(y===null){i&&g(),m(0),e.consume(y);return}return i=i||t.parser.flow(t.now()),e.enter("chunkFlow",{_tokenizer:i,contentType:"flow",previous:s}),v(y)}function v(y){if(y===null){w(e.exit("chunkFlow"),!0),m(0),e.consume(y);return}return G(y)?(e.consume(y),w(e.exit("chunkFlow")),r=0,t.interrupt=void 0,a):(e.consume(y),v)}function w(y,k){const T=t.sliceStream(y);if(k&&T.push(null),y.previous=s,s&&(s.next=y),s=y,i.defineSkip(y.start),i.write(T),t.parser.lazy[y.start.line]){let S=i.events.length;for(;S--;)if(i.events[S][1].start.offset<o&&(!i.events[S][1].end||i.events[S][1].end.offset>o))return;const P=t.events.length;let A=P,O,E;for(;A--;)if(t.events[A][0]==="exit"&&t.events[A][1].type==="chunkFlow"){if(O){E=t.events[A][1].end;break}O=!0}for(m(r),S=P;S<t.events.length;)t.events[S][1].end={...E},S++;wt(t.events,A+1,0,t.events.slice(P)),t.events.length=S}}function m(y){let k=n.length;for(;k-- >y;){const T=n[k];t.containerState=T[1],T[0].exit.call(t,e)}n.length=y}function g(){i.write([null]),s=void 0,i=void 0,t.containerState._closeFlow=void 0}}function tD(e,t,n){return se(e,e.attempt(this.parser.constructs.document,t,n),"linePrefix",this.parser.constructs.disable.null.includes("codeIndented")?void 0:4)}function Vi(e){if(e===null||ce(e)||$r(e))return 1;if(iu(e))return 2}function su(e,t,n){const r=[];let i=-1;for(;++i<e.length;){const s=e[i].resolveAll;s&&!r.includes(s)&&(t=s(t,n),r.push(s))}return t}const Jd={name:"attention",resolveAll:nD,tokenize:rD};function nD(e,t){let n=-1,r,i,s,o,a,l,u,c;for(;++n<e.length;)if(e[n][0]==="enter"&&e[n][1].type==="attentionSequence"&&e[n][1]._close){for(r=n;r--;)if(e[r][0]==="exit"&&e[r][1].type==="attentionSequence"&&e[r][1]._open&&t.sliceSerialize(e[r][1]).charCodeAt(0)===t.sliceSerialize(e[n][1]).charCodeAt(0)){if((e[r][1]._close||e[n][1]._open)&&(e[n][1].end.offset-e[n][1].start.offset)%3&&!((e[r][1].end.offset-e[r][1].start.offset+e[n][1].end.offset-e[n][1].start.offset)%3))continue;l=e[r][1].end.offset-e[r][1].start.offset>1&&e[n][1].end.offset-e[n][1].start.offset>1?2:1;const d={...e[r][1].end},h={...e[n][1].start};vy(d,-l),vy(h,l),o={type:l>1?"strongSequence":"emphasisSequence",start:d,end:{...e[r][1].end}},a={type:l>1?"strongSequence":"emphasisSequence",start:{...e[n][1].start},end:h},s={type:l>1?"strongText":"emphasisText",start:{...e[r][1].end},end:{...e[n][1].start}},i={type:l>1?"strong":"emphasis",start:{...o.start},end:{...a.end}},e[r][1].end={...o.start},e[n][1].start={...a.end},u=[],e[r][1].end.offset-e[r][1].start.offset&&(u=Ot(u,[["enter",e[r][1],t],["exit",e[r][1],t]])),u=Ot(u,[["enter",i,t],["enter",o,t],["exit",o,t],["enter",s,t]]),u=Ot(u,su(t.parser.constructs.insideSpan.null,e.slice(r+1,n),t)),u=Ot(u,[["exit",s,t],["enter",a,t],["exit",a,t],["exit",i,t]]),e[n][1].end.offset-e[n][1].start.offset?(c=2,u=Ot(u,[["enter",e[n][1],t],["exit",e[n][1],t]])):c=0,wt(e,r-1,n-r+3,u),n=r+u.length-c-2;break}}for(n=-1;++n<e.length;)e[n][1].type==="attentionSequence"&&(e[n][1].type="data");return e}function rD(e,t){const n=this.parser.constructs.attentionMarkers.null,r=this.previous,i=Vi(r);let s;return o;function o(l){return s=l,e.enter("attentionSequence"),a(l)}function a(l){if(l===s)return e.consume(l),a;const u=e.exit("attentionSequence"),c=Vi(l),d=!c||c===2&&i||n.includes(l),h=!i||i===2&&c||n.includes(r);return u._open=!!(s===42?d:d&&(i||!h)),u._close=!!(s===42?h:h&&(c||!d)),t(l)}}function vy(e,t){e.column+=t,e.offset+=t,e._bufferIndex+=t}const iD={name:"autolink",tokenize:sD};function sD(e,t,n){let r=0;return i;function i(f){return e.enter("autolink"),e.enter("autolinkMarker"),e.consume(f),e.exit("autolinkMarker"),e.enter("autolinkProtocol"),s}function s(f){return Ze(f)?(e.consume(f),o):f===64?n(f):u(f)}function o(f){return f===43||f===45||f===46||Ge(f)?(r=1,a(f)):u(f)}function a(f){return f===58?(e.consume(f),r=0,l):(f===43||f===45||f===46||Ge(f))&&r++<32?(e.consume(f),a):(r=0,u(f))}function l(f){return f===62?(e.exit("autolinkProtocol"),e.enter("autolinkMarker"),e.consume(f),e.exit("autolinkMarker"),e.exit("autolink"),t):f===null||f===32||f===60||kl(f)?n(f):(e.consume(f),l)}function u(f){return f===64?(e.consume(f),c):KI(f)?(e.consume(f),u):n(f)}function c(f){return Ge(f)?d(f):n(f)}function d(f){return f===46?(e.consume(f),r=0,c):f===62?(e.exit("autolinkProtocol").type="autolinkEmail",e.enter("autolinkMarker"),e.consume(f),e.exit("autolinkMarker"),e.exit("autolink"),t):h(f)}function h(f){if((f===45||Ge(f))&&r++<63){const p=f===45?h:d;return e.consume(f),p}return n(f)}}const Io={partial:!0,tokenize:oD};function oD(e,t,n){return r;function r(s){return te(s)?se(e,i,"linePrefix")(s):i(s)}function i(s){return s===null||G(s)?t(s):n(s)}}const M1={continuation:{tokenize:lD},exit:uD,name:"blockQuote",tokenize:aD};function aD(e,t,n){const r=this;return i;function i(o){if(o===62){const a=r.containerState;return a.open||(e.enter("blockQuote",{_container:!0}),a.open=!0),e.enter("blockQuotePrefix"),e.enter("blockQuoteMarker"),e.consume(o),e.exit("blockQuoteMarker"),s}return n(o)}function s(o){return te(o)?(e.enter("blockQuotePrefixWhitespace"),e.consume(o),e.exit("blockQuotePrefixWhitespace"),e.exit("blockQuotePrefix"),t):(e.exit("blockQuotePrefix"),t(o))}}function lD(e,t,n){const r=this;return i;function i(o){return te(o)?se(e,s,"linePrefix",r.parser.constructs.disable.null.includes("codeIndented")?void 0:4)(o):s(o)}function s(o){return e.attempt(M1,t,n)(o)}}function uD(e){e.exit("blockQuote")}const B1={name:"characterEscape",tokenize:cD};function cD(e,t,n){return r;function r(s){return e.enter("characterEscape"),e.enter("escapeMarker"),e.consume(s),e.exit("escapeMarker"),i}function i(s){return QI(s)?(e.enter("characterEscapeValue"),e.consume(s),e.exit("characterEscapeValue"),e.exit("characterEscape"),t):n(s)}}const F1={name:"characterReference",tokenize:dD};function dD(e,t,n){const r=this;let i=0,s,o;return a;function a(d){return e.enter("characterReference"),e.enter("characterReferenceMarker"),e.consume(d),e.exit("characterReferenceMarker"),l}function l(d){return d===35?(e.enter("characterReferenceMarkerNumeric"),e.consume(d),e.exit("characterReferenceMarkerNumeric"),u):(e.enter("characterReferenceValue"),s=31,o=Ge,c(d))}function u(d){return d===88||d===120?(e.enter("characterReferenceMarkerHexadecimal"),e.consume(d),e.exit("characterReferenceMarkerHexadecimal"),e.enter("characterReferenceValue"),s=6,o=JI,c):(e.enter("characterReferenceValue"),s=7,o=Kd,c(d))}function c(d){if(d===59&&i){const h=e.exit("characterReferenceValue");return o===Ge&&!Lf(r.sliceSerialize(h))?n(d):(e.enter("characterReferenceMarker"),e.consume(d),e.exit("characterReferenceMarker"),e.exit("characterReference"),t)}return o(d)&&i++<s?(e.consume(d),c):n(d)}}const xy={partial:!0,tokenize:fD},wy={concrete:!0,name:"codeFenced",tokenize:hD};function hD(e,t,n){const r=this,i={partial:!0,tokenize:T};let s=0,o=0,a;return l;function l(S){return u(S)}function u(S){const P=r.events[r.events.length-1];return s=P&&P[1].type==="linePrefix"?P[2].sliceSerialize(P[1],!0).length:0,a=S,e.enter("codeFenced"),e.enter("codeFencedFence"),e.enter("codeFencedFenceSequence"),c(S)}function c(S){return S===a?(o++,e.consume(S),c):o<3?n(S):(e.exit("codeFencedFenceSequence"),te(S)?se(e,d,"whitespace")(S):d(S))}function d(S){return S===null||G(S)?(e.exit("codeFencedFence"),r.interrupt?t(S):e.check(xy,v,k)(S)):(e.enter("codeFencedFenceInfo"),e.enter("chunkString",{contentType:"string"}),h(S))}function h(S){return S===null||G(S)?(e.exit("chunkString"),e.exit("codeFencedFenceInfo"),d(S)):te(S)?(e.exit("chunkString"),e.exit("codeFencedFenceInfo"),se(e,f,"whitespace")(S)):S===96&&S===a?n(S):(e.consume(S),h)}function f(S){return S===null||G(S)?d(S):(e.enter("codeFencedFenceMeta"),e.enter("chunkString",{contentType:"string"}),p(S))}function p(S){return S===null||G(S)?(e.exit("chunkString"),e.exit("codeFencedFenceMeta"),d(S)):S===96&&S===a?n(S):(e.consume(S),p)}function v(S){return e.attempt(i,k,w)(S)}function w(S){return e.enter("lineEnding"),e.consume(S),e.exit("lineEnding"),m}function m(S){return s>0&&te(S)?se(e,g,"linePrefix",s+1)(S):g(S)}function g(S){return S===null||G(S)?e.check(xy,v,k)(S):(e.enter("codeFlowValue"),y(S))}function y(S){return S===null||G(S)?(e.exit("codeFlowValue"),g(S)):(e.consume(S),y)}function k(S){return e.exit("codeFenced"),t(S)}function T(S,P,A){let O=0;return E;function E(M){return S.enter("lineEnding"),S.consume(M),S.exit("lineEnding"),L}function L(M){return S.enter("codeFencedFence"),te(M)?se(S,B,"linePrefix",r.parser.constructs.disable.null.includes("codeIndented")?void 0:4)(M):B(M)}function B(M){return M===a?(S.enter("codeFencedFenceSequence"),K(M)):A(M)}function K(M){return M===a?(O++,S.consume(M),K):O>=o?(S.exit("codeFencedFenceSequence"),te(M)?se(S,J,"whitespace")(M):J(M)):A(M)}function J(M){return M===null||G(M)?(S.exit("codeFencedFence"),P(M)):A(M)}}}function fD(e,t,n){const r=this;return i;function i(o){return o===null?n(o):(e.enter("lineEnding"),e.consume(o),e.exit("lineEnding"),s)}function s(o){return r.parser.lazy[r.now().line]?n(o):t(o)}}const sc={name:"codeIndented",tokenize:mD},pD={partial:!0,tokenize:gD};function mD(e,t,n){const r=this;return i;function i(u){return e.enter("codeIndented"),se(e,s,"linePrefix",5)(u)}function s(u){const c=r.events[r.events.length-1];return c&&c[1].type==="linePrefix"&&c[2].sliceSerialize(c[1],!0).length>=4?o(u):n(u)}function o(u){return u===null?l(u):G(u)?e.attempt(pD,o,l)(u):(e.enter("codeFlowValue"),a(u))}function a(u){return u===null||G(u)?(e.exit("codeFlowValue"),o(u)):(e.consume(u),a)}function l(u){return e.exit("codeIndented"),t(u)}}function gD(e,t,n){const r=this;return i;function i(o){return r.parser.lazy[r.now().line]?n(o):G(o)?(e.enter("lineEnding"),e.consume(o),e.exit("lineEnding"),i):se(e,s,"linePrefix",5)(o)}function s(o){const a=r.events[r.events.length-1];return a&&a[1].type==="linePrefix"&&a[2].sliceSerialize(a[1],!0).length>=4?t(o):G(o)?i(o):n(o)}}const yD={name:"codeText",previous:xD,resolve:vD,tokenize:wD};function vD(e){let t=e.length-4,n=3,r,i;if((e[n][1].type==="lineEnding"||e[n][1].type==="space")&&(e[t][1].type==="lineEnding"||e[t][1].type==="space")){for(r=n;++r<t;)if(e[r][1].type==="codeTextData"){e[n][1].type="codeTextPadding",e[t][1].type="codeTextPadding",n+=2,t-=2;break}}for(r=n-1,t++;++r<=t;)i===void 0?r!==t&&e[r][1].type!=="lineEnding"&&(i=r):(r===t||e[r][1].type==="lineEnding")&&(e[i][1].type="codeTextData",r!==i+2&&(e[i][1].end=e[r-1][1].end,e.splice(i+2,r-i-2),t-=r-i-2,r=i+2),i=void 0);return e}function xD(e){return e!==96||this.events[this.events.length-1][1].type==="characterEscape"}function wD(e,t,n){let r=0,i,s;return o;function o(d){return e.enter("codeText"),e.enter("codeTextSequence"),a(d)}function a(d){return d===96?(e.consume(d),r++,a):(e.exit("codeTextSequence"),l(d))}function l(d){return d===null?n(d):d===32?(e.enter("space"),e.consume(d),e.exit("space"),l):d===96?(s=e.enter("codeTextSequence"),i=0,c(d)):G(d)?(e.enter("lineEnding"),e.consume(d),e.exit("lineEnding"),l):(e.enter("codeTextData"),u(d))}function u(d){return d===null||d===32||d===96||G(d)?(e.exit("codeTextData"),l(d)):(e.consume(d),u)}function c(d){return d===96?(e.consume(d),i++,c):i===r?(e.exit("codeTextSequence"),e.exit("codeText"),t(d)):(s.type="codeTextData",u(d))}}class kD{constructor(t){this.left=t?[...t]:[],this.right=[]}get(t){if(t<0||t>=this.left.length+this.right.length)throw new RangeError("Cannot access index `"+t+"` in a splice buffer of size `"+(this.left.length+this.right.length)+"`");return t<this.left.length?this.left[t]:this.right[this.right.length-t+this.left.length-1]}get length(){return this.left.length+this.right.length}shift(){return this.setCursor(0),this.right.pop()}slice(t,n){const r=n??Number.POSITIVE_INFINITY;return r<this.left.length?this.left.slice(t,r):t>this.left.length?this.right.slice(this.right.length-r+this.left.length,this.right.length-t+this.left.length).reverse():this.left.slice(t).concat(this.right.slice(this.right.length-r+this.left.length).reverse())}splice(t,n,r){const i=n||0;this.setCursor(Math.trunc(t));const s=this.right.splice(this.right.length-i,Number.POSITIVE_INFINITY);return r&&ds(this.left,r),s.reverse()}pop(){return this.setCursor(Number.POSITIVE_INFINITY),this.left.pop()}push(t){this.setCursor(Number.POSITIVE_INFINITY),this.left.push(t)}pushMany(t){this.setCursor(Number.POSITIVE_INFINITY),ds(this.left,t)}unshift(t){this.setCursor(0),this.right.push(t)}unshiftMany(t){this.setCursor(0),ds(this.right,t.reverse())}setCursor(t){if(!(t===this.left.length||t>this.left.length&&this.right.length===0||t<0&&this.left.length===0))if(t<this.left.length){const n=this.left.splice(t,Number.POSITIVE_INFINITY);ds(this.right,n.reverse())}else{const n=this.right.splice(this.left.length+this.right.length-t,Number.POSITIVE_INFINITY);ds(this.left,n.reverse())}}}function ds(e,t){let n=0;if(t.length<1e4)e.push(...t);else for(;n<t.length;)e.push(...t.slice(n,n+1e4)),n+=1e4}function $1(e){const t={};let n=-1,r,i,s,o,a,l,u;const c=new kD(e);for(;++n<c.length;){for(;n in t;)n=t[n];if(r=c.get(n),n&&r[1].type==="chunkFlow"&&c.get(n-1)[1].type==="listItemPrefix"&&(l=r[1]._tokenizer.events,s=0,s<l.length&&l[s][1].type==="lineEndingBlank"&&(s+=2),s<l.length&&l[s][1].type==="content"))for(;++s<l.length&&l[s][1].type!=="content";)l[s][1].type==="chunkText"&&(l[s][1]._isInFirstContentOfListItem=!0,s++);if(r[0]==="enter")r[1].contentType&&(Object.assign(t,bD(c,n)),n=t[n],u=!0);else if(r[1]._container){for(s=n,i=void 0;s--;)if(o=c.get(s),o[1].type==="lineEnding"||o[1].type==="lineEndingBlank")o[0]==="enter"&&(i&&(c.get(i)[1].type="lineEndingBlank"),o[1].type="lineEnding",i=s);else if(!(o[1].type==="linePrefix"||o[1].type==="listItemIndent"))break;i&&(r[1].end={...c.get(i)[1].start},a=c.slice(i,n),a.unshift(r),c.splice(i,n-i+1,a))}}return wt(e,0,Number.POSITIVE_INFINITY,c.slice(0)),!u}function bD(e,t){const n=e.get(t)[1],r=e.get(t)[2];let i=t-1;const s=[];let o=n._tokenizer;o||(o=r.parser[n.contentType](n.start),n._contentTypeTextTrailing&&(o._contentTypeTextTrailing=!0));const a=o.events,l=[],u={};let c,d,h=-1,f=n,p=0,v=0;const w=[v];for(;f;){for(;e.get(++i)[1]!==f;);s.push(i),f._tokenizer||(c=r.sliceStream(f),f.next||c.push(null),d&&o.defineSkip(f.start),f._isInFirstContentOfListItem&&(o._gfmTasklistFirstContentOfListItem=!0),o.write(c),f._isInFirstContentOfListItem&&(o._gfmTasklistFirstContentOfListItem=void 0)),d=f,f=f.next}for(f=n;++h<a.length;)a[h][0]==="exit"&&a[h-1][0]==="enter"&&a[h][1].type===a[h-1][1].type&&a[h][1].start.line!==a[h][1].end.line&&(v=h+1,w.push(v),f._tokenizer=void 0,f.previous=void 0,f=f.next);for(o.events=[],f?(f._tokenizer=void 0,f.previous=void 0):w.pop(),h=w.length;h--;){const m=a.slice(w[h],w[h+1]),g=s.pop();l.push([g,g+m.length-1]),e.splice(g,2,m)}for(l.reverse(),h=-1;++h<l.length;)u[p+l[h][0]]=p+l[h][1],p+=l[h][1]-l[h][0]-1;return u}const SD={resolve:CD,tokenize:ED},_D={partial:!0,tokenize:TD};function CD(e){return $1(e),e}function ED(e,t){let n;return r;function r(a){return e.enter("content"),n=e.enter("chunkContent",{contentType:"content"}),i(a)}function i(a){return a===null?s(a):G(a)?e.check(_D,o,s)(a):(e.consume(a),i)}function s(a){return e.exit("chunkContent"),e.exit("content"),t(a)}function o(a){return e.consume(a),e.exit("chunkContent"),n.next=e.enter("chunkContent",{contentType:"content",previous:n}),n=n.next,i}}function TD(e,t,n){const r=this;return i;function i(o){return e.exit("chunkContent"),e.enter("lineEnding"),e.consume(o),e.exit("lineEnding"),se(e,s,"linePrefix")}function s(o){if(o===null||G(o))return n(o);const a=r.events[r.events.length-1];return!r.parser.constructs.disable.null.includes("codeIndented")&&a&&a[1].type==="linePrefix"&&a[2].sliceSerialize(a[1],!0).length>=4?t(o):e.interrupt(r.parser.constructs.flow,n,t)(o)}}function U1(e,t,n,r,i,s,o,a,l){const u=l||Number.POSITIVE_INFINITY;let c=0;return d;function d(m){return m===60?(e.enter(r),e.enter(i),e.enter(s),e.consume(m),e.exit(s),h):m===null||m===32||m===41||kl(m)?n(m):(e.enter(r),e.enter(o),e.enter(a),e.enter("chunkString",{contentType:"string"}),v(m))}function h(m){return m===62?(e.enter(s),e.consume(m),e.exit(s),e.exit(i),e.exit(r),t):(e.enter(a),e.enter("chunkString",{contentType:"string"}),f(m))}function f(m){return m===62?(e.exit("chunkString"),e.exit(a),h(m)):m===null||m===60||G(m)?n(m):(e.consume(m),m===92?p:f)}function p(m){return m===60||m===62||m===92?(e.consume(m),f):f(m)}function v(m){return!c&&(m===null||m===41||ce(m))?(e.exit("chunkString"),e.exit(a),e.exit(o),e.exit(r),t(m)):c<u&&m===40?(e.consume(m),c++,v):m===41?(e.consume(m),c--,v):m===null||m===32||m===40||kl(m)?n(m):(e.consume(m),m===92?w:v)}function w(m){return m===40||m===41||m===92?(e.consume(m),v):v(m)}}function V1(e,t,n,r,i,s){const o=this;let a=0,l;return u;function u(f){return e.enter(r),e.enter(i),e.consume(f),e.exit(i),e.enter(s),c}function c(f){return a>999||f===null||f===91||f===93&&!l||f===94&&!a&&"_hiddenFootnoteSupport"in o.parser.constructs?n(f):f===93?(e.exit(s),e.enter(i),e.consume(f),e.exit(i),e.exit(r),t):G(f)?(e.enter("lineEnding"),e.consume(f),e.exit("lineEnding"),c):(e.enter("chunkString",{contentType:"string"}),d(f))}function d(f){return f===null||f===91||f===93||G(f)||a++>999?(e.exit("chunkString"),c(f)):(e.consume(f),l||(l=!te(f)),f===92?h:d)}function h(f){return f===91||f===92||f===93?(e.consume(f),a++,d):d(f)}}function z1(e,t,n,r,i,s){let o;return a;function a(h){return h===34||h===39||h===40?(e.enter(r),e.enter(i),e.consume(h),e.exit(i),o=h===40?41:h,l):n(h)}function l(h){return h===o?(e.enter(i),e.consume(h),e.exit(i),e.exit(r),t):(e.enter(s),u(h))}function u(h){return h===o?(e.exit(s),l(o)):h===null?n(h):G(h)?(e.enter("lineEnding"),e.consume(h),e.exit("lineEnding"),se(e,u,"linePrefix")):(e.enter("chunkString",{contentType:"string"}),c(h))}function c(h){return h===o||h===null||G(h)?(e.exit("chunkString"),u(h)):(e.consume(h),h===92?d:c)}function d(h){return h===o||h===92?(e.consume(h),c):c(h)}}function Us(e,t){let n;return r;function r(i){return G(i)?(e.enter("lineEnding"),e.consume(i),e.exit("lineEnding"),n=!0,r):te(i)?se(e,r,n?"linePrefix":"lineSuffix")(i):t(i)}}const PD={name:"definition",tokenize:RD},AD={partial:!0,tokenize:OD};function RD(e,t,n){const r=this;let i;return s;function s(f){return e.enter("definition"),o(f)}function o(f){return V1.call(r,e,a,n,"definitionLabel","definitionLabelMarker","definitionLabelString")(f)}function a(f){return i=Gt(r.sliceSerialize(r.events[r.events.length-1][1]).slice(1,-1)),f===58?(e.enter("definitionMarker"),e.consume(f),e.exit("definitionMarker"),l):n(f)}function l(f){return ce(f)?Us(e,u)(f):u(f)}function u(f){return U1(e,c,n,"definitionDestination","definitionDestinationLiteral","definitionDestinationLiteralMarker","definitionDestinationRaw","definitionDestinationString")(f)}function c(f){return e.attempt(AD,d,d)(f)}function d(f){return te(f)?se(e,h,"whitespace")(f):h(f)}function h(f){return f===null||G(f)?(e.exit("definition"),r.parser.defined.push(i),t(f)):n(f)}}function OD(e,t,n){return r;function r(a){return ce(a)?Us(e,i)(a):n(a)}function i(a){return z1(e,s,n,"definitionTitle","definitionTitleMarker","definitionTitleString")(a)}function s(a){return te(a)?se(e,o,"whitespace")(a):o(a)}function o(a){return a===null||G(a)?t(a):n(a)}}const ND={name:"hardBreakEscape",tokenize:jD};function jD(e,t,n){return r;function r(s){return e.enter("hardBreakEscape"),e.consume(s),i}function i(s){return G(s)?(e.exit("hardBreakEscape"),t(s)):n(s)}}const ID={name:"headingAtx",resolve:DD,tokenize:LD};function DD(e,t){let n=e.length-2,r=3,i,s;return e[r][1].type==="whitespace"&&(r+=2),n-2>r&&e[n][1].type==="whitespace"&&(n-=2),e[n][1].type==="atxHeadingSequence"&&(r===n-1||n-4>r&&e[n-2][1].type==="whitespace")&&(n-=r+1===n?2:4),n>r&&(i={type:"atxHeadingText",start:e[r][1].start,end:e[n][1].end},s={type:"chunkText",start:e[r][1].start,end:e[n][1].end,contentType:"text"},wt(e,r,n-r+1,[["enter",i,t],["enter",s,t],["exit",s,t],["exit",i,t]])),e}function LD(e,t,n){let r=0;return i;function i(c){return e.enter("atxHeading"),s(c)}function s(c){return e.enter("atxHeadingSequence"),o(c)}function o(c){return c===35&&r++<6?(e.consume(c),o):c===null||ce(c)?(e.exit("atxHeadingSequence"),a(c)):n(c)}function a(c){return c===35?(e.enter("atxHeadingSequence"),l(c)):c===null||G(c)?(e.exit("atxHeading"),t(c)):te(c)?se(e,a,"whitespace")(c):(e.enter("atxHeadingText"),u(c))}function l(c){return c===35?(e.consume(c),l):(e.exit("atxHeadingSequence"),a(c))}function u(c){return c===null||c===35||ce(c)?(e.exit("atxHeadingText"),a(c)):(e.consume(c),u)}}const MD=["address","article","aside","base","basefont","blockquote","body","caption","center","col","colgroup","dd","details","dialog","dir","div","dl","dt","fieldset","figcaption","figure","footer","form","frame","frameset","h1","h2","h3","h4","h5","h6","head","header","hr","html","iframe","legend","li","link","main","menu","menuitem","nav","noframes","ol","optgroup","option","p","param","search","section","summary","table","tbody","td","tfoot","th","thead","title","tr","track","ul"],ky=["pre","script","style","textarea"],BD={concrete:!0,name:"htmlFlow",resolveTo:UD,tokenize:VD},FD={partial:!0,tokenize:qD},$D={partial:!0,tokenize:zD};function UD(e){let t=e.length;for(;t--&&!(e[t][0]==="enter"&&e[t][1].type==="htmlFlow"););return t>1&&e[t-2][1].type==="linePrefix"&&(e[t][1].start=e[t-2][1].start,e[t+1][1].start=e[t-2][1].start,e.splice(t-2,2)),e}function VD(e,t,n){const r=this;let i,s,o,a,l;return u;function u(b){return c(b)}function c(b){return e.enter("htmlFlow"),e.enter("htmlFlowData"),e.consume(b),d}function d(b){return b===33?(e.consume(b),h):b===47?(e.consume(b),s=!0,v):b===63?(e.consume(b),i=3,r.interrupt?t:_):Ze(b)?(e.consume(b),o=String.fromCharCode(b),w):n(b)}function h(b){return b===45?(e.consume(b),i=2,f):b===91?(e.consume(b),i=5,a=0,p):Ze(b)?(e.consume(b),i=4,r.interrupt?t:_):n(b)}function f(b){return b===45?(e.consume(b),r.interrupt?t:_):n(b)}function p(b){const ee="CDATA[";return b===ee.charCodeAt(a++)?(e.consume(b),a===ee.length?r.interrupt?t:B:p):n(b)}function v(b){return Ze(b)?(e.consume(b),o=String.fromCharCode(b),w):n(b)}function w(b){if(b===null||b===47||b===62||ce(b)){const ee=b===47,de=o.toLowerCase();return!ee&&!s&&ky.includes(de)?(i=1,r.interrupt?t(b):B(b)):MD.includes(o.toLowerCase())?(i=6,ee?(e.consume(b),m):r.interrupt?t(b):B(b)):(i=7,r.interrupt&&!r.parser.lazy[r.now().line]?n(b):s?g(b):y(b))}return b===45||Ge(b)?(e.consume(b),o+=String.fromCharCode(b),w):n(b)}function m(b){return b===62?(e.consume(b),r.interrupt?t:B):n(b)}function g(b){return te(b)?(e.consume(b),g):E(b)}function y(b){return b===47?(e.consume(b),E):b===58||b===95||Ze(b)?(e.consume(b),k):te(b)?(e.consume(b),y):E(b)}function k(b){return b===45||b===46||b===58||b===95||Ge(b)?(e.consume(b),k):T(b)}function T(b){return b===61?(e.consume(b),S):te(b)?(e.consume(b),T):y(b)}function S(b){return b===null||b===60||b===61||b===62||b===96?n(b):b===34||b===39?(e.consume(b),l=b,P):te(b)?(e.consume(b),S):A(b)}function P(b){return b===l?(e.consume(b),l=null,O):b===null||G(b)?n(b):(e.consume(b),P)}function A(b){return b===null||b===34||b===39||b===47||b===60||b===61||b===62||b===96||ce(b)?T(b):(e.consume(b),A)}function O(b){return b===47||b===62||te(b)?y(b):n(b)}function E(b){return b===62?(e.consume(b),L):n(b)}function L(b){return b===null||G(b)?B(b):te(b)?(e.consume(b),L):n(b)}function B(b){return b===45&&i===2?(e.consume(b),U):b===60&&i===1?(e.consume(b),X):b===62&&i===4?(e.consume(b),N):b===63&&i===3?(e.consume(b),_):b===93&&i===5?(e.consume(b),$):G(b)&&(i===6||i===7)?(e.exit("htmlFlowData"),e.check(FD,q,K)(b)):b===null||G(b)?(e.exit("htmlFlowData"),K(b)):(e.consume(b),B)}function K(b){return e.check($D,J,q)(b)}function J(b){return e.enter("lineEnding"),e.consume(b),e.exit("lineEnding"),M}function M(b){return b===null||G(b)?K(b):(e.enter("htmlFlowData"),B(b))}function U(b){return b===45?(e.consume(b),_):B(b)}function X(b){return b===47?(e.consume(b),o="",I):B(b)}function I(b){if(b===62){const ee=o.toLowerCase();return ky.includes(ee)?(e.consume(b),N):B(b)}return Ze(b)&&o.length<8?(e.consume(b),o+=String.fromCharCode(b),I):B(b)}function $(b){return b===93?(e.consume(b),_):B(b)}function _(b){return b===62?(e.consume(b),N):b===45&&i===2?(e.consume(b),_):B(b)}function N(b){return b===null||G(b)?(e.exit("htmlFlowData"),q(b)):(e.consume(b),N)}function q(b){return e.exit("htmlFlow"),t(b)}}function zD(e,t,n){const r=this;return i;function i(o){return G(o)?(e.enter("lineEnding"),e.consume(o),e.exit("lineEnding"),s):n(o)}function s(o){return r.parser.lazy[r.now().line]?n(o):t(o)}}function qD(e,t,n){return r;function r(i){return e.enter("lineEnding"),e.consume(i),e.exit("lineEnding"),e.attempt(Io,t,n)}}const HD={name:"htmlText",tokenize:WD};function WD(e,t,n){const r=this;let i,s,o;return a;function a(_){return e.enter("htmlText"),e.enter("htmlTextData"),e.consume(_),l}function l(_){return _===33?(e.consume(_),u):_===47?(e.consume(_),T):_===63?(e.consume(_),y):Ze(_)?(e.consume(_),A):n(_)}function u(_){return _===45?(e.consume(_),c):_===91?(e.consume(_),s=0,p):Ze(_)?(e.consume(_),g):n(_)}function c(_){return _===45?(e.consume(_),f):n(_)}function d(_){return _===null?n(_):_===45?(e.consume(_),h):G(_)?(o=d,X(_)):(e.consume(_),d)}function h(_){return _===45?(e.consume(_),f):d(_)}function f(_){return _===62?U(_):_===45?h(_):d(_)}function p(_){const N="CDATA[";return _===N.charCodeAt(s++)?(e.consume(_),s===N.length?v:p):n(_)}function v(_){return _===null?n(_):_===93?(e.consume(_),w):G(_)?(o=v,X(_)):(e.consume(_),v)}function w(_){return _===93?(e.consume(_),m):v(_)}function m(_){return _===62?U(_):_===93?(e.consume(_),m):v(_)}function g(_){return _===null||_===62?U(_):G(_)?(o=g,X(_)):(e.consume(_),g)}function y(_){return _===null?n(_):_===63?(e.consume(_),k):G(_)?(o=y,X(_)):(e.consume(_),y)}function k(_){return _===62?U(_):y(_)}function T(_){return Ze(_)?(e.consume(_),S):n(_)}function S(_){return _===45||Ge(_)?(e.consume(_),S):P(_)}function P(_){return G(_)?(o=P,X(_)):te(_)?(e.consume(_),P):U(_)}function A(_){return _===45||Ge(_)?(e.consume(_),A):_===47||_===62||ce(_)?O(_):n(_)}function O(_){return _===47?(e.consume(_),U):_===58||_===95||Ze(_)?(e.consume(_),E):G(_)?(o=O,X(_)):te(_)?(e.consume(_),O):U(_)}function E(_){return _===45||_===46||_===58||_===95||Ge(_)?(e.consume(_),E):L(_)}function L(_){return _===61?(e.consume(_),B):G(_)?(o=L,X(_)):te(_)?(e.consume(_),L):O(_)}function B(_){return _===null||_===60||_===61||_===62||_===96?n(_):_===34||_===39?(e.consume(_),i=_,K):G(_)?(o=B,X(_)):te(_)?(e.consume(_),B):(e.consume(_),J)}function K(_){return _===i?(e.consume(_),i=void 0,M):_===null?n(_):G(_)?(o=K,X(_)):(e.consume(_),K)}function J(_){return _===null||_===34||_===39||_===60||_===61||_===96?n(_):_===47||_===62||ce(_)?O(_):(e.consume(_),J)}function M(_){return _===47||_===62||ce(_)?O(_):n(_)}function U(_){return _===62?(e.consume(_),e.exit("htmlTextData"),e.exit("htmlText"),t):n(_)}function X(_){return e.exit("htmlTextData"),e.enter("lineEnding"),e.consume(_),e.exit("lineEnding"),I}function I(_){return te(_)?se(e,$,"linePrefix",r.parser.constructs.disable.null.includes("codeIndented")?void 0:4)(_):$(_)}function $(_){return e.enter("htmlTextData"),o(_)}}const Mf={name:"labelEnd",resolveAll:QD,resolveTo:XD,tokenize:YD},GD={tokenize:ZD},KD={tokenize:eL},JD={tokenize:tL};function QD(e){let t=-1;const n=[];for(;++t<e.length;){const r=e[t][1];if(n.push(e[t]),r.type==="labelImage"||r.type==="labelLink"||r.type==="labelEnd"){const i=r.type==="labelImage"?4:2;r.type="data",t+=i}}return e.length!==n.length&&wt(e,0,e.length,n),e}function XD(e,t){let n=e.length,r=0,i,s,o,a;for(;n--;)if(i=e[n][1],s){if(i.type==="link"||i.type==="labelLink"&&i._inactive)break;e[n][0]==="enter"&&i.type==="labelLink"&&(i._inactive=!0)}else if(o){if(e[n][0]==="enter"&&(i.type==="labelImage"||i.type==="labelLink")&&!i._balanced&&(s=n,i.type!=="labelLink")){r=2;break}}else i.type==="labelEnd"&&(o=n);const l={type:e[s][1].type==="labelLink"?"link":"image",start:{...e[s][1].start},end:{...e[e.length-1][1].end}},u={type:"label",start:{...e[s][1].start},end:{...e[o][1].end}},c={type:"labelText",start:{...e[s+r+2][1].end},end:{...e[o-2][1].start}};return a=[["enter",l,t],["enter",u,t]],a=Ot(a,e.slice(s+1,s+r+3)),a=Ot(a,[["enter",c,t]]),a=Ot(a,su(t.parser.constructs.insideSpan.null,e.slice(s+r+4,o-3),t)),a=Ot(a,[["exit",c,t],e[o-2],e[o-1],["exit",u,t]]),a=Ot(a,e.slice(o+1)),a=Ot(a,[["exit",l,t]]),wt(e,s,e.length,a),e}function YD(e,t,n){const r=this;let i=r.events.length,s,o;for(;i--;)if((r.events[i][1].type==="labelImage"||r.events[i][1].type==="labelLink")&&!r.events[i][1]._balanced){s=r.events[i][1];break}return a;function a(h){return s?s._inactive?d(h):(o=r.parser.defined.includes(Gt(r.sliceSerialize({start:s.end,end:r.now()}))),e.enter("labelEnd"),e.enter("labelMarker"),e.consume(h),e.exit("labelMarker"),e.exit("labelEnd"),l):n(h)}function l(h){return h===40?e.attempt(GD,c,o?c:d)(h):h===91?e.attempt(KD,c,o?u:d)(h):o?c(h):d(h)}function u(h){return e.attempt(JD,c,d)(h)}function c(h){return t(h)}function d(h){return s._balanced=!0,n(h)}}function ZD(e,t,n){return r;function r(d){return e.enter("resource"),e.enter("resourceMarker"),e.consume(d),e.exit("resourceMarker"),i}function i(d){return ce(d)?Us(e,s)(d):s(d)}function s(d){return d===41?c(d):U1(e,o,a,"resourceDestination","resourceDestinationLiteral","resourceDestinationLiteralMarker","resourceDestinationRaw","resourceDestinationString",32)(d)}function o(d){return ce(d)?Us(e,l)(d):c(d)}function a(d){return n(d)}function l(d){return d===34||d===39||d===40?z1(e,u,n,"resourceTitle","resourceTitleMarker","resourceTitleString")(d):c(d)}function u(d){return ce(d)?Us(e,c)(d):c(d)}function c(d){return d===41?(e.enter("resourceMarker"),e.consume(d),e.exit("resourceMarker"),e.exit("resource"),t):n(d)}}function eL(e,t,n){const r=this;return i;function i(a){return V1.call(r,e,s,o,"reference","referenceMarker","referenceString")(a)}function s(a){return r.parser.defined.includes(Gt(r.sliceSerialize(r.events[r.events.length-1][1]).slice(1,-1)))?t(a):n(a)}function o(a){return n(a)}}function tL(e,t,n){return r;function r(s){return e.enter("reference"),e.enter("referenceMarker"),e.consume(s),e.exit("referenceMarker"),i}function i(s){return s===93?(e.enter("referenceMarker"),e.consume(s),e.exit("referenceMarker"),e.exit("reference"),t):n(s)}}const nL={name:"labelStartImage",resolveAll:Mf.resolveAll,tokenize:rL};function rL(e,t,n){const r=this;return i;function i(a){return e.enter("labelImage"),e.enter("labelImageMarker"),e.consume(a),e.exit("labelImageMarker"),s}function s(a){return a===91?(e.enter("labelMarker"),e.consume(a),e.exit("labelMarker"),e.exit("labelImage"),o):n(a)}function o(a){return a===94&&"_hiddenFootnoteSupport"in r.parser.constructs?n(a):t(a)}}const iL={name:"labelStartLink",resolveAll:Mf.resolveAll,tokenize:sL};function sL(e,t,n){const r=this;return i;function i(o){return e.enter("labelLink"),e.enter("labelMarker"),e.consume(o),e.exit("labelMarker"),e.exit("labelLink"),s}function s(o){return o===94&&"_hiddenFootnoteSupport"in r.parser.constructs?n(o):t(o)}}const oc={name:"lineEnding",tokenize:oL};function oL(e,t){return n;function n(r){return e.enter("lineEnding"),e.consume(r),e.exit("lineEnding"),se(e,t,"linePrefix")}}const Na={name:"thematicBreak",tokenize:aL};function aL(e,t,n){let r=0,i;return s;function s(u){return e.enter("thematicBreak"),o(u)}function o(u){return i=u,a(u)}function a(u){return u===i?(e.enter("thematicBreakSequence"),l(u)):r>=3&&(u===null||G(u))?(e.exit("thematicBreak"),t(u)):n(u)}function l(u){return u===i?(e.consume(u),r++,l):(e.exit("thematicBreakSequence"),te(u)?se(e,a,"whitespace")(u):a(u))}}const it={continuation:{tokenize:dL},exit:fL,name:"list",tokenize:cL},lL={partial:!0,tokenize:pL},uL={partial:!0,tokenize:hL};function cL(e,t,n){const r=this,i=r.events[r.events.length-1];let s=i&&i[1].type==="linePrefix"?i[2].sliceSerialize(i[1],!0).length:0,o=0;return a;function a(f){const p=r.containerState.type||(f===42||f===43||f===45?"listUnordered":"listOrdered");if(p==="listUnordered"?!r.containerState.marker||f===r.containerState.marker:Kd(f)){if(r.containerState.type||(r.containerState.type=p,e.enter(p,{_container:!0})),p==="listUnordered")return e.enter("listItemPrefix"),f===42||f===45?e.check(Na,n,u)(f):u(f);if(!r.interrupt||f===49)return e.enter("listItemPrefix"),e.enter("listItemValue"),l(f)}return n(f)}function l(f){return Kd(f)&&++o<10?(e.consume(f),l):(!r.interrupt||o<2)&&(r.containerState.marker?f===r.containerState.marker:f===41||f===46)?(e.exit("listItemValue"),u(f)):n(f)}function u(f){return e.enter("listItemMarker"),e.consume(f),e.exit("listItemMarker"),r.containerState.marker=r.containerState.marker||f,e.check(Io,r.interrupt?n:c,e.attempt(lL,h,d))}function c(f){return r.containerState.initialBlankLine=!0,s++,h(f)}function d(f){return te(f)?(e.enter("listItemPrefixWhitespace"),e.consume(f),e.exit("listItemPrefixWhitespace"),h):n(f)}function h(f){return r.containerState.size=s+r.sliceSerialize(e.exit("listItemPrefix"),!0).length,t(f)}}function dL(e,t,n){const r=this;return r.containerState._closeFlow=void 0,e.check(Io,i,s);function i(a){return r.containerState.furtherBlankLines=r.containerState.furtherBlankLines||r.containerState.initialBlankLine,se(e,t,"listItemIndent",r.containerState.size+1)(a)}function s(a){return r.containerState.furtherBlankLines||!te(a)?(r.containerState.furtherBlankLines=void 0,r.containerState.initialBlankLine=void 0,o(a)):(r.containerState.furtherBlankLines=void 0,r.containerState.initialBlankLine=void 0,e.attempt(uL,t,o)(a))}function o(a){return r.containerState._closeFlow=!0,r.interrupt=void 0,se(e,e.attempt(it,t,n),"linePrefix",r.parser.constructs.disable.null.includes("codeIndented")?void 0:4)(a)}}function hL(e,t,n){const r=this;return se(e,i,"listItemIndent",r.containerState.size+1);function i(s){const o=r.events[r.events.length-1];return o&&o[1].type==="listItemIndent"&&o[2].sliceSerialize(o[1],!0).length===r.containerState.size?t(s):n(s)}}function fL(e){e.exit(this.containerState.type)}function pL(e,t,n){const r=this;return se(e,i,"listItemPrefixWhitespace",r.parser.constructs.disable.null.includes("codeIndented")?void 0:5);function i(s){const o=r.events[r.events.length-1];return!te(s)&&o&&o[1].type==="listItemPrefixWhitespace"?t(s):n(s)}}const by={name:"setextUnderline",resolveTo:mL,tokenize:gL};function mL(e,t){let n=e.length,r,i,s;for(;n--;)if(e[n][0]==="enter"){if(e[n][1].type==="content"){r=n;break}e[n][1].type==="paragraph"&&(i=n)}else e[n][1].type==="content"&&e.splice(n,1),!s&&e[n][1].type==="definition"&&(s=n);const o={type:"setextHeading",start:{...e[r][1].start},end:{...e[e.length-1][1].end}};return e[i][1].type="setextHeadingText",s?(e.splice(i,0,["enter",o,t]),e.splice(s+1,0,["exit",e[r][1],t]),e[r][1].end={...e[s][1].end}):e[r][1]=o,e.push(["exit",o,t]),e}function gL(e,t,n){const r=this;let i;return s;function s(u){let c=r.events.length,d;for(;c--;)if(r.events[c][1].type!=="lineEnding"&&r.events[c][1].type!=="linePrefix"&&r.events[c][1].type!=="content"){d=r.events[c][1].type==="paragraph";break}return!r.parser.lazy[r.now().line]&&(r.interrupt||d)?(e.enter("setextHeadingLine"),i=u,o(u)):n(u)}function o(u){return e.enter("setextHeadingLineSequence"),a(u)}function a(u){return u===i?(e.consume(u),a):(e.exit("setextHeadingLineSequence"),te(u)?se(e,l,"lineSuffix")(u):l(u))}function l(u){return u===null||G(u)?(e.exit("setextHeadingLine"),t(u)):n(u)}}const yL={tokenize:vL};function vL(e){const t=this,n=e.attempt(Io,r,e.attempt(this.parser.constructs.flowInitial,i,se(e,e.attempt(this.parser.constructs.flow,i,e.attempt(SD,i)),"linePrefix")));return n;function r(s){if(s===null){e.consume(s);return}return e.enter("lineEndingBlank"),e.consume(s),e.exit("lineEndingBlank"),t.currentConstruct=void 0,n}function i(s){if(s===null){e.consume(s);return}return e.enter("lineEnding"),e.consume(s),e.exit("lineEnding"),t.currentConstruct=void 0,n}}const xL={resolveAll:H1()},wL=q1("string"),kL=q1("text");function q1(e){return{resolveAll:H1(e==="text"?bL:void 0),tokenize:t};function t(n){const r=this,i=this.parser.constructs[e],s=n.attempt(i,o,a);return o;function o(c){return u(c)?s(c):a(c)}function a(c){if(c===null){n.consume(c);return}return n.enter("data"),n.consume(c),l}function l(c){return u(c)?(n.exit("data"),s(c)):(n.consume(c),l)}function u(c){if(c===null)return!0;const d=i[c];let h=-1;if(d)for(;++h<d.length;){const f=d[h];if(!f.previous||f.previous.call(r,r.previous))return!0}return!1}}}function H1(e){return t;function t(n,r){let i=-1,s;for(;++i<=n.length;)s===void 0?n[i]&&n[i][1].type==="data"&&(s=i,i++):(!n[i]||n[i][1].type!=="data")&&(i!==s+2&&(n[s][1].end=n[i-1][1].end,n.splice(s+2,i-s-2),i=s+2),s=void 0);return e?e(n,r):n}}function bL(e,t){let n=0;for(;++n<=e.length;)if((n===e.length||e[n][1].type==="lineEnding")&&e[n-1][1].type==="data"){const r=e[n-1][1],i=t.sliceStream(r);let s=i.length,o=-1,a=0,l;for(;s--;){const u=i[s];if(typeof u=="string"){for(o=u.length;u.charCodeAt(o-1)===32;)a++,o--;if(o)break;o=-1}else if(u===-2)l=!0,a++;else if(u!==-1){s++;break}}if(t._contentTypeTextTrailing&&n===e.length&&(a=0),a){const u={type:n===e.length||l||a<2?"lineSuffix":"hardBreakTrailing",start:{_bufferIndex:s?o:r.start._bufferIndex+o,_index:r.start._index+s,line:r.end.line,column:r.end.column-a,offset:r.end.offset-a},end:{...r.end}};r.end={...u.start},r.start.offset===r.end.offset?Object.assign(r,u):(e.splice(n,0,["enter",u,t],["exit",u,t]),n+=2)}n++}return e}const SL={42:it,43:it,45:it,48:it,49:it,50:it,51:it,52:it,53:it,54:it,55:it,56:it,57:it,62:M1},_L={91:PD},CL={[-2]:sc,[-1]:sc,32:sc},EL={35:ID,42:Na,45:[by,Na],60:BD,61:by,95:Na,96:wy,126:wy},TL={38:F1,92:B1},PL={[-5]:oc,[-4]:oc,[-3]:oc,33:nL,38:F1,42:Jd,60:[iD,HD],91:iL,92:[ND,B1],93:Mf,95:Jd,96:yD},AL={null:[Jd,xL]},RL={null:[42,95]},OL={null:[]},NL=Object.freeze(Object.defineProperty({__proto__:null,attentionMarkers:RL,contentInitial:_L,disable:OL,document:SL,flow:EL,flowInitial:CL,insideSpan:AL,string:TL,text:PL},Symbol.toStringTag,{value:"Module"}));function jL(e,t,n){let r={_bufferIndex:-1,_index:0,line:n&&n.line||1,column:n&&n.column||1,offset:n&&n.offset||0};const i={},s=[];let o=[],a=[];const l={attempt:P(T),check:P(S),consume:g,enter:y,exit:k,interrupt:P(S,{interrupt:!0})},u={code:null,containerState:{},defineSkip:v,events:[],now:p,parser:e,previous:null,sliceSerialize:h,sliceStream:f,write:d};let c=t.tokenize.call(u,l);return t.resolveAll&&s.push(t),u;function d(L){return o=Ot(o,L),w(),o[o.length-1]!==null?[]:(A(t,0),u.events=su(s,u.events,u),u.events)}function h(L,B){return DL(f(L),B)}function f(L){return IL(o,L)}function p(){const{_bufferIndex:L,_index:B,line:K,column:J,offset:M}=r;return{_bufferIndex:L,_index:B,line:K,column:J,offset:M}}function v(L){i[L.line]=L.column,E()}function w(){let L;for(;r._index<o.length;){const B=o[r._index];if(typeof B=="string")for(L=r._index,r._bufferIndex<0&&(r._bufferIndex=0);r._index===L&&r._bufferIndex<B.length;)m(B.charCodeAt(r._bufferIndex));else m(B)}}function m(L){c=c(L)}function g(L){G(L)?(r.line++,r.column=1,r.offset+=L===-3?2:1,E()):L!==-1&&(r.column++,r.offset++),r._bufferIndex<0?r._index++:(r._bufferIndex++,r._bufferIndex===o[r._index].length&&(r._bufferIndex=-1,r._index++)),u.previous=L}function y(L,B){const K=B||{};return K.type=L,K.start=p(),u.events.push(["enter",K,u]),a.push(K),K}function k(L){const B=a.pop();return B.end=p(),u.events.push(["exit",B,u]),B}function T(L,B){A(L,B.from)}function S(L,B){B.restore()}function P(L,B){return K;function K(J,M,U){let X,I,$,_;return Array.isArray(J)?q(J):"tokenize"in J?q([J]):N(J);function N(re){return Qe;function Qe(Ct){const Jt=Ct!==null&&re[Ct],Lt=Ct!==null&&re.null,Et=[...Array.isArray(Jt)?Jt:Jt?[Jt]:[],...Array.isArray(Lt)?Lt:Lt?[Lt]:[]];return q(Et)(Ct)}}function q(re){return X=re,I=0,re.length===0?U:b(re[I])}function b(re){return Qe;function Qe(Ct){return _=O(),$=re,re.partial||(u.currentConstruct=re),re.name&&u.parser.constructs.disable.null.includes(re.name)?de():re.tokenize.call(B?Object.assign(Object.create(u),B):u,l,ee,de)(Ct)}}function ee(re){return L($,_),M}function de(re){return _.restore(),++I<X.length?b(X[I]):U}}}function A(L,B){L.resolveAll&&!s.includes(L)&&s.push(L),L.resolve&&wt(u.events,B,u.events.length-B,L.resolve(u.events.slice(B),u)),L.resolveTo&&(u.events=L.resolveTo(u.events,u))}function O(){const L=p(),B=u.previous,K=u.currentConstruct,J=u.events.length,M=Array.from(a);return{from:J,restore:U};function U(){r=L,u.previous=B,u.currentConstruct=K,u.events.length=J,a=M,E()}}function E(){r.line in i&&r.column<2&&(r.column=i[r.line],r.offset+=i[r.line]-1)}}function IL(e,t){const n=t.start._index,r=t.start._bufferIndex,i=t.end._index,s=t.end._bufferIndex;let o;if(n===i)o=[e[n].slice(r,s)];else{if(o=e.slice(n,i),r>-1){const a=o[0];typeof a=="string"?o[0]=a.slice(r):o.shift()}s>0&&o.push(e[i].slice(0,s))}return o}function DL(e,t){let n=-1;const r=[];let i;for(;++n<e.length;){const s=e[n];let o;if(typeof s=="string")o=s;else switch(s){case-5:{o="\r";break}case-4:{o=`
`;break}case-3:{o=`\r
`;break}case-2:{o=t?" ":"	";break}case-1:{if(!t&&i)continue;o=" ";break}default:o=String.fromCharCode(s)}i=s===-2,r.push(o)}return r.join("")}function LL(e){const r={constructs:D1([NL,...(e||{}).extensions||[]]),content:i(XI),defined:[],document:i(ZI),flow:i(yL),lazy:{},string:i(wL),text:i(kL)};return r;function i(s){return o;function o(a){return jL(r,s,a)}}}function ML(e){for(;!$1(e););return e}const Sy=/[\0\t\n\r]/g;function BL(){let e=1,t="",n=!0,r;return i;function i(s,o,a){const l=[];let u,c,d,h,f;for(s=t+(typeof s=="string"?s.toString():new TextDecoder(o||void 0).decode(s)),d=0,t="",n&&(s.charCodeAt(0)===65279&&d++,n=void 0);d<s.length;){if(Sy.lastIndex=d,u=Sy.exec(s),h=u&&u.index!==void 0?u.index:s.length,f=s.charCodeAt(h),!u){t=s.slice(d);break}if(f===10&&d===h&&r)l.push(-3),r=void 0;else switch(r&&(l.push(-5),r=void 0),d<h&&(l.push(s.slice(d,h)),e+=h-d),f){case 0:{l.push(65533),e++;break}case 9:{for(c=Math.ceil(e/4)*4,l.push(-2);e++<c;)l.push(-1);break}case 10:{l.push(-4),e=1;break}default:r=!0,e=1}d=h+1}return a&&(r&&l.push(-5),t&&l.push(t),l.push(null)),l}}const FL=/\\([!-/:-@[-`{-~])|&(#(?:\d{1,7}|x[\da-f]{1,6})|[\da-z]{1,31});/gi;function $L(e){return e.replace(FL,UL)}function UL(e,t,n){if(t)return t;if(n.charCodeAt(0)===35){const i=n.charCodeAt(1),s=i===120||i===88;return L1(n.slice(s?2:1),s?16:10)}return Lf(n)||e}const W1={}.hasOwnProperty;function VL(e,t,n){return t&&typeof t=="object"&&(n=t,t=void 0),zL(n)(ML(LL(n).document().write(BL()(e,t,!0))))}function zL(e){const t={transforms:[],canContainEols:["emphasis","fragment","heading","paragraph","strong"],enter:{autolink:s(Xf),autolinkProtocol:O,autolinkEmail:O,atxHeading:s(Kf),blockQuote:s(Lt),characterEscape:O,characterReference:O,codeFenced:s(Et),codeFencedFenceInfo:o,codeFencedFenceMeta:o,codeIndented:s(Et,o),codeText:s(Gf,o),codeTextData:O,data:O,codeFlowValue:O,definition:s(Ek),definitionDestinationString:o,definitionLabelString:o,definitionTitleString:o,emphasis:s(Tk),hardBreakEscape:s(Jf),hardBreakTrailing:s(Jf),htmlFlow:s(Qf,o),htmlFlowData:O,htmlText:s(Qf,o),htmlTextData:O,image:s(Pk),label:o,link:s(Xf),listItem:s(Ak),listItemValue:h,listOrdered:s(Yf,d),listUnordered:s(Yf),paragraph:s(Rk),reference:b,referenceString:o,resourceDestinationString:o,resourceTitleString:o,setextHeading:s(Kf),strong:s(Ok),thematicBreak:s(jk)},exit:{atxHeading:l(),atxHeadingSequence:T,autolink:l(),autolinkEmail:Jt,autolinkProtocol:Ct,blockQuote:l(),characterEscapeValue:E,characterReferenceMarkerHexadecimal:de,characterReferenceMarkerNumeric:de,characterReferenceValue:re,characterReference:Qe,codeFenced:l(w),codeFencedFence:v,codeFencedFenceInfo:f,codeFencedFenceMeta:p,codeFlowValue:E,codeIndented:l(m),codeText:l(M),codeTextData:E,data:E,definition:l(),definitionDestinationString:k,definitionLabelString:g,definitionTitleString:y,emphasis:l(),hardBreakEscape:l(B),hardBreakTrailing:l(B),htmlFlow:l(K),htmlFlowData:E,htmlText:l(J),htmlTextData:E,image:l(X),label:$,labelText:I,lineEnding:L,link:l(U),listItem:l(),listOrdered:l(),listUnordered:l(),paragraph:l(),referenceString:ee,resourceDestinationString:_,resourceTitleString:N,resource:q,setextHeading:l(A),setextHeadingLineSequence:P,setextHeadingText:S,strong:l(),thematicBreak:l()}};G1(t,(e||{}).mdastExtensions||[]);const n={};return r;function r(R){let F={type:"root",children:[]};const Y={stack:[F],tokenStack:[],config:t,enter:a,exit:u,buffer:o,resume:c,data:n},ie=[];let ue=-1;for(;++ue<R.length;)if(R[ue][1].type==="listOrdered"||R[ue][1].type==="listUnordered")if(R[ue][0]==="enter")ie.push(ue);else{const Mt=ie.pop();ue=i(R,Mt,ue)}for(ue=-1;++ue<R.length;){const Mt=t[R[ue][0]];W1.call(Mt,R[ue][1].type)&&Mt[R[ue][1].type].call(Object.assign({sliceSerialize:R[ue][2].sliceSerialize},Y),R[ue][1])}if(Y.tokenStack.length>0){const Mt=Y.tokenStack[Y.tokenStack.length-1];(Mt[1]||_y).call(Y,void 0,Mt[0])}for(F.position={start:jn(R.length>0?R[0][1].start:{line:1,column:1,offset:0}),end:jn(R.length>0?R[R.length-2][1].end:{line:1,column:1,offset:0})},ue=-1;++ue<t.transforms.length;)F=t.transforms[ue](F)||F;return F}function i(R,F,Y){let ie=F-1,ue=-1,Mt=!1,hr,dn,Yi,Zi;for(;++ie<=Y;){const ht=R[ie];switch(ht[1].type){case"listUnordered":case"listOrdered":case"blockQuote":{ht[0]==="enter"?ue++:ue--,Zi=void 0;break}case"lineEndingBlank":{ht[0]==="enter"&&(hr&&!Zi&&!ue&&!Yi&&(Yi=ie),Zi=void 0);break}case"linePrefix":case"listItemValue":case"listItemMarker":case"listItemPrefix":case"listItemPrefixWhitespace":break;default:Zi=void 0}if(!ue&&ht[0]==="enter"&&ht[1].type==="listItemPrefix"||ue===-1&&ht[0]==="exit"&&(ht[1].type==="listUnordered"||ht[1].type==="listOrdered")){if(hr){let Wr=ie;for(dn=void 0;Wr--;){const hn=R[Wr];if(hn[1].type==="lineEnding"||hn[1].type==="lineEndingBlank"){if(hn[0]==="exit")continue;dn&&(R[dn][1].type="lineEndingBlank",Mt=!0),hn[1].type="lineEnding",dn=Wr}else if(!(hn[1].type==="linePrefix"||hn[1].type==="blockQuotePrefix"||hn[1].type==="blockQuotePrefixWhitespace"||hn[1].type==="blockQuoteMarker"||hn[1].type==="listItemIndent"))break}Yi&&(!dn||Yi<dn)&&(hr._spread=!0),hr.end=Object.assign({},dn?R[dn][1].start:ht[1].end),R.splice(dn||ie,0,["exit",hr,ht[2]]),ie++,Y++}if(ht[1].type==="listItemPrefix"){const Wr={type:"listItem",_spread:!1,start:Object.assign({},ht[1].start),end:void 0};hr=Wr,R.splice(ie,0,["enter",Wr,ht[2]]),ie++,Y++,Yi=void 0,Zi=!0}}}return R[F][1]._spread=Mt,Y}function s(R,F){return Y;function Y(ie){a.call(this,R(ie),ie),F&&F.call(this,ie)}}function o(){this.stack.push({type:"fragment",children:[]})}function a(R,F,Y){this.stack[this.stack.length-1].children.push(R),this.stack.push(R),this.tokenStack.push([F,Y||void 0]),R.position={start:jn(F.start),end:void 0}}function l(R){return F;function F(Y){R&&R.call(this,Y),u.call(this,Y)}}function u(R,F){const Y=this.stack.pop(),ie=this.tokenStack.pop();if(ie)ie[0].type!==R.type&&(F?F.call(this,R,ie[0]):(ie[1]||_y).call(this,R,ie[0]));else throw new Error("Cannot close `"+R.type+"` ("+$s({start:R.start,end:R.end})+"): it’s not open");Y.position.end=jn(R.end)}function c(){return Df(this.stack.pop())}function d(){this.data.expectingFirstListItemValue=!0}function h(R){if(this.data.expectingFirstListItemValue){const F=this.stack[this.stack.length-2];F.start=Number.parseInt(this.sliceSerialize(R),10),this.data.expectingFirstListItemValue=void 0}}function f(){const R=this.resume(),F=this.stack[this.stack.length-1];F.lang=R}function p(){const R=this.resume(),F=this.stack[this.stack.length-1];F.meta=R}function v(){this.data.flowCodeInside||(this.buffer(),this.data.flowCodeInside=!0)}function w(){const R=this.resume(),F=this.stack[this.stack.length-1];F.value=R.replace(/^(\r?\n|\r)|(\r?\n|\r)$/g,""),this.data.flowCodeInside=void 0}function m(){const R=this.resume(),F=this.stack[this.stack.length-1];F.value=R.replace(/(\r?\n|\r)$/g,"")}function g(R){const F=this.resume(),Y=this.stack[this.stack.length-1];Y.label=F,Y.identifier=Gt(this.sliceSerialize(R)).toLowerCase()}function y(){const R=this.resume(),F=this.stack[this.stack.length-1];F.title=R}function k(){const R=this.resume(),F=this.stack[this.stack.length-1];F.url=R}function T(R){const F=this.stack[this.stack.length-1];if(!F.depth){const Y=this.sliceSerialize(R).length;F.depth=Y}}function S(){this.data.setextHeadingSlurpLineEnding=!0}function P(R){const F=this.stack[this.stack.length-1];F.depth=this.sliceSerialize(R).codePointAt(0)===61?1:2}function A(){this.data.setextHeadingSlurpLineEnding=void 0}function O(R){const Y=this.stack[this.stack.length-1].children;let ie=Y[Y.length-1];(!ie||ie.type!=="text")&&(ie=Nk(),ie.position={start:jn(R.start),end:void 0},Y.push(ie)),this.stack.push(ie)}function E(R){const F=this.stack.pop();F.value+=this.sliceSerialize(R),F.position.end=jn(R.end)}function L(R){const F=this.stack[this.stack.length-1];if(this.data.atHardBreak){const Y=F.children[F.children.length-1];Y.position.end=jn(R.end),this.data.atHardBreak=void 0;return}!this.data.setextHeadingSlurpLineEnding&&t.canContainEols.includes(F.type)&&(O.call(this,R),E.call(this,R))}function B(){this.data.atHardBreak=!0}function K(){const R=this.resume(),F=this.stack[this.stack.length-1];F.value=R}function J(){const R=this.resume(),F=this.stack[this.stack.length-1];F.value=R}function M(){const R=this.resume(),F=this.stack[this.stack.length-1];F.value=R}function U(){const R=this.stack[this.stack.length-1];if(this.data.inReference){const F=this.data.referenceType||"shortcut";R.type+="Reference",R.referenceType=F,delete R.url,delete R.title}else delete R.identifier,delete R.label;this.data.referenceType=void 0}function X(){const R=this.stack[this.stack.length-1];if(this.data.inReference){const F=this.data.referenceType||"shortcut";R.type+="Reference",R.referenceType=F,delete R.url,delete R.title}else delete R.identifier,delete R.label;this.data.referenceType=void 0}function I(R){const F=this.sliceSerialize(R),Y=this.stack[this.stack.length-2];Y.label=$L(F),Y.identifier=Gt(F).toLowerCase()}function $(){const R=this.stack[this.stack.length-1],F=this.resume(),Y=this.stack[this.stack.length-1];if(this.data.inReference=!0,Y.type==="link"){const ie=R.children;Y.children=ie}else Y.alt=F}function _(){const R=this.resume(),F=this.stack[this.stack.length-1];F.url=R}function N(){const R=this.resume(),F=this.stack[this.stack.length-1];F.title=R}function q(){this.data.inReference=void 0}function b(){this.data.referenceType="collapsed"}function ee(R){const F=this.resume(),Y=this.stack[this.stack.length-1];Y.label=F,Y.identifier=Gt(this.sliceSerialize(R)).toLowerCase(),this.data.referenceType="full"}function de(R){this.data.characterReferenceType=R.type}function re(R){const F=this.sliceSerialize(R),Y=this.data.characterReferenceType;let ie;Y?(ie=L1(F,Y==="characterReferenceMarkerNumeric"?10:16),this.data.characterReferenceType=void 0):ie=Lf(F);const ue=this.stack[this.stack.length-1];ue.value+=ie}function Qe(R){const F=this.stack.pop();F.position.end=jn(R.end)}function Ct(R){E.call(this,R);const F=this.stack[this.stack.length-1];F.url=this.sliceSerialize(R)}function Jt(R){E.call(this,R);const F=this.stack[this.stack.length-1];F.url="mailto:"+this.sliceSerialize(R)}function Lt(){return{type:"blockquote",children:[]}}function Et(){return{type:"code",lang:null,meta:null,value:""}}function Gf(){return{type:"inlineCode",value:""}}function Ek(){return{type:"definition",identifier:"",label:null,title:null,url:""}}function Tk(){return{type:"emphasis",children:[]}}function Kf(){return{type:"heading",depth:0,children:[]}}function Jf(){return{type:"break"}}function Qf(){return{type:"html",value:""}}function Pk(){return{type:"image",title:null,url:"",alt:null}}function Xf(){return{type:"link",title:null,url:"",children:[]}}function Yf(R){return{type:"list",ordered:R.type==="listOrdered",start:null,spread:R._spread,children:[]}}function Ak(R){return{type:"listItem",spread:R._spread,checked:null,children:[]}}function Rk(){return{type:"paragraph",children:[]}}function Ok(){return{type:"strong",children:[]}}function Nk(){return{type:"text",value:""}}function jk(){return{type:"thematicBreak"}}}function jn(e){return{line:e.line,column:e.column,offset:e.offset}}function G1(e,t){let n=-1;for(;++n<t.length;){const r=t[n];Array.isArray(r)?G1(e,r):qL(e,r)}}function qL(e,t){let n;for(n in t)if(W1.call(t,n))switch(n){case"canContainEols":{const r=t[n];r&&e[n].push(...r);break}case"transforms":{const r=t[n];r&&e[n].push(...r);break}case"enter":case"exit":{const r=t[n];r&&Object.assign(e[n],r);break}}}function _y(e,t){throw e?new Error("Cannot close `"+e.type+"` ("+$s({start:e.start,end:e.end})+"): a different token (`"+t.type+"`, "+$s({start:t.start,end:t.end})+") is open"):new Error("Cannot close document, a token (`"+t.type+"`, "+$s({start:t.start,end:t.end})+") is still open")}function HL(e){const t=this;t.parser=n;function n(r){return VL(r,{...t.data("settings"),...e,extensions:t.data("micromarkExtensions")||[],mdastExtensions:t.data("fromMarkdownExtensions")||[]})}}function WL(e,t){const n={type:"element",tagName:"blockquote",properties:{},children:e.wrap(e.all(t),!0)};return e.patch(t,n),e.applyData(t,n)}function GL(e,t){const n={type:"element",tagName:"br",properties:{},children:[]};return e.patch(t,n),[e.applyData(t,n),{type:"text",value:`
`}]}function KL(e,t){const n=t.value?t.value+`
`:"",r={},i=t.lang?t.lang.split(/\s+/):[];i.length>0&&(r.className=["language-"+i[0]]);let s={type:"element",tagName:"code",properties:r,children:[{type:"text",value:n}]};return t.meta&&(s.data={meta:t.meta}),e.patch(t,s),s=e.applyData(t,s),s={type:"element",tagName:"pre",properties:{},children:[s]},e.patch(t,s),s}function JL(e,t){const n={type:"element",tagName:"del",properties:{},children:e.all(t)};return e.patch(t,n),e.applyData(t,n)}function QL(e,t){const n={type:"element",tagName:"em",properties:{},children:e.all(t)};return e.patch(t,n),e.applyData(t,n)}function XL(e,t){const n=typeof e.options.clobberPrefix=="string"?e.options.clobberPrefix:"user-content-",r=String(t.identifier).toUpperCase(),i=Xi(r.toLowerCase()),s=e.footnoteOrder.indexOf(r);let o,a=e.footnoteCounts.get(r);a===void 0?(a=0,e.footnoteOrder.push(r),o=e.footnoteOrder.length):o=s+1,a+=1,e.footnoteCounts.set(r,a);const l={type:"element",tagName:"a",properties:{href:"#"+n+"fn-"+i,id:n+"fnref-"+i+(a>1?"-"+a:""),dataFootnoteRef:!0,ariaDescribedBy:["footnote-label"]},children:[{type:"text",value:String(o)}]};e.patch(t,l);const u={type:"element",tagName:"sup",properties:{},children:[l]};return e.patch(t,u),e.applyData(t,u)}function YL(e,t){const n={type:"element",tagName:"h"+t.depth,properties:{},children:e.all(t)};return e.patch(t,n),e.applyData(t,n)}function ZL(e,t){if(e.options.allowDangerousHtml){const n={type:"raw",value:t.value};return e.patch(t,n),e.applyData(t,n)}}function K1(e,t){const n=t.referenceType;let r="]";if(n==="collapsed"?r+="[]":n==="full"&&(r+="["+(t.label||t.identifier)+"]"),t.type==="imageReference")return[{type:"text",value:"!["+t.alt+r}];const i=e.all(t),s=i[0];s&&s.type==="text"?s.value="["+s.value:i.unshift({type:"text",value:"["});const o=i[i.length-1];return o&&o.type==="text"?o.value+=r:i.push({type:"text",value:r}),i}function eM(e,t){const n=String(t.identifier).toUpperCase(),r=e.definitionById.get(n);if(!r)return K1(e,t);const i={src:Xi(r.url||""),alt:t.alt};r.title!==null&&r.title!==void 0&&(i.title=r.title);const s={type:"element",tagName:"img",properties:i,children:[]};return e.patch(t,s),e.applyData(t,s)}function tM(e,t){const n={src:Xi(t.url)};t.alt!==null&&t.alt!==void 0&&(n.alt=t.alt),t.title!==null&&t.title!==void 0&&(n.title=t.title);const r={type:"element",tagName:"img",properties:n,children:[]};return e.patch(t,r),e.applyData(t,r)}function nM(e,t){const n={type:"text",value:t.value.replace(/\r?\n|\r/g," ")};e.patch(t,n);const r={type:"element",tagName:"code",properties:{},children:[n]};return e.patch(t,r),e.applyData(t,r)}function rM(e,t){const n=String(t.identifier).toUpperCase(),r=e.definitionById.get(n);if(!r)return K1(e,t);const i={href:Xi(r.url||"")};r.title!==null&&r.title!==void 0&&(i.title=r.title);const s={type:"element",tagName:"a",properties:i,children:e.all(t)};return e.patch(t,s),e.applyData(t,s)}function iM(e,t){const n={href:Xi(t.url)};t.title!==null&&t.title!==void 0&&(n.title=t.title);const r={type:"element",tagName:"a",properties:n,children:e.all(t)};return e.patch(t,r),e.applyData(t,r)}function sM(e,t,n){const r=e.all(t),i=n?oM(n):J1(t),s={},o=[];if(typeof t.checked=="boolean"){const c=r[0];let d;c&&c.type==="element"&&c.tagName==="p"?d=c:(d={type:"element",tagName:"p",properties:{},children:[]},r.unshift(d)),d.children.length>0&&d.children.unshift({type:"text",value:" "}),d.children.unshift({type:"element",tagName:"input",properties:{type:"checkbox",checked:t.checked,disabled:!0},children:[]}),s.className=["task-list-item"]}let a=-1;for(;++a<r.length;){const c=r[a];(i||a!==0||c.type!=="element"||c.tagName!=="p")&&o.push({type:"text",value:`
`}),c.type==="element"&&c.tagName==="p"&&!i?o.push(...c.children):o.push(c)}const l=r[r.length-1];l&&(i||l.type!=="element"||l.tagName!=="p")&&o.push({type:"text",value:`
`});const u={type:"element",tagName:"li",properties:s,children:o};return e.patch(t,u),e.applyData(t,u)}function oM(e){let t=!1;if(e.type==="list"){t=e.spread||!1;const n=e.children;let r=-1;for(;!t&&++r<n.length;)t=J1(n[r])}return t}function J1(e){const t=e.spread;return t??e.children.length>1}function aM(e,t){const n={},r=e.all(t);let i=-1;for(typeof t.start=="number"&&t.start!==1&&(n.start=t.start);++i<r.length;){const o=r[i];if(o.type==="element"&&o.tagName==="li"&&o.properties&&Array.isArray(o.properties.className)&&o.properties.className.includes("task-list-item")){n.className=["contains-task-list"];break}}const s={type:"element",tagName:t.ordered?"ol":"ul",properties:n,children:e.wrap(r,!0)};return e.patch(t,s),e.applyData(t,s)}function lM(e,t){const n={type:"element",tagName:"p",properties:{},children:e.all(t)};return e.patch(t,n),e.applyData(t,n)}function uM(e,t){const n={type:"root",children:e.wrap(e.all(t))};return e.patch(t,n),e.applyData(t,n)}function cM(e,t){const n={type:"element",tagName:"strong",properties:{},children:e.all(t)};return e.patch(t,n),e.applyData(t,n)}function dM(e,t){const n=e.all(t),r=n.shift(),i=[];if(r){const o={type:"element",tagName:"thead",properties:{},children:e.wrap([r],!0)};e.patch(t.children[0],o),i.push(o)}if(n.length>0){const o={type:"element",tagName:"tbody",properties:{},children:e.wrap(n,!0)},a=Of(t.children[1]),l=P1(t.children[t.children.length-1]);a&&l&&(o.position={start:a,end:l}),i.push(o)}const s={type:"element",tagName:"table",properties:{},children:e.wrap(i,!0)};return e.patch(t,s),e.applyData(t,s)}function hM(e,t,n){const r=n?n.children:void 0,s=(r?r.indexOf(t):1)===0?"th":"td",o=n&&n.type==="table"?n.align:void 0,a=o?o.length:t.children.length;let l=-1;const u=[];for(;++l<a;){const d=t.children[l],h={},f=o?o[l]:void 0;f&&(h.align=f);let p={type:"element",tagName:s,properties:h,children:[]};d&&(p.children=e.all(d),e.patch(d,p),p=e.applyData(d,p)),u.push(p)}const c={type:"element",tagName:"tr",properties:{},children:e.wrap(u,!0)};return e.patch(t,c),e.applyData(t,c)}function fM(e,t){const n={type:"element",tagName:"td",properties:{},children:e.all(t)};return e.patch(t,n),e.applyData(t,n)}const Cy=9,Ey=32;function pM(e){const t=String(e),n=/\r?\n|\r/g;let r=n.exec(t),i=0;const s=[];for(;r;)s.push(Ty(t.slice(i,r.index),i>0,!0),r[0]),i=r.index+r[0].length,r=n.exec(t);return s.push(Ty(t.slice(i),i>0,!1)),s.join("")}function Ty(e,t,n){let r=0,i=e.length;if(t){let s=e.codePointAt(r);for(;s===Cy||s===Ey;)r++,s=e.codePointAt(r)}if(n){let s=e.codePointAt(i-1);for(;s===Cy||s===Ey;)i--,s=e.codePointAt(i-1)}return i>r?e.slice(r,i):""}function mM(e,t){const n={type:"text",value:pM(String(t.value))};return e.patch(t,n),e.applyData(t,n)}function gM(e,t){const n={type:"element",tagName:"hr",properties:{},children:[]};return e.patch(t,n),e.applyData(t,n)}const yM={blockquote:WL,break:GL,code:KL,delete:JL,emphasis:QL,footnoteReference:XL,heading:YL,html:ZL,imageReference:eM,image:tM,inlineCode:nM,linkReference:rM,link:iM,listItem:sM,list:aM,paragraph:lM,root:uM,strong:cM,table:dM,tableCell:fM,tableRow:hM,text:mM,thematicBreak:gM,toml:fa,yaml:fa,definition:fa,footnoteDefinition:fa};function fa(){}const Q1=-1,ou=0,Vs=1,bl=2,Bf=3,Ff=4,$f=5,Uf=6,X1=7,Y1=8,Py=typeof self=="object"?self:globalThis,vM=(e,t)=>{const n=(i,s)=>(e.set(s,i),i),r=i=>{if(e.has(i))return e.get(i);const[s,o]=t[i];switch(s){case ou:case Q1:return n(o,i);case Vs:{const a=n([],i);for(const l of o)a.push(r(l));return a}case bl:{const a=n({},i);for(const[l,u]of o)a[r(l)]=r(u);return a}case Bf:return n(new Date(o),i);case Ff:{const{source:a,flags:l}=o;return n(new RegExp(a,l),i)}case $f:{const a=n(new Map,i);for(const[l,u]of o)a.set(r(l),r(u));return a}case Uf:{const a=n(new Set,i);for(const l of o)a.add(r(l));return a}case X1:{const{name:a,message:l}=o;return n(new Py[a](l),i)}case Y1:return n(BigInt(o),i);case"BigInt":return n(Object(BigInt(o)),i);case"ArrayBuffer":return n(new Uint8Array(o).buffer,o);case"DataView":{const{buffer:a}=new Uint8Array(o);return n(new DataView(a),o)}}return n(new Py[s](o),i)};return r},Ay=e=>vM(new Map,e)(0),ti="",{toString:xM}={},{keys:wM}=Object,hs=e=>{const t=typeof e;if(t!=="object"||!e)return[ou,t];const n=xM.call(e).slice(8,-1);switch(n){case"Array":return[Vs,ti];case"Object":return[bl,ti];case"Date":return[Bf,ti];case"RegExp":return[Ff,ti];case"Map":return[$f,ti];case"Set":return[Uf,ti];case"DataView":return[Vs,n]}return n.includes("Array")?[Vs,n]:n.includes("Error")?[X1,n]:[bl,n]},pa=([e,t])=>e===ou&&(t==="function"||t==="symbol"),kM=(e,t,n,r)=>{const i=(o,a)=>{const l=r.push(o)-1;return n.set(a,l),l},s=o=>{if(n.has(o))return n.get(o);let[a,l]=hs(o);switch(a){case ou:{let c=o;switch(l){case"bigint":a=Y1,c=o.toString();break;case"function":case"symbol":if(e)throw new TypeError("unable to serialize "+l);c=null;break;case"undefined":return i([Q1],o)}return i([a,c],o)}case Vs:{if(l){let h=o;return l==="DataView"?h=new Uint8Array(o.buffer):l==="ArrayBuffer"&&(h=new Uint8Array(o)),i([l,[...h]],o)}const c=[],d=i([a,c],o);for(const h of o)c.push(s(h));return d}case bl:{if(l)switch(l){case"BigInt":return i([l,o.toString()],o);case"Boolean":case"Number":case"String":return i([l,o.valueOf()],o)}if(t&&"toJSON"in o)return s(o.toJSON());const c=[],d=i([a,c],o);for(const h of wM(o))(e||!pa(hs(o[h])))&&c.push([s(h),s(o[h])]);return d}case Bf:return i([a,o.toISOString()],o);case Ff:{const{source:c,flags:d}=o;return i([a,{source:c,flags:d}],o)}case $f:{const c=[],d=i([a,c],o);for(const[h,f]of o)(e||!(pa(hs(h))||pa(hs(f))))&&c.push([s(h),s(f)]);return d}case Uf:{const c=[],d=i([a,c],o);for(const h of o)(e||!pa(hs(h)))&&c.push(s(h));return d}}const{message:u}=o;return i([a,{name:l,message:u}],o)};return s},Ry=(e,{json:t,lossy:n}={})=>{const r=[];return kM(!(t||n),!!t,new Map,r)(e),r},Sl=typeof structuredClone=="function"?(e,t)=>t&&("json"in t||"lossy"in t)?Ay(Ry(e,t)):structuredClone(e):(e,t)=>Ay(Ry(e,t));function bM(e,t){const n=[{type:"text",value:"↩"}];return t>1&&n.push({type:"element",tagName:"sup",properties:{},children:[{type:"text",value:String(t)}]}),n}function SM(e,t){return"Back to reference "+(e+1)+(t>1?"-"+t:"")}function _M(e){const t=typeof e.options.clobberPrefix=="string"?e.options.clobberPrefix:"user-content-",n=e.options.footnoteBackContent||bM,r=e.options.footnoteBackLabel||SM,i=e.options.footnoteLabel||"Footnotes",s=e.options.footnoteLabelTagName||"h2",o=e.options.footnoteLabelProperties||{className:["sr-only"]},a=[];let l=-1;for(;++l<e.footnoteOrder.length;){const u=e.footnoteById.get(e.footnoteOrder[l]);if(!u)continue;const c=e.all(u),d=String(u.identifier).toUpperCase(),h=Xi(d.toLowerCase());let f=0;const p=[],v=e.footnoteCounts.get(d);for(;v!==void 0&&++f<=v;){p.length>0&&p.push({type:"text",value:" "});let g=typeof n=="string"?n:n(l,f);typeof g=="string"&&(g={type:"text",value:g}),p.push({type:"element",tagName:"a",properties:{href:"#"+t+"fnref-"+h+(f>1?"-"+f:""),dataFootnoteBackref:"",ariaLabel:typeof r=="string"?r:r(l,f),className:["data-footnote-backref"]},children:Array.isArray(g)?g:[g]})}const w=c[c.length-1];if(w&&w.type==="element"&&w.tagName==="p"){const g=w.children[w.children.length-1];g&&g.type==="text"?g.value+=" ":w.children.push({type:"text",value:" "}),w.children.push(...p)}else c.push(...p);const m={type:"element",tagName:"li",properties:{id:t+"fn-"+h},children:e.wrap(c,!0)};e.patch(u,m),a.push(m)}if(a.length!==0)return{type:"element",tagName:"section",properties:{dataFootnotes:!0,className:["footnotes"]},children:[{type:"element",tagName:s,properties:{...Sl(o),id:"footnote-label"},children:[{type:"text",value:i}]},{type:"text",value:`
`},{type:"element",tagName:"ol",properties:{},children:e.wrap(a,!0)},{type:"text",value:`
`}]}}const au=function(e){if(e==null)return PM;if(typeof e=="function")return lu(e);if(typeof e=="object")return Array.isArray(e)?CM(e):EM(e);if(typeof e=="string")return TM(e);throw new Error("Expected function, string, or object as test")};function CM(e){const t=[];let n=-1;for(;++n<e.length;)t[n]=au(e[n]);return lu(r);function r(...i){let s=-1;for(;++s<t.length;)if(t[s].apply(this,i))return!0;return!1}}function EM(e){const t=e;return lu(n);function n(r){const i=r;let s;for(s in e)if(i[s]!==t[s])return!1;return!0}}function TM(e){return lu(t);function t(n){return n&&n.type===e}}function lu(e){return t;function t(n,r,i){return!!(AM(n)&&e.call(this,n,typeof r=="number"?r:void 0,i||void 0))}}function PM(){return!0}function AM(e){return e!==null&&typeof e=="object"&&"type"in e}const Z1=[],RM=!0,Qd=!1,OM="skip";function ek(e,t,n,r){let i;typeof t=="function"&&typeof n!="function"?(r=n,n=t):i=t;const s=au(i),o=r?-1:1;a(e,void 0,[])();function a(l,u,c){const d=l&&typeof l=="object"?l:{};if(typeof d.type=="string"){const f=typeof d.tagName=="string"?d.tagName:typeof d.name=="string"?d.name:void 0;Object.defineProperty(h,"name",{value:"node ("+(l.type+(f?"<"+f+">":""))+")"})}return h;function h(){let f=Z1,p,v,w;if((!t||s(l,u,c[c.length-1]||void 0))&&(f=NM(n(l,c)),f[0]===Qd))return f;if("children"in l&&l.children){const m=l;if(m.children&&f[0]!==OM)for(v=(r?m.children.length:-1)+o,w=c.concat(m);v>-1&&v<m.children.length;){const g=m.children[v];if(p=a(g,v,w)(),p[0]===Qd)return p;v=typeof p[1]=="number"?p[1]:v+o}}return f}}}function NM(e){return Array.isArray(e)?e:typeof e=="number"?[RM,e]:e==null?Z1:[e]}function Vf(e,t,n,r){let i,s,o;typeof t=="function"&&typeof n!="function"?(s=void 0,o=t,i=n):(s=t,o=n,i=r),ek(e,s,a,i);function a(l,u){const c=u[u.length-1],d=c?c.children.indexOf(l):void 0;return o(l,d,c)}}const Xd={}.hasOwnProperty,jM={};function IM(e,t){const n=t||jM,r=new Map,i=new Map,s=new Map,o={...yM,...n.handlers},a={all:u,applyData:LM,definitionById:r,footnoteById:i,footnoteCounts:s,footnoteOrder:[],handlers:o,one:l,options:n,patch:DM,wrap:BM};return Vf(e,function(c){if(c.type==="definition"||c.type==="footnoteDefinition"){const d=c.type==="definition"?r:i,h=String(c.identifier).toUpperCase();d.has(h)||d.set(h,c)}}),a;function l(c,d){const h=c.type,f=a.handlers[h];if(Xd.call(a.handlers,h)&&f)return f(a,c,d);if(a.options.passThrough&&a.options.passThrough.includes(h)){if("children"in c){const{children:v,...w}=c,m=Sl(w);return m.children=a.all(c),m}return Sl(c)}return(a.options.unknownHandler||MM)(a,c,d)}function u(c){const d=[];if("children"in c){const h=c.children;let f=-1;for(;++f<h.length;){const p=a.one(h[f],c);if(p){if(f&&h[f-1].type==="break"&&(!Array.isArray(p)&&p.type==="text"&&(p.value=Oy(p.value)),!Array.isArray(p)&&p.type==="element")){const v=p.children[0];v&&v.type==="text"&&(v.value=Oy(v.value))}Array.isArray(p)?d.push(...p):d.push(p)}}}return d}}function DM(e,t){e.position&&(t.position=SI(e))}function LM(e,t){let n=t;if(e&&e.data){const r=e.data.hName,i=e.data.hChildren,s=e.data.hProperties;if(typeof r=="string")if(n.type==="element")n.tagName=r;else{const o="children"in n?n.children:[n];n={type:"element",tagName:r,properties:{},children:o}}n.type==="element"&&s&&Object.assign(n.properties,Sl(s)),"children"in n&&n.children&&i!==null&&i!==void 0&&(n.children=i)}return n}function MM(e,t){const n=t.data||{},r="value"in t&&!(Xd.call(n,"hProperties")||Xd.call(n,"hChildren"))?{type:"text",value:t.value}:{type:"element",tagName:"div",properties:{},children:e.all(t)};return e.patch(t,r),e.applyData(t,r)}function BM(e,t){const n=[];let r=-1;for(t&&n.push({type:"text",value:`
`});++r<e.length;)r&&n.push({type:"text",value:`
`}),n.push(e[r]);return t&&e.length>0&&n.push({type:"text",value:`
`}),n}function Oy(e){let t=0,n=e.charCodeAt(t);for(;n===9||n===32;)t++,n=e.charCodeAt(t);return e.slice(t)}function Ny(e,t){const n=IM(e,t),r=n.one(e,void 0),i=_M(n),s=Array.isArray(r)?{type:"root",children:r}:r||{type:"root",children:[]};return i&&s.children.push({type:"text",value:`
`},i),s}function FM(e,t){return e&&"run"in e?async function(n,r){const i=Ny(n,{file:r,...t});await e.run(i,r)}:function(n,r){return Ny(n,{file:r,...e||t})}}function jy(e){if(e)throw e}var ja=Object.prototype.hasOwnProperty,tk=Object.prototype.toString,Iy=Object.defineProperty,Dy=Object.getOwnPropertyDescriptor,Ly=function(t){return typeof Array.isArray=="function"?Array.isArray(t):tk.call(t)==="[object Array]"},My=function(t){if(!t||tk.call(t)!=="[object Object]")return!1;var n=ja.call(t,"constructor"),r=t.constructor&&t.constructor.prototype&&ja.call(t.constructor.prototype,"isPrototypeOf");if(t.constructor&&!n&&!r)return!1;var i;for(i in t);return typeof i>"u"||ja.call(t,i)},By=function(t,n){Iy&&n.name==="__proto__"?Iy(t,n.name,{enumerable:!0,configurable:!0,value:n.newValue,writable:!0}):t[n.name]=n.newValue},Fy=function(t,n){if(n==="__proto__")if(ja.call(t,n)){if(Dy)return Dy(t,n).value}else return;return t[n]},$M=function e(){var t,n,r,i,s,o,a=arguments[0],l=1,u=arguments.length,c=!1;for(typeof a=="boolean"&&(c=a,a=arguments[1]||{},l=2),(a==null||typeof a!="object"&&typeof a!="function")&&(a={});l<u;++l)if(t=arguments[l],t!=null)for(n in t)r=Fy(a,n),i=Fy(t,n),a!==i&&(c&&i&&(My(i)||(s=Ly(i)))?(s?(s=!1,o=r&&Ly(r)?r:[]):o=r&&My(r)?r:{},By(a,{name:n,newValue:e(c,o,i)})):typeof i<"u"&&By(a,{name:n,newValue:i}));return a};const ac=th($M);function Yd(e){if(typeof e!="object"||e===null)return!1;const t=Object.getPrototypeOf(e);return(t===null||t===Object.prototype||Object.getPrototypeOf(t)===null)&&!(Symbol.toStringTag in e)&&!(Symbol.iterator in e)}function UM(){const e=[],t={run:n,use:r};return t;function n(...i){let s=-1;const o=i.pop();if(typeof o!="function")throw new TypeError("Expected function as last argument, not "+o);a(null,...i);function a(l,...u){const c=e[++s];let d=-1;if(l){o(l);return}for(;++d<i.length;)(u[d]===null||u[d]===void 0)&&(u[d]=i[d]);i=u,c?VM(c,a)(...u):o(null,...u)}}function r(i){if(typeof i!="function")throw new TypeError("Expected `middelware` to be a function, not "+i);return e.push(i),t}}function VM(e,t){let n;return r;function r(...o){const a=e.length>o.length;let l;a&&o.push(i);try{l=e.apply(this,o)}catch(u){const c=u;if(a&&n)throw c;return i(c)}a||(l&&l.then&&typeof l.then=="function"?l.then(s,i):l instanceof Error?i(l):s(l))}function i(o,...a){n||(n=!0,t(o,...a))}function s(o){i(null,o)}}const Zt={basename:zM,dirname:qM,extname:HM,join:WM,sep:"/"};function zM(e,t){if(t!==void 0&&typeof t!="string")throw new TypeError('"ext" argument must be a string');Do(e);let n=0,r=-1,i=e.length,s;if(t===void 0||t.length===0||t.length>e.length){for(;i--;)if(e.codePointAt(i)===47){if(s){n=i+1;break}}else r<0&&(s=!0,r=i+1);return r<0?"":e.slice(n,r)}if(t===e)return"";let o=-1,a=t.length-1;for(;i--;)if(e.codePointAt(i)===47){if(s){n=i+1;break}}else o<0&&(s=!0,o=i+1),a>-1&&(e.codePointAt(i)===t.codePointAt(a--)?a<0&&(r=i):(a=-1,r=o));return n===r?r=o:r<0&&(r=e.length),e.slice(n,r)}function qM(e){if(Do(e),e.length===0)return".";let t=-1,n=e.length,r;for(;--n;)if(e.codePointAt(n)===47){if(r){t=n;break}}else r||(r=!0);return t<0?e.codePointAt(0)===47?"/":".":t===1&&e.codePointAt(0)===47?"//":e.slice(0,t)}function HM(e){Do(e);let t=e.length,n=-1,r=0,i=-1,s=0,o;for(;t--;){const a=e.codePointAt(t);if(a===47){if(o){r=t+1;break}continue}n<0&&(o=!0,n=t+1),a===46?i<0?i=t:s!==1&&(s=1):i>-1&&(s=-1)}return i<0||n<0||s===0||s===1&&i===n-1&&i===r+1?"":e.slice(i,n)}function WM(...e){let t=-1,n;for(;++t<e.length;)Do(e[t]),e[t]&&(n=n===void 0?e[t]:n+"/"+e[t]);return n===void 0?".":GM(n)}function GM(e){Do(e);const t=e.codePointAt(0)===47;let n=KM(e,!t);return n.length===0&&!t&&(n="."),n.length>0&&e.codePointAt(e.length-1)===47&&(n+="/"),t?"/"+n:n}function KM(e,t){let n="",r=0,i=-1,s=0,o=-1,a,l;for(;++o<=e.length;){if(o<e.length)a=e.codePointAt(o);else{if(a===47)break;a=47}if(a===47){if(!(i===o-1||s===1))if(i!==o-1&&s===2){if(n.length<2||r!==2||n.codePointAt(n.length-1)!==46||n.codePointAt(n.length-2)!==46){if(n.length>2){if(l=n.lastIndexOf("/"),l!==n.length-1){l<0?(n="",r=0):(n=n.slice(0,l),r=n.length-1-n.lastIndexOf("/")),i=o,s=0;continue}}else if(n.length>0){n="",r=0,i=o,s=0;continue}}t&&(n=n.length>0?n+"/..":"..",r=2)}else n.length>0?n+="/"+e.slice(i+1,o):n=e.slice(i+1,o),r=o-i-1;i=o,s=0}else a===46&&s>-1?s++:s=-1}return n}function Do(e){if(typeof e!="string")throw new TypeError("Path must be a string. Received "+JSON.stringify(e))}const JM={cwd:QM};function QM(){return"/"}function Zd(e){return!!(e!==null&&typeof e=="object"&&"href"in e&&e.href&&"protocol"in e&&e.protocol&&e.auth===void 0)}function XM(e){if(typeof e=="string")e=new URL(e);else if(!Zd(e)){const t=new TypeError('The "path" argument must be of type string or an instance of URL. Received `'+e+"`");throw t.code="ERR_INVALID_ARG_TYPE",t}if(e.protocol!=="file:"){const t=new TypeError("The URL must be of scheme file");throw t.code="ERR_INVALID_URL_SCHEME",t}return YM(e)}function YM(e){if(e.hostname!==""){const r=new TypeError('File URL host must be "localhost" or empty on darwin');throw r.code="ERR_INVALID_FILE_URL_HOST",r}const t=e.pathname;let n=-1;for(;++n<t.length;)if(t.codePointAt(n)===37&&t.codePointAt(n+1)===50){const r=t.codePointAt(n+2);if(r===70||r===102){const i=new TypeError("File URL path must not include encoded / characters");throw i.code="ERR_INVALID_FILE_URL_PATH",i}}return decodeURIComponent(t)}const lc=["history","path","basename","stem","extname","dirname"];class nk{constructor(t){let n;t?Zd(t)?n={path:t}:typeof t=="string"||ZM(t)?n={value:t}:n=t:n={},this.cwd="cwd"in n?"":JM.cwd(),this.data={},this.history=[],this.messages=[],this.value,this.map,this.result,this.stored;let r=-1;for(;++r<lc.length;){const s=lc[r];s in n&&n[s]!==void 0&&n[s]!==null&&(this[s]=s==="history"?[...n[s]]:n[s])}let i;for(i in n)lc.includes(i)||(this[i]=n[i])}get basename(){return typeof this.path=="string"?Zt.basename(this.path):void 0}set basename(t){cc(t,"basename"),uc(t,"basename"),this.path=Zt.join(this.dirname||"",t)}get dirname(){return typeof this.path=="string"?Zt.dirname(this.path):void 0}set dirname(t){$y(this.basename,"dirname"),this.path=Zt.join(t||"",this.basename)}get extname(){return typeof this.path=="string"?Zt.extname(this.path):void 0}set extname(t){if(uc(t,"extname"),$y(this.dirname,"extname"),t){if(t.codePointAt(0)!==46)throw new Error("`extname` must start with `.`");if(t.includes(".",1))throw new Error("`extname` cannot contain multiple dots")}this.path=Zt.join(this.dirname,this.stem+(t||""))}get path(){return this.history[this.history.length-1]}set path(t){Zd(t)&&(t=XM(t)),cc(t,"path"),this.path!==t&&this.history.push(t)}get stem(){return typeof this.path=="string"?Zt.basename(this.path,this.extname):void 0}set stem(t){cc(t,"stem"),uc(t,"stem"),this.path=Zt.join(this.dirname||"",t+(this.extname||""))}fail(t,n,r){const i=this.message(t,n,r);throw i.fatal=!0,i}info(t,n,r){const i=this.message(t,n,r);return i.fatal=void 0,i}message(t,n,r){const i=new Je(t,n,r);return this.path&&(i.name=this.path+":"+i.name,i.file=this.path),i.fatal=!1,this.messages.push(i),i}toString(t){return this.value===void 0?"":typeof this.value=="string"?this.value:new TextDecoder(t||void 0).decode(this.value)}}function uc(e,t){if(e&&e.includes(Zt.sep))throw new Error("`"+t+"` cannot be a path: did not expect `"+Zt.sep+"`")}function cc(e,t){if(!e)throw new Error("`"+t+"` cannot be empty")}function $y(e,t){if(!e)throw new Error("Setting `"+t+"` requires `path` to be set too")}function ZM(e){return!!(e&&typeof e=="object"&&"byteLength"in e&&"byteOffset"in e)}const e5=function(e){const r=this.constructor.prototype,i=r[e],s=function(){return i.apply(s,arguments)};return Object.setPrototypeOf(s,r),s},t5={}.hasOwnProperty;class zf extends e5{constructor(){super("copy"),this.Compiler=void 0,this.Parser=void 0,this.attachers=[],this.compiler=void 0,this.freezeIndex=-1,this.frozen=void 0,this.namespace={},this.parser=void 0,this.transformers=UM()}copy(){const t=new zf;let n=-1;for(;++n<this.attachers.length;){const r=this.attachers[n];t.use(...r)}return t.data(ac(!0,{},this.namespace)),t}data(t,n){return typeof t=="string"?arguments.length===2?(fc("data",this.frozen),this.namespace[t]=n,this):t5.call(this.namespace,t)&&this.namespace[t]||void 0:t?(fc("data",this.frozen),this.namespace=t,this):this.namespace}freeze(){if(this.frozen)return this;const t=this;for(;++this.freezeIndex<this.attachers.length;){const[n,...r]=this.attachers[this.freezeIndex];if(r[0]===!1)continue;r[0]===!0&&(r[0]=void 0);const i=n.call(t,...r);typeof i=="function"&&this.transformers.use(i)}return this.frozen=!0,this.freezeIndex=Number.POSITIVE_INFINITY,this}parse(t){this.freeze();const n=ma(t),r=this.parser||this.Parser;return dc("parse",r),r(String(n),n)}process(t,n){const r=this;return this.freeze(),dc("process",this.parser||this.Parser),hc("process",this.compiler||this.Compiler),n?i(void 0,n):new Promise(i);function i(s,o){const a=ma(t),l=r.parse(a);r.run(l,a,function(c,d,h){if(c||!d||!h)return u(c);const f=d,p=r.stringify(f,h);i5(p)?h.value=p:h.result=p,u(c,h)});function u(c,d){c||!d?o(c):s?s(d):n(void 0,d)}}}processSync(t){let n=!1,r;return this.freeze(),dc("processSync",this.parser||this.Parser),hc("processSync",this.compiler||this.Compiler),this.process(t,i),Vy("processSync","process",n),r;function i(s,o){n=!0,jy(s),r=o}}run(t,n,r){Uy(t),this.freeze();const i=this.transformers;return!r&&typeof n=="function"&&(r=n,n=void 0),r?s(void 0,r):new Promise(s);function s(o,a){const l=ma(n);i.run(t,l,u);function u(c,d,h){const f=d||t;c?a(c):o?o(f):r(void 0,f,h)}}}runSync(t,n){let r=!1,i;return this.run(t,n,s),Vy("runSync","run",r),i;function s(o,a){jy(o),i=a,r=!0}}stringify(t,n){this.freeze();const r=ma(n),i=this.compiler||this.Compiler;return hc("stringify",i),Uy(t),i(t,r)}use(t,...n){const r=this.attachers,i=this.namespace;if(fc("use",this.frozen),t!=null)if(typeof t=="function")l(t,n);else if(typeof t=="object")Array.isArray(t)?a(t):o(t);else throw new TypeError("Expected usable value, not `"+t+"`");return this;function s(u){if(typeof u=="function")l(u,[]);else if(typeof u=="object")if(Array.isArray(u)){const[c,...d]=u;l(c,d)}else o(u);else throw new TypeError("Expected usable value, not `"+u+"`")}function o(u){if(!("plugins"in u)&&!("settings"in u))throw new Error("Expected usable value but received an empty preset, which is probably a mistake: presets typically come with `plugins` and sometimes with `settings`, but this has neither");a(u.plugins),u.settings&&(i.settings=ac(!0,i.settings,u.settings))}function a(u){let c=-1;if(u!=null)if(Array.isArray(u))for(;++c<u.length;){const d=u[c];s(d)}else throw new TypeError("Expected a list of plugins, not `"+u+"`")}function l(u,c){let d=-1,h=-1;for(;++d<r.length;)if(r[d][0]===u){h=d;break}if(h===-1)r.push([u,...c]);else if(c.length>0){let[f,...p]=c;const v=r[h][1];Yd(v)&&Yd(f)&&(f=ac(!0,v,f)),r[h]=[u,f,...p]}}}}const n5=new zf().freeze();function dc(e,t){if(typeof t!="function")throw new TypeError("Cannot `"+e+"` without `parser`")}function hc(e,t){if(typeof t!="function")throw new TypeError("Cannot `"+e+"` without `compiler`")}function fc(e,t){if(t)throw new Error("Cannot call `"+e+"` on a frozen processor.\nCreate a new processor first, by calling it: use `processor()` instead of `processor`.")}function Uy(e){if(!Yd(e)||typeof e.type!="string")throw new TypeError("Expected node, got `"+e+"`")}function Vy(e,t,n){if(!n)throw new Error("`"+e+"` finished async. Use `"+t+"` instead")}function ma(e){return r5(e)?e:new nk(e)}function r5(e){return!!(e&&typeof e=="object"&&"message"in e&&"messages"in e)}function i5(e){return typeof e=="string"||s5(e)}function s5(e){return!!(e&&typeof e=="object"&&"byteLength"in e&&"byteOffset"in e)}const o5="https://github.com/remarkjs/react-markdown/blob/main/changelog.md",zy=[],qy={allowDangerousHtml:!0},a5=/^(https?|ircs?|mailto|xmpp)$/i,l5=[{from:"astPlugins",id:"remove-buggy-html-in-markdown-parser"},{from:"allowDangerousHtml",id:"remove-buggy-html-in-markdown-parser"},{from:"allowNode",id:"replace-allownode-allowedtypes-and-disallowedtypes",to:"allowElement"},{from:"allowedTypes",id:"replace-allownode-allowedtypes-and-disallowedtypes",to:"allowedElements"},{from:"className",id:"remove-classname"},{from:"disallowedTypes",id:"replace-allownode-allowedtypes-and-disallowedtypes",to:"disallowedElements"},{from:"escapeHtml",id:"remove-buggy-html-in-markdown-parser"},{from:"includeElementIndex",id:"#remove-includeelementindex"},{from:"includeNodeIndex",id:"change-includenodeindex-to-includeelementindex"},{from:"linkTarget",id:"remove-linktarget"},{from:"plugins",id:"change-plugins-to-remarkplugins",to:"remarkPlugins"},{from:"rawSourcePos",id:"#remove-rawsourcepos"},{from:"renderers",id:"change-renderers-to-components",to:"components"},{from:"source",id:"change-source-to-children",to:"children"},{from:"sourcePos",id:"#remove-sourcepos"},{from:"transformImageUri",id:"#add-urltransform",to:"urlTransform"},{from:"transformLinkUri",id:"#add-urltransform",to:"urlTransform"}];function u5(e){const t=c5(e),n=d5(e);return h5(t.runSync(t.parse(n),n),e)}function c5(e){const t=e.rehypePlugins||zy,n=e.remarkPlugins||zy,r=e.remarkRehypeOptions?{...e.remarkRehypeOptions,...qy}:qy;return n5().use(HL).use(n).use(FM,r).use(t)}function d5(e){const t=e.children||"",n=new nk;return typeof t=="string"&&(n.value=t),n}function h5(e,t){const n=t.allowedElements,r=t.allowElement,i=t.components,s=t.disallowedElements,o=t.skipHtml,a=t.unwrapDisallowed,l=t.urlTransform||f5;for(const c of l5)Object.hasOwn(t,c.from)&&(""+c.from+(c.to?"use `"+c.to+"` instead":"remove it")+o5+c.id,void 0);return Vf(e,u),PI(e,{Fragment:x.Fragment,components:i,ignoreInvalidStyle:!0,jsx:x.jsx,jsxs:x.jsxs,passKeys:!0,passNode:!0});function u(c,d,h){if(c.type==="raw"&&h&&typeof d=="number")return o?h.children.splice(d,1):h.children[d]={type:"text",value:c.value},d;if(c.type==="element"){let f;for(f in ic)if(Object.hasOwn(ic,f)&&Object.hasOwn(c.properties,f)){const p=c.properties[f],v=ic[f];(v===null||v.includes(c.tagName))&&(c.properties[f]=l(String(p||""),f,c))}}if(c.type==="element"){let f=n?!n.includes(c.tagName):s?s.includes(c.tagName):!1;if(!f&&r&&typeof d=="number"&&(f=!r(c,d,h)),f&&h&&typeof d=="number")return a&&c.children?h.children.splice(d,1,...c.children):h.children.splice(d,1),d}}}function f5(e){const t=e.indexOf(":"),n=e.indexOf("?"),r=e.indexOf("#"),i=e.indexOf("/");return t===-1||i!==-1&&t>i||n!==-1&&t>n||r!==-1&&t>r||a5.test(e.slice(0,t))?e:""}function Hy(e,t){const n=String(e);if(typeof t!="string")throw new TypeError("Expected character");let r=0,i=n.indexOf(t);for(;i!==-1;)r++,i=n.indexOf(t,i+t.length);return r}function p5(e){if(typeof e!="string")throw new TypeError("Expected a string");return e.replace(/[|\\{}()[\]^$+*?.]/g,"\\$&").replace(/-/g,"\\x2d")}function m5(e,t,n){const i=au((n||{}).ignore||[]),s=g5(t);let o=-1;for(;++o<s.length;)ek(e,"text",a);function a(u,c){let d=-1,h;for(;++d<c.length;){const f=c[d],p=h?h.children:void 0;if(i(f,p?p.indexOf(f):void 0,h))return;h=f}if(h)return l(u,c)}function l(u,c){const d=c[c.length-1],h=s[o][0],f=s[o][1];let p=0;const w=d.children.indexOf(u);let m=!1,g=[];h.lastIndex=0;let y=h.exec(u.value);for(;y;){const k=y.index,T={index:y.index,input:y.input,stack:[...c,u]};let S=f(...y,T);if(typeof S=="string"&&(S=S.length>0?{type:"text",value:S}:void 0),S===!1?h.lastIndex=k+1:(p!==k&&g.push({type:"text",value:u.value.slice(p,k)}),Array.isArray(S)?g.push(...S):S&&g.push(S),p=k+y[0].length,m=!0),!h.global)break;y=h.exec(u.value)}return m?(p<u.value.length&&g.push({type:"text",value:u.value.slice(p)}),d.children.splice(w,1,...g)):g=[u],w+g.length}}function g5(e){const t=[];if(!Array.isArray(e))throw new TypeError("Expected find and replace tuple or list of tuples");const n=!e[0]||Array.isArray(e[0])?e:[e];let r=-1;for(;++r<n.length;){const i=n[r];t.push([y5(i[0]),v5(i[1])])}return t}function y5(e){return typeof e=="string"?new RegExp(p5(e),"g"):e}function v5(e){return typeof e=="function"?e:function(){return e}}const pc="phrasing",mc=["autolink","link","image","label"];function x5(){return{transforms:[E5],enter:{literalAutolink:k5,literalAutolinkEmail:gc,literalAutolinkHttp:gc,literalAutolinkWww:gc},exit:{literalAutolink:C5,literalAutolinkEmail:_5,literalAutolinkHttp:b5,literalAutolinkWww:S5}}}function w5(){return{unsafe:[{character:"@",before:"[+\\-.\\w]",after:"[\\-.\\w]",inConstruct:pc,notInConstruct:mc},{character:".",before:"[Ww]",after:"[\\-.\\w]",inConstruct:pc,notInConstruct:mc},{character:":",before:"[ps]",after:"\\/",inConstruct:pc,notInConstruct:mc}]}}function k5(e){this.enter({type:"link",title:null,url:"",children:[]},e)}function gc(e){this.config.enter.autolinkProtocol.call(this,e)}function b5(e){this.config.exit.autolinkProtocol.call(this,e)}function S5(e){this.config.exit.data.call(this,e);const t=this.stack[this.stack.length-1];t.type,t.url="http://"+this.sliceSerialize(e)}function _5(e){this.config.exit.autolinkEmail.call(this,e)}function C5(e){this.exit(e)}function E5(e){m5(e,[[/(https?:\/\/|www(?=\.))([-.\w]+)([^ \t\r\n]*)/gi,T5],[new RegExp("(?<=^|\\s|\\p{P}|\\p{S})([-.\\w+]+)@([-\\w]+(?:\\.[-\\w]+)+)","gu"),P5]],{ignore:["link","linkReference"]})}function T5(e,t,n,r,i){let s="";if(!rk(i)||(/^w/i.test(t)&&(n=t+n,t="",s="http://"),!A5(n)))return!1;const o=R5(n+r);if(!o[0])return!1;const a={type:"link",title:null,url:s+t+o[0],children:[{type:"text",value:t+o[0]}]};return o[1]?[a,{type:"text",value:o[1]}]:a}function P5(e,t,n,r){return!rk(r,!0)||/[-\d_]$/.test(n)?!1:{type:"link",title:null,url:"mailto:"+t+"@"+n,children:[{type:"text",value:t+"@"+n}]}}function A5(e){const t=e.split(".");return!(t.length<2||t[t.length-1]&&(/_/.test(t[t.length-1])||!/[a-zA-Z\d]/.test(t[t.length-1]))||t[t.length-2]&&(/_/.test(t[t.length-2])||!/[a-zA-Z\d]/.test(t[t.length-2])))}function R5(e){const t=/[!"&'),.:;<>?\]}]+$/.exec(e);if(!t)return[e,void 0];e=e.slice(0,t.index);let n=t[0],r=n.indexOf(")");const i=Hy(e,"(");let s=Hy(e,")");for(;r!==-1&&i>s;)e+=n.slice(0,r+1),n=n.slice(r+1),r=n.indexOf(")"),s++;return[e,n]}function rk(e,t){const n=e.input.charCodeAt(e.index-1);return(e.index===0||$r(n)||iu(n))&&(!t||n!==47)}ik.peek=F5;function O5(){this.buffer()}function N5(e){this.enter({type:"footnoteReference",identifier:"",label:""},e)}function j5(){this.buffer()}function I5(e){this.enter({type:"footnoteDefinition",identifier:"",label:"",children:[]},e)}function D5(e){const t=this.resume(),n=this.stack[this.stack.length-1];n.type,n.identifier=Gt(this.sliceSerialize(e)).toLowerCase(),n.label=t}function L5(e){this.exit(e)}function M5(e){const t=this.resume(),n=this.stack[this.stack.length-1];n.type,n.identifier=Gt(this.sliceSerialize(e)).toLowerCase(),n.label=t}function B5(e){this.exit(e)}function F5(){return"["}function ik(e,t,n,r){const i=n.createTracker(r);let s=i.move("[^");const o=n.enter("footnoteReference"),a=n.enter("reference");return s+=i.move(n.safe(n.associationId(e),{after:"]",before:s})),a(),o(),s+=i.move("]"),s}function $5(){return{enter:{gfmFootnoteCallString:O5,gfmFootnoteCall:N5,gfmFootnoteDefinitionLabelString:j5,gfmFootnoteDefinition:I5},exit:{gfmFootnoteCallString:D5,gfmFootnoteCall:L5,gfmFootnoteDefinitionLabelString:M5,gfmFootnoteDefinition:B5}}}function U5(e){let t=!1;return e&&e.firstLineBlank&&(t=!0),{handlers:{footnoteDefinition:n,footnoteReference:ik},unsafe:[{character:"[",inConstruct:["label","phrasing","reference"]}]};function n(r,i,s,o){const a=s.createTracker(o);let l=a.move("[^");const u=s.enter("footnoteDefinition"),c=s.enter("label");return l+=a.move(s.safe(s.associationId(r),{before:l,after:"]"})),c(),l+=a.move("]:"),r.children&&r.children.length>0&&(a.shift(4),l+=a.move((t?`
`:" ")+s.indentLines(s.containerFlow(r,a.current()),t?sk:V5))),u(),l}}function V5(e,t,n){return t===0?e:sk(e,t,n)}function sk(e,t,n){return(n?"":"    ")+e}const z5=["autolink","destinationLiteral","destinationRaw","reference","titleQuote","titleApostrophe"];ok.peek=K5;function q5(){return{canContainEols:["delete"],enter:{strikethrough:W5},exit:{strikethrough:G5}}}function H5(){return{unsafe:[{character:"~",inConstruct:"phrasing",notInConstruct:z5}],handlers:{delete:ok}}}function W5(e){this.enter({type:"delete",children:[]},e)}function G5(e){this.exit(e)}function ok(e,t,n,r){const i=n.createTracker(r),s=n.enter("strikethrough");let o=i.move("~~");return o+=n.containerPhrasing(e,{...i.current(),before:o,after:"~"}),o+=i.move("~~"),s(),o}function K5(){return"~"}function J5(e){return e.length}function Q5(e,t){const n=t||{},r=(n.align||[]).concat(),i=n.stringLength||J5,s=[],o=[],a=[],l=[];let u=0,c=-1;for(;++c<e.length;){const v=[],w=[];let m=-1;for(e[c].length>u&&(u=e[c].length);++m<e[c].length;){const g=X5(e[c][m]);if(n.alignDelimiters!==!1){const y=i(g);w[m]=y,(l[m]===void 0||y>l[m])&&(l[m]=y)}v.push(g)}o[c]=v,a[c]=w}let d=-1;if(typeof r=="object"&&"length"in r)for(;++d<u;)s[d]=Wy(r[d]);else{const v=Wy(r);for(;++d<u;)s[d]=v}d=-1;const h=[],f=[];for(;++d<u;){const v=s[d];let w="",m="";v===99?(w=":",m=":"):v===108?w=":":v===114&&(m=":");let g=n.alignDelimiters===!1?1:Math.max(1,l[d]-w.length-m.length);const y=w+"-".repeat(g)+m;n.alignDelimiters!==!1&&(g=w.length+g+m.length,g>l[d]&&(l[d]=g),f[d]=g),h[d]=y}o.splice(1,0,h),a.splice(1,0,f),c=-1;const p=[];for(;++c<o.length;){const v=o[c],w=a[c];d=-1;const m=[];for(;++d<u;){const g=v[d]||"";let y="",k="";if(n.alignDelimiters!==!1){const T=l[d]-(w[d]||0),S=s[d];S===114?y=" ".repeat(T):S===99?T%2?(y=" ".repeat(T/2+.5),k=" ".repeat(T/2-.5)):(y=" ".repeat(T/2),k=y):k=" ".repeat(T)}n.delimiterStart!==!1&&!d&&m.push("|"),n.padding!==!1&&!(n.alignDelimiters===!1&&g==="")&&(n.delimiterStart!==!1||d)&&m.push(" "),n.alignDelimiters!==!1&&m.push(y),m.push(g),n.alignDelimiters!==!1&&m.push(k),n.padding!==!1&&m.push(" "),(n.delimiterEnd!==!1||d!==u-1)&&m.push("|")}p.push(n.delimiterEnd===!1?m.join("").replace(/ +$/,""):m.join(""))}return p.join(`
`)}function X5(e){return e==null?"":String(e)}function Wy(e){const t=typeof e=="string"?e.codePointAt(0):0;return t===67||t===99?99:t===76||t===108?108:t===82||t===114?114:0}function Y5(e,t,n,r){const i=n.enter("blockquote"),s=n.createTracker(r);s.move("> "),s.shift(2);const o=n.indentLines(n.containerFlow(e,s.current()),Z5);return i(),o}function Z5(e,t,n){return">"+(n?"":" ")+e}function e3(e,t){return Gy(e,t.inConstruct,!0)&&!Gy(e,t.notInConstruct,!1)}function Gy(e,t,n){if(typeof t=="string"&&(t=[t]),!t||t.length===0)return n;let r=-1;for(;++r<t.length;)if(e.includes(t[r]))return!0;return!1}function Ky(e,t,n,r){let i=-1;for(;++i<n.unsafe.length;)if(n.unsafe[i].character===`
`&&e3(n.stack,n.unsafe[i]))return/[ \t]/.test(r.before)?"":" ";return`\\
`}function t3(e,t){const n=String(e);let r=n.indexOf(t),i=r,s=0,o=0;if(typeof t!="string")throw new TypeError("Expected substring");for(;r!==-1;)r===i?++s>o&&(o=s):s=1,i=r+t.length,r=n.indexOf(t,i);return o}function n3(e,t){return!!(t.options.fences===!1&&e.value&&!e.lang&&/[^ \r\n]/.test(e.value)&&!/^[\t ]*(?:[\r\n]|$)|(?:^|[\r\n])[\t ]*$/.test(e.value))}function r3(e){const t=e.options.fence||"`";if(t!=="`"&&t!=="~")throw new Error("Cannot serialize code with `"+t+"` for `options.fence`, expected `` ` `` or `~`");return t}function i3(e,t,n,r){const i=r3(n),s=e.value||"",o=i==="`"?"GraveAccent":"Tilde";if(n3(e,n)){const d=n.enter("codeIndented"),h=n.indentLines(s,s3);return d(),h}const a=n.createTracker(r),l=i.repeat(Math.max(t3(s,i)+1,3)),u=n.enter("codeFenced");let c=a.move(l);if(e.lang){const d=n.enter(`codeFencedLang${o}`);c+=a.move(n.safe(e.lang,{before:c,after:" ",encode:["`"],...a.current()})),d()}if(e.lang&&e.meta){const d=n.enter(`codeFencedMeta${o}`);c+=a.move(" "),c+=a.move(n.safe(e.meta,{before:c,after:`
`,encode:["`"],...a.current()})),d()}return c+=a.move(`
`),s&&(c+=a.move(s+`
`)),c+=a.move(l),u(),c}function s3(e,t,n){return(n?"":"    ")+e}function qf(e){const t=e.options.quote||'"';if(t!=='"'&&t!=="'")throw new Error("Cannot serialize title with `"+t+"` for `options.quote`, expected `\"`, or `'`");return t}function o3(e,t,n,r){const i=qf(n),s=i==='"'?"Quote":"Apostrophe",o=n.enter("definition");let a=n.enter("label");const l=n.createTracker(r);let u=l.move("[");return u+=l.move(n.safe(n.associationId(e),{before:u,after:"]",...l.current()})),u+=l.move("]: "),a(),!e.url||/[\0- \u007F]/.test(e.url)?(a=n.enter("destinationLiteral"),u+=l.move("<"),u+=l.move(n.safe(e.url,{before:u,after:">",...l.current()})),u+=l.move(">")):(a=n.enter("destinationRaw"),u+=l.move(n.safe(e.url,{before:u,after:e.title?" ":`
`,...l.current()}))),a(),e.title&&(a=n.enter(`title${s}`),u+=l.move(" "+i),u+=l.move(n.safe(e.title,{before:u,after:i,...l.current()})),u+=l.move(i),a()),o(),u}function a3(e){const t=e.options.emphasis||"*";if(t!=="*"&&t!=="_")throw new Error("Cannot serialize emphasis with `"+t+"` for `options.emphasis`, expected `*`, or `_`");return t}function ko(e){return"&#x"+e.toString(16).toUpperCase()+";"}function _l(e,t,n){const r=Vi(e),i=Vi(t);return r===void 0?i===void 0?n==="_"?{inside:!0,outside:!0}:{inside:!1,outside:!1}:i===1?{inside:!0,outside:!0}:{inside:!1,outside:!0}:r===1?i===void 0?{inside:!1,outside:!1}:i===1?{inside:!0,outside:!0}:{inside:!1,outside:!1}:i===void 0?{inside:!1,outside:!1}:i===1?{inside:!0,outside:!1}:{inside:!1,outside:!1}}ak.peek=l3;function ak(e,t,n,r){const i=a3(n),s=n.enter("emphasis"),o=n.createTracker(r),a=o.move(i);let l=o.move(n.containerPhrasing(e,{after:i,before:a,...o.current()}));const u=l.charCodeAt(0),c=_l(r.before.charCodeAt(r.before.length-1),u,i);c.inside&&(l=ko(u)+l.slice(1));const d=l.charCodeAt(l.length-1),h=_l(r.after.charCodeAt(0),d,i);h.inside&&(l=l.slice(0,-1)+ko(d));const f=o.move(i);return s(),n.attentionEncodeSurroundingInfo={after:h.outside,before:c.outside},a+l+f}function l3(e,t,n){return n.options.emphasis||"*"}function u3(e,t){let n=!1;return Vf(e,function(r){if("value"in r&&/\r?\n|\r/.test(r.value)||r.type==="break")return n=!0,Qd}),!!((!e.depth||e.depth<3)&&Df(e)&&(t.options.setext||n))}function c3(e,t,n,r){const i=Math.max(Math.min(6,e.depth||1),1),s=n.createTracker(r);if(u3(e,n)){const c=n.enter("headingSetext"),d=n.enter("phrasing"),h=n.containerPhrasing(e,{...s.current(),before:`
`,after:`
`});return d(),c(),h+`
`+(i===1?"=":"-").repeat(h.length-(Math.max(h.lastIndexOf("\r"),h.lastIndexOf(`
`))+1))}const o="#".repeat(i),a=n.enter("headingAtx"),l=n.enter("phrasing");s.move(o+" ");let u=n.containerPhrasing(e,{before:"# ",after:`
`,...s.current()});return/^[\t ]/.test(u)&&(u=ko(u.charCodeAt(0))+u.slice(1)),u=u?o+" "+u:o,n.options.closeAtx&&(u+=" "+o),l(),a(),u}lk.peek=d3;function lk(e){return e.value||""}function d3(){return"<"}uk.peek=h3;function uk(e,t,n,r){const i=qf(n),s=i==='"'?"Quote":"Apostrophe",o=n.enter("image");let a=n.enter("label");const l=n.createTracker(r);let u=l.move("![");return u+=l.move(n.safe(e.alt,{before:u,after:"]",...l.current()})),u+=l.move("]("),a(),!e.url&&e.title||/[\0- \u007F]/.test(e.url)?(a=n.enter("destinationLiteral"),u+=l.move("<"),u+=l.move(n.safe(e.url,{before:u,after:">",...l.current()})),u+=l.move(">")):(a=n.enter("destinationRaw"),u+=l.move(n.safe(e.url,{before:u,after:e.title?" ":")",...l.current()}))),a(),e.title&&(a=n.enter(`title${s}`),u+=l.move(" "+i),u+=l.move(n.safe(e.title,{before:u,after:i,...l.current()})),u+=l.move(i),a()),u+=l.move(")"),o(),u}function h3(){return"!"}ck.peek=f3;function ck(e,t,n,r){const i=e.referenceType,s=n.enter("imageReference");let o=n.enter("label");const a=n.createTracker(r);let l=a.move("![");const u=n.safe(e.alt,{before:l,after:"]",...a.current()});l+=a.move(u+"]["),o();const c=n.stack;n.stack=[],o=n.enter("reference");const d=n.safe(n.associationId(e),{before:l,after:"]",...a.current()});return o(),n.stack=c,s(),i==="full"||!u||u!==d?l+=a.move(d+"]"):i==="shortcut"?l=l.slice(0,-1):l+=a.move("]"),l}function f3(){return"!"}dk.peek=p3;function dk(e,t,n){let r=e.value||"",i="`",s=-1;for(;new RegExp("(^|[^`])"+i+"([^`]|$)").test(r);)i+="`";for(/[^ \r\n]/.test(r)&&(/^[ \r\n]/.test(r)&&/[ \r\n]$/.test(r)||/^`|`$/.test(r))&&(r=" "+r+" ");++s<n.unsafe.length;){const o=n.unsafe[s],a=n.compilePattern(o);let l;if(o.atBreak)for(;l=a.exec(r);){let u=l.index;r.charCodeAt(u)===10&&r.charCodeAt(u-1)===13&&u--,r=r.slice(0,u)+" "+r.slice(l.index+1)}}return i+r+i}function p3(){return"`"}function hk(e,t){const n=Df(e);return!!(!t.options.resourceLink&&e.url&&!e.title&&e.children&&e.children.length===1&&e.children[0].type==="text"&&(n===e.url||"mailto:"+n===e.url)&&/^[a-z][a-z+.-]+:/i.test(e.url)&&!/[\0- <>\u007F]/.test(e.url))}fk.peek=m3;function fk(e,t,n,r){const i=qf(n),s=i==='"'?"Quote":"Apostrophe",o=n.createTracker(r);let a,l;if(hk(e,n)){const c=n.stack;n.stack=[],a=n.enter("autolink");let d=o.move("<");return d+=o.move(n.containerPhrasing(e,{before:d,after:">",...o.current()})),d+=o.move(">"),a(),n.stack=c,d}a=n.enter("link"),l=n.enter("label");let u=o.move("[");return u+=o.move(n.containerPhrasing(e,{before:u,after:"](",...o.current()})),u+=o.move("]("),l(),!e.url&&e.title||/[\0- \u007F]/.test(e.url)?(l=n.enter("destinationLiteral"),u+=o.move("<"),u+=o.move(n.safe(e.url,{before:u,after:">",...o.current()})),u+=o.move(">")):(l=n.enter("destinationRaw"),u+=o.move(n.safe(e.url,{before:u,after:e.title?" ":")",...o.current()}))),l(),e.title&&(l=n.enter(`title${s}`),u+=o.move(" "+i),u+=o.move(n.safe(e.title,{before:u,after:i,...o.current()})),u+=o.move(i),l()),u+=o.move(")"),a(),u}function m3(e,t,n){return hk(e,n)?"<":"["}pk.peek=g3;function pk(e,t,n,r){const i=e.referenceType,s=n.enter("linkReference");let o=n.enter("label");const a=n.createTracker(r);let l=a.move("[");const u=n.containerPhrasing(e,{before:l,after:"]",...a.current()});l+=a.move(u+"]["),o();const c=n.stack;n.stack=[],o=n.enter("reference");const d=n.safe(n.associationId(e),{before:l,after:"]",...a.current()});return o(),n.stack=c,s(),i==="full"||!u||u!==d?l+=a.move(d+"]"):i==="shortcut"?l=l.slice(0,-1):l+=a.move("]"),l}function g3(){return"["}function Hf(e){const t=e.options.bullet||"*";if(t!=="*"&&t!=="+"&&t!=="-")throw new Error("Cannot serialize items with `"+t+"` for `options.bullet`, expected `*`, `+`, or `-`");return t}function y3(e){const t=Hf(e),n=e.options.bulletOther;if(!n)return t==="*"?"-":"*";if(n!=="*"&&n!=="+"&&n!=="-")throw new Error("Cannot serialize items with `"+n+"` for `options.bulletOther`, expected `*`, `+`, or `-`");if(n===t)throw new Error("Expected `bullet` (`"+t+"`) and `bulletOther` (`"+n+"`) to be different");return n}function v3(e){const t=e.options.bulletOrdered||".";if(t!=="."&&t!==")")throw new Error("Cannot serialize items with `"+t+"` for `options.bulletOrdered`, expected `.` or `)`");return t}function mk(e){const t=e.options.rule||"*";if(t!=="*"&&t!=="-"&&t!=="_")throw new Error("Cannot serialize rules with `"+t+"` for `options.rule`, expected `*`, `-`, or `_`");return t}function x3(e,t,n,r){const i=n.enter("list"),s=n.bulletCurrent;let o=e.ordered?v3(n):Hf(n);const a=e.ordered?o==="."?")":".":y3(n);let l=t&&n.bulletLastUsed?o===n.bulletLastUsed:!1;if(!e.ordered){const c=e.children?e.children[0]:void 0;if((o==="*"||o==="-")&&c&&(!c.children||!c.children[0])&&n.stack[n.stack.length-1]==="list"&&n.stack[n.stack.length-2]==="listItem"&&n.stack[n.stack.length-3]==="list"&&n.stack[n.stack.length-4]==="listItem"&&n.indexStack[n.indexStack.length-1]===0&&n.indexStack[n.indexStack.length-2]===0&&n.indexStack[n.indexStack.length-3]===0&&(l=!0),mk(n)===o&&c){let d=-1;for(;++d<e.children.length;){const h=e.children[d];if(h&&h.type==="listItem"&&h.children&&h.children[0]&&h.children[0].type==="thematicBreak"){l=!0;break}}}}l&&(o=a),n.bulletCurrent=o;const u=n.containerFlow(e,r);return n.bulletLastUsed=o,n.bulletCurrent=s,i(),u}function w3(e){const t=e.options.listItemIndent||"one";if(t!=="tab"&&t!=="one"&&t!=="mixed")throw new Error("Cannot serialize items with `"+t+"` for `options.listItemIndent`, expected `tab`, `one`, or `mixed`");return t}function k3(e,t,n,r){const i=w3(n);let s=n.bulletCurrent||Hf(n);t&&t.type==="list"&&t.ordered&&(s=(typeof t.start=="number"&&t.start>-1?t.start:1)+(n.options.incrementListMarker===!1?0:t.children.indexOf(e))+s);let o=s.length+1;(i==="tab"||i==="mixed"&&(t&&t.type==="list"&&t.spread||e.spread))&&(o=Math.ceil(o/4)*4);const a=n.createTracker(r);a.move(s+" ".repeat(o-s.length)),a.shift(o);const l=n.enter("listItem"),u=n.indentLines(n.containerFlow(e,a.current()),c);return l(),u;function c(d,h,f){return h?(f?"":" ".repeat(o))+d:(f?s:s+" ".repeat(o-s.length))+d}}function b3(e,t,n,r){const i=n.enter("paragraph"),s=n.enter("phrasing"),o=n.containerPhrasing(e,r);return s(),i(),o}const S3=au(["break","delete","emphasis","footnote","footnoteReference","image","imageReference","inlineCode","inlineMath","link","linkReference","mdxJsxTextElement","mdxTextExpression","strong","text","textDirective"]);function _3(e,t,n,r){return(e.children.some(function(o){return S3(o)})?n.containerPhrasing:n.containerFlow).call(n,e,r)}function C3(e){const t=e.options.strong||"*";if(t!=="*"&&t!=="_")throw new Error("Cannot serialize strong with `"+t+"` for `options.strong`, expected `*`, or `_`");return t}gk.peek=E3;function gk(e,t,n,r){const i=C3(n),s=n.enter("strong"),o=n.createTracker(r),a=o.move(i+i);let l=o.move(n.containerPhrasing(e,{after:i,before:a,...o.current()}));const u=l.charCodeAt(0),c=_l(r.before.charCodeAt(r.before.length-1),u,i);c.inside&&(l=ko(u)+l.slice(1));const d=l.charCodeAt(l.length-1),h=_l(r.after.charCodeAt(0),d,i);h.inside&&(l=l.slice(0,-1)+ko(d));const f=o.move(i+i);return s(),n.attentionEncodeSurroundingInfo={after:h.outside,before:c.outside},a+l+f}function E3(e,t,n){return n.options.strong||"*"}function T3(e,t,n,r){return n.safe(e.value,r)}function P3(e){const t=e.options.ruleRepetition||3;if(t<3)throw new Error("Cannot serialize rules with repetition `"+t+"` for `options.ruleRepetition`, expected `3` or more");return t}function A3(e,t,n){const r=(mk(n)+(n.options.ruleSpaces?" ":"")).repeat(P3(n));return n.options.ruleSpaces?r.slice(0,-1):r}const yk={blockquote:Y5,break:Ky,code:i3,definition:o3,emphasis:ak,hardBreak:Ky,heading:c3,html:lk,image:uk,imageReference:ck,inlineCode:dk,link:fk,linkReference:pk,list:x3,listItem:k3,paragraph:b3,root:_3,strong:gk,text:T3,thematicBreak:A3};function R3(){return{enter:{table:O3,tableData:Jy,tableHeader:Jy,tableRow:j3},exit:{codeText:I3,table:N3,tableData:yc,tableHeader:yc,tableRow:yc}}}function O3(e){const t=e._align;this.enter({type:"table",align:t.map(function(n){return n==="none"?null:n}),children:[]},e),this.data.inTable=!0}function N3(e){this.exit(e),this.data.inTable=void 0}function j3(e){this.enter({type:"tableRow",children:[]},e)}function yc(e){this.exit(e)}function Jy(e){this.enter({type:"tableCell",children:[]},e)}function I3(e){let t=this.resume();this.data.inTable&&(t=t.replace(/\\([\\|])/g,D3));const n=this.stack[this.stack.length-1];n.type,n.value=t,this.exit(e)}function D3(e,t){return t==="|"?t:e}function L3(e){const t=e||{},n=t.tableCellPadding,r=t.tablePipeAlign,i=t.stringLength,s=n?" ":"|";return{unsafe:[{character:"\r",inConstruct:"tableCell"},{character:`
`,inConstruct:"tableCell"},{atBreak:!0,character:"|",after:"[	 :-]"},{character:"|",inConstruct:"tableCell"},{atBreak:!0,character:":",after:"-"},{atBreak:!0,character:"-",after:"[:|-]"}],handlers:{inlineCode:h,table:o,tableCell:l,tableRow:a}};function o(f,p,v,w){return u(c(f,v,w),f.align)}function a(f,p,v,w){const m=d(f,v,w),g=u([m]);return g.slice(0,g.indexOf(`
`))}function l(f,p,v,w){const m=v.enter("tableCell"),g=v.enter("phrasing"),y=v.containerPhrasing(f,{...w,before:s,after:s});return g(),m(),y}function u(f,p){return Q5(f,{align:p,alignDelimiters:r,padding:n,stringLength:i})}function c(f,p,v){const w=f.children;let m=-1;const g=[],y=p.enter("table");for(;++m<w.length;)g[m]=d(w[m],p,v);return y(),g}function d(f,p,v){const w=f.children;let m=-1;const g=[],y=p.enter("tableRow");for(;++m<w.length;)g[m]=l(w[m],f,p,v);return y(),g}function h(f,p,v){let w=yk.inlineCode(f,p,v);return v.stack.includes("tableCell")&&(w=w.replace(/\|/g,"\\$&")),w}}function M3(){return{exit:{taskListCheckValueChecked:Qy,taskListCheckValueUnchecked:Qy,paragraph:F3}}}function B3(){return{unsafe:[{atBreak:!0,character:"-",after:"[:|-]"}],handlers:{listItem:$3}}}function Qy(e){const t=this.stack[this.stack.length-2];t.type,t.checked=e.type==="taskListCheckValueChecked"}function F3(e){const t=this.stack[this.stack.length-2];if(t&&t.type==="listItem"&&typeof t.checked=="boolean"){const n=this.stack[this.stack.length-1];n.type;const r=n.children[0];if(r&&r.type==="text"){const i=t.children;let s=-1,o;for(;++s<i.length;){const a=i[s];if(a.type==="paragraph"){o=a;break}}o===n&&(r.value=r.value.slice(1),r.value.length===0?n.children.shift():n.position&&r.position&&typeof r.position.start.offset=="number"&&(r.position.start.column++,r.position.start.offset++,n.position.start=Object.assign({},r.position.start)))}}this.exit(e)}function $3(e,t,n,r){const i=e.children[0],s=typeof e.checked=="boolean"&&i&&i.type==="paragraph",o="["+(e.checked?"x":" ")+"] ",a=n.createTracker(r);s&&a.move(o);let l=yk.listItem(e,t,n,{...r,...a.current()});return s&&(l=l.replace(/^(?:[*+-]|\d+\.)([\r\n]| {1,3})/,u)),l;function u(c){return c+o}}function U3(){return[x5(),$5(),q5(),R3(),M3()]}function V3(e){return{extensions:[w5(),U5(e),H5(),L3(e),B3()]}}const z3={tokenize:J3,partial:!0},vk={tokenize:Q3,partial:!0},xk={tokenize:X3,partial:!0},wk={tokenize:Y3,partial:!0},q3={tokenize:Z3,partial:!0},kk={name:"wwwAutolink",tokenize:G3,previous:Sk},bk={name:"protocolAutolink",tokenize:K3,previous:_k},On={name:"emailAutolink",tokenize:W3,previous:Ck},cn={};function H3(){return{text:cn}}let gr=48;for(;gr<123;)cn[gr]=On,gr++,gr===58?gr=65:gr===91&&(gr=97);cn[43]=On;cn[45]=On;cn[46]=On;cn[95]=On;cn[72]=[On,bk];cn[104]=[On,bk];cn[87]=[On,kk];cn[119]=[On,kk];function W3(e,t,n){const r=this;let i,s;return o;function o(d){return!eh(d)||!Ck.call(r,r.previous)||Wf(r.events)?n(d):(e.enter("literalAutolink"),e.enter("literalAutolinkEmail"),a(d))}function a(d){return eh(d)?(e.consume(d),a):d===64?(e.consume(d),l):n(d)}function l(d){return d===46?e.check(q3,c,u)(d):d===45||d===95||Ge(d)?(s=!0,e.consume(d),l):c(d)}function u(d){return e.consume(d),i=!0,l}function c(d){return s&&i&&Ze(r.previous)?(e.exit("literalAutolinkEmail"),e.exit("literalAutolink"),t(d)):n(d)}}function G3(e,t,n){const r=this;return i;function i(o){return o!==87&&o!==119||!Sk.call(r,r.previous)||Wf(r.events)?n(o):(e.enter("literalAutolink"),e.enter("literalAutolinkWww"),e.check(z3,e.attempt(vk,e.attempt(xk,s),n),n)(o))}function s(o){return e.exit("literalAutolinkWww"),e.exit("literalAutolink"),t(o)}}function K3(e,t,n){const r=this;let i="",s=!1;return o;function o(d){return(d===72||d===104)&&_k.call(r,r.previous)&&!Wf(r.events)?(e.enter("literalAutolink"),e.enter("literalAutolinkHttp"),i+=String.fromCodePoint(d),e.consume(d),a):n(d)}function a(d){if(Ze(d)&&i.length<5)return i+=String.fromCodePoint(d),e.consume(d),a;if(d===58){const h=i.toLowerCase();if(h==="http"||h==="https")return e.consume(d),l}return n(d)}function l(d){return d===47?(e.consume(d),s?u:(s=!0,l)):n(d)}function u(d){return d===null||kl(d)||ce(d)||$r(d)||iu(d)?n(d):e.attempt(vk,e.attempt(xk,c),n)(d)}function c(d){return e.exit("literalAutolinkHttp"),e.exit("literalAutolink"),t(d)}}function J3(e,t,n){let r=0;return i;function i(o){return(o===87||o===119)&&r<3?(r++,e.consume(o),i):o===46&&r===3?(e.consume(o),s):n(o)}function s(o){return o===null?n(o):t(o)}}function Q3(e,t,n){let r,i,s;return o;function o(u){return u===46||u===95?e.check(wk,l,a)(u):u===null||ce(u)||$r(u)||u!==45&&iu(u)?l(u):(s=!0,e.consume(u),o)}function a(u){return u===95?r=!0:(i=r,r=void 0),e.consume(u),o}function l(u){return i||r||!s?n(u):t(u)}}function X3(e,t){let n=0,r=0;return i;function i(o){return o===40?(n++,e.consume(o),i):o===41&&r<n?s(o):o===33||o===34||o===38||o===39||o===41||o===42||o===44||o===46||o===58||o===59||o===60||o===63||o===93||o===95||o===126?e.check(wk,t,s)(o):o===null||ce(o)||$r(o)?t(o):(e.consume(o),i)}function s(o){return o===41&&r++,e.consume(o),i}}function Y3(e,t,n){return r;function r(a){return a===33||a===34||a===39||a===41||a===42||a===44||a===46||a===58||a===59||a===63||a===95||a===126?(e.consume(a),r):a===38?(e.consume(a),s):a===93?(e.consume(a),i):a===60||a===null||ce(a)||$r(a)?t(a):n(a)}function i(a){return a===null||a===40||a===91||ce(a)||$r(a)?t(a):r(a)}function s(a){return Ze(a)?o(a):n(a)}function o(a){return a===59?(e.consume(a),r):Ze(a)?(e.consume(a),o):n(a)}}function Z3(e,t,n){return r;function r(s){return e.consume(s),i}function i(s){return Ge(s)?n(s):t(s)}}function Sk(e){return e===null||e===40||e===42||e===95||e===91||e===93||e===126||ce(e)}function _k(e){return!Ze(e)}function Ck(e){return!(e===47||eh(e))}function eh(e){return e===43||e===45||e===46||e===95||Ge(e)}function Wf(e){let t=e.length,n=!1;for(;t--;){const r=e[t][1];if((r.type==="labelLink"||r.type==="labelImage")&&!r._balanced){n=!0;break}if(r._gfmAutolinkLiteralWalkedInto){n=!1;break}}return e.length>0&&!n&&(e[e.length-1][1]._gfmAutolinkLiteralWalkedInto=!0),n}const e4={tokenize:l4,partial:!0};function t4(){return{document:{91:{name:"gfmFootnoteDefinition",tokenize:s4,continuation:{tokenize:o4},exit:a4}},text:{91:{name:"gfmFootnoteCall",tokenize:i4},93:{name:"gfmPotentialFootnoteCall",add:"after",tokenize:n4,resolveTo:r4}}}}function n4(e,t,n){const r=this;let i=r.events.length;const s=r.parser.gfmFootnotes||(r.parser.gfmFootnotes=[]);let o;for(;i--;){const l=r.events[i][1];if(l.type==="labelImage"){o=l;break}if(l.type==="gfmFootnoteCall"||l.type==="labelLink"||l.type==="label"||l.type==="image"||l.type==="link")break}return a;function a(l){if(!o||!o._balanced)return n(l);const u=Gt(r.sliceSerialize({start:o.end,end:r.now()}));return u.codePointAt(0)!==94||!s.includes(u.slice(1))?n(l):(e.enter("gfmFootnoteCallLabelMarker"),e.consume(l),e.exit("gfmFootnoteCallLabelMarker"),t(l))}}function r4(e,t){let n=e.length;for(;n--;)if(e[n][1].type==="labelImage"&&e[n][0]==="enter"){e[n][1];break}e[n+1][1].type="data",e[n+3][1].type="gfmFootnoteCallLabelMarker";const r={type:"gfmFootnoteCall",start:Object.assign({},e[n+3][1].start),end:Object.assign({},e[e.length-1][1].end)},i={type:"gfmFootnoteCallMarker",start:Object.assign({},e[n+3][1].end),end:Object.assign({},e[n+3][1].end)};i.end.column++,i.end.offset++,i.end._bufferIndex++;const s={type:"gfmFootnoteCallString",start:Object.assign({},i.end),end:Object.assign({},e[e.length-1][1].start)},o={type:"chunkString",contentType:"string",start:Object.assign({},s.start),end:Object.assign({},s.end)},a=[e[n+1],e[n+2],["enter",r,t],e[n+3],e[n+4],["enter",i,t],["exit",i,t],["enter",s,t],["enter",o,t],["exit",o,t],["exit",s,t],e[e.length-2],e[e.length-1],["exit",r,t]];return e.splice(n,e.length-n+1,...a),e}function i4(e,t,n){const r=this,i=r.parser.gfmFootnotes||(r.parser.gfmFootnotes=[]);let s=0,o;return a;function a(d){return e.enter("gfmFootnoteCall"),e.enter("gfmFootnoteCallLabelMarker"),e.consume(d),e.exit("gfmFootnoteCallLabelMarker"),l}function l(d){return d!==94?n(d):(e.enter("gfmFootnoteCallMarker"),e.consume(d),e.exit("gfmFootnoteCallMarker"),e.enter("gfmFootnoteCallString"),e.enter("chunkString").contentType="string",u)}function u(d){if(s>999||d===93&&!o||d===null||d===91||ce(d))return n(d);if(d===93){e.exit("chunkString");const h=e.exit("gfmFootnoteCallString");return i.includes(Gt(r.sliceSerialize(h)))?(e.enter("gfmFootnoteCallLabelMarker"),e.consume(d),e.exit("gfmFootnoteCallLabelMarker"),e.exit("gfmFootnoteCall"),t):n(d)}return ce(d)||(o=!0),s++,e.consume(d),d===92?c:u}function c(d){return d===91||d===92||d===93?(e.consume(d),s++,u):u(d)}}function s4(e,t,n){const r=this,i=r.parser.gfmFootnotes||(r.parser.gfmFootnotes=[]);let s,o=0,a;return l;function l(p){return e.enter("gfmFootnoteDefinition")._container=!0,e.enter("gfmFootnoteDefinitionLabel"),e.enter("gfmFootnoteDefinitionLabelMarker"),e.consume(p),e.exit("gfmFootnoteDefinitionLabelMarker"),u}function u(p){return p===94?(e.enter("gfmFootnoteDefinitionMarker"),e.consume(p),e.exit("gfmFootnoteDefinitionMarker"),e.enter("gfmFootnoteDefinitionLabelString"),e.enter("chunkString").contentType="string",c):n(p)}function c(p){if(o>999||p===93&&!a||p===null||p===91||ce(p))return n(p);if(p===93){e.exit("chunkString");const v=e.exit("gfmFootnoteDefinitionLabelString");return s=Gt(r.sliceSerialize(v)),e.enter("gfmFootnoteDefinitionLabelMarker"),e.consume(p),e.exit("gfmFootnoteDefinitionLabelMarker"),e.exit("gfmFootnoteDefinitionLabel"),h}return ce(p)||(a=!0),o++,e.consume(p),p===92?d:c}function d(p){return p===91||p===92||p===93?(e.consume(p),o++,c):c(p)}function h(p){return p===58?(e.enter("definitionMarker"),e.consume(p),e.exit("definitionMarker"),i.includes(s)||i.push(s),se(e,f,"gfmFootnoteDefinitionWhitespace")):n(p)}function f(p){return t(p)}}function o4(e,t,n){return e.check(Io,t,e.attempt(e4,t,n))}function a4(e){e.exit("gfmFootnoteDefinition")}function l4(e,t,n){const r=this;return se(e,i,"gfmFootnoteDefinitionIndent",5);function i(s){const o=r.events[r.events.length-1];return o&&o[1].type==="gfmFootnoteDefinitionIndent"&&o[2].sliceSerialize(o[1],!0).length===4?t(s):n(s)}}function u4(e){let n=(e||{}).singleTilde;const r={name:"strikethrough",tokenize:s,resolveAll:i};return n==null&&(n=!0),{text:{126:r},insideSpan:{null:[r]},attentionMarkers:{null:[126]}};function i(o,a){let l=-1;for(;++l<o.length;)if(o[l][0]==="enter"&&o[l][1].type==="strikethroughSequenceTemporary"&&o[l][1]._close){let u=l;for(;u--;)if(o[u][0]==="exit"&&o[u][1].type==="strikethroughSequenceTemporary"&&o[u][1]._open&&o[l][1].end.offset-o[l][1].start.offset===o[u][1].end.offset-o[u][1].start.offset){o[l][1].type="strikethroughSequence",o[u][1].type="strikethroughSequence";const c={type:"strikethrough",start:Object.assign({},o[u][1].start),end:Object.assign({},o[l][1].end)},d={type:"strikethroughText",start:Object.assign({},o[u][1].end),end:Object.assign({},o[l][1].start)},h=[["enter",c,a],["enter",o[u][1],a],["exit",o[u][1],a],["enter",d,a]],f=a.parser.constructs.insideSpan.null;f&&wt(h,h.length,0,su(f,o.slice(u+1,l),a)),wt(h,h.length,0,[["exit",d,a],["enter",o[l][1],a],["exit",o[l][1],a],["exit",c,a]]),wt(o,u-1,l-u+3,h),l=u+h.length-2;break}}for(l=-1;++l<o.length;)o[l][1].type==="strikethroughSequenceTemporary"&&(o[l][1].type="data");return o}function s(o,a,l){const u=this.previous,c=this.events;let d=0;return h;function h(p){return u===126&&c[c.length-1][1].type!=="characterEscape"?l(p):(o.enter("strikethroughSequenceTemporary"),f(p))}function f(p){const v=Vi(u);if(p===126)return d>1?l(p):(o.consume(p),d++,f);if(d<2&&!n)return l(p);const w=o.exit("strikethroughSequenceTemporary"),m=Vi(p);return w._open=!m||m===2&&!!v,w._close=!v||v===2&&!!m,a(p)}}}class c4{constructor(){this.map=[]}add(t,n,r){d4(this,t,n,r)}consume(t){if(this.map.sort(function(s,o){return s[0]-o[0]}),this.map.length===0)return;let n=this.map.length;const r=[];for(;n>0;)n-=1,r.push(t.slice(this.map[n][0]+this.map[n][1]),this.map[n][2]),t.length=this.map[n][0];r.push(t.slice()),t.length=0;let i=r.pop();for(;i;){for(const s of i)t.push(s);i=r.pop()}this.map.length=0}}function d4(e,t,n,r){let i=0;if(!(n===0&&r.length===0)){for(;i<e.map.length;){if(e.map[i][0]===t){e.map[i][1]+=n,e.map[i][2].push(...r);return}i+=1}e.map.push([t,n,r])}}function h4(e,t){let n=!1;const r=[];for(;t<e.length;){const i=e[t];if(n){if(i[0]==="enter")i[1].type==="tableContent"&&r.push(e[t+1][1].type==="tableDelimiterMarker"?"left":"none");else if(i[1].type==="tableContent"){if(e[t-1][1].type==="tableDelimiterMarker"){const s=r.length-1;r[s]=r[s]==="left"?"center":"right"}}else if(i[1].type==="tableDelimiterRow")break}else i[0]==="enter"&&i[1].type==="tableDelimiterRow"&&(n=!0);t+=1}return r}function f4(){return{flow:{null:{name:"table",tokenize:p4,resolveAll:m4}}}}function p4(e,t,n){const r=this;let i=0,s=0,o;return a;function a(E){let L=r.events.length-1;for(;L>-1;){const J=r.events[L][1].type;if(J==="lineEnding"||J==="linePrefix")L--;else break}const B=L>-1?r.events[L][1].type:null,K=B==="tableHead"||B==="tableRow"?S:l;return K===S&&r.parser.lazy[r.now().line]?n(E):K(E)}function l(E){return e.enter("tableHead"),e.enter("tableRow"),u(E)}function u(E){return E===124||(o=!0,s+=1),c(E)}function c(E){return E===null?n(E):G(E)?s>1?(s=0,r.interrupt=!0,e.exit("tableRow"),e.enter("lineEnding"),e.consume(E),e.exit("lineEnding"),f):n(E):te(E)?se(e,c,"whitespace")(E):(s+=1,o&&(o=!1,i+=1),E===124?(e.enter("tableCellDivider"),e.consume(E),e.exit("tableCellDivider"),o=!0,c):(e.enter("data"),d(E)))}function d(E){return E===null||E===124||ce(E)?(e.exit("data"),c(E)):(e.consume(E),E===92?h:d)}function h(E){return E===92||E===124?(e.consume(E),d):d(E)}function f(E){return r.interrupt=!1,r.parser.lazy[r.now().line]?n(E):(e.enter("tableDelimiterRow"),o=!1,te(E)?se(e,p,"linePrefix",r.parser.constructs.disable.null.includes("codeIndented")?void 0:4)(E):p(E))}function p(E){return E===45||E===58?w(E):E===124?(o=!0,e.enter("tableCellDivider"),e.consume(E),e.exit("tableCellDivider"),v):T(E)}function v(E){return te(E)?se(e,w,"whitespace")(E):w(E)}function w(E){return E===58?(s+=1,o=!0,e.enter("tableDelimiterMarker"),e.consume(E),e.exit("tableDelimiterMarker"),m):E===45?(s+=1,m(E)):E===null||G(E)?k(E):T(E)}function m(E){return E===45?(e.enter("tableDelimiterFiller"),g(E)):T(E)}function g(E){return E===45?(e.consume(E),g):E===58?(o=!0,e.exit("tableDelimiterFiller"),e.enter("tableDelimiterMarker"),e.consume(E),e.exit("tableDelimiterMarker"),y):(e.exit("tableDelimiterFiller"),y(E))}function y(E){return te(E)?se(e,k,"whitespace")(E):k(E)}function k(E){return E===124?p(E):E===null||G(E)?!o||i!==s?T(E):(e.exit("tableDelimiterRow"),e.exit("tableHead"),t(E)):T(E)}function T(E){return n(E)}function S(E){return e.enter("tableRow"),P(E)}function P(E){return E===124?(e.enter("tableCellDivider"),e.consume(E),e.exit("tableCellDivider"),P):E===null||G(E)?(e.exit("tableRow"),t(E)):te(E)?se(e,P,"whitespace")(E):(e.enter("data"),A(E))}function A(E){return E===null||E===124||ce(E)?(e.exit("data"),P(E)):(e.consume(E),E===92?O:A)}function O(E){return E===92||E===124?(e.consume(E),A):A(E)}}function m4(e,t){let n=-1,r=!0,i=0,s=[0,0,0,0],o=[0,0,0,0],a=!1,l=0,u,c,d;const h=new c4;for(;++n<e.length;){const f=e[n],p=f[1];f[0]==="enter"?p.type==="tableHead"?(a=!1,l!==0&&(Xy(h,t,l,u,c),c=void 0,l=0),u={type:"table",start:Object.assign({},p.start),end:Object.assign({},p.end)},h.add(n,0,[["enter",u,t]])):p.type==="tableRow"||p.type==="tableDelimiterRow"?(r=!0,d=void 0,s=[0,0,0,0],o=[0,n+1,0,0],a&&(a=!1,c={type:"tableBody",start:Object.assign({},p.start),end:Object.assign({},p.end)},h.add(n,0,[["enter",c,t]])),i=p.type==="tableDelimiterRow"?2:c?3:1):i&&(p.type==="data"||p.type==="tableDelimiterMarker"||p.type==="tableDelimiterFiller")?(r=!1,o[2]===0&&(s[1]!==0&&(o[0]=o[1],d=ga(h,t,s,i,void 0,d),s=[0,0,0,0]),o[2]=n)):p.type==="tableCellDivider"&&(r?r=!1:(s[1]!==0&&(o[0]=o[1],d=ga(h,t,s,i,void 0,d)),s=o,o=[s[1],n,0,0])):p.type==="tableHead"?(a=!0,l=n):p.type==="tableRow"||p.type==="tableDelimiterRow"?(l=n,s[1]!==0?(o[0]=o[1],d=ga(h,t,s,i,n,d)):o[1]!==0&&(d=ga(h,t,o,i,n,d)),i=0):i&&(p.type==="data"||p.type==="tableDelimiterMarker"||p.type==="tableDelimiterFiller")&&(o[3]=n)}for(l!==0&&Xy(h,t,l,u,c),h.consume(t.events),n=-1;++n<t.events.length;){const f=t.events[n];f[0]==="enter"&&f[1].type==="table"&&(f[1]._align=h4(t.events,n))}return e}function ga(e,t,n,r,i,s){const o=r===1?"tableHeader":r===2?"tableDelimiter":"tableData",a="tableContent";n[0]!==0&&(s.end=Object.assign({},oi(t.events,n[0])),e.add(n[0],0,[["exit",s,t]]));const l=oi(t.events,n[1]);if(s={type:o,start:Object.assign({},l),end:Object.assign({},l)},e.add(n[1],0,[["enter",s,t]]),n[2]!==0){const u=oi(t.events,n[2]),c=oi(t.events,n[3]),d={type:a,start:Object.assign({},u),end:Object.assign({},c)};if(e.add(n[2],0,[["enter",d,t]]),r!==2){const h=t.events[n[2]],f=t.events[n[3]];if(h[1].end=Object.assign({},f[1].end),h[1].type="chunkText",h[1].contentType="text",n[3]>n[2]+1){const p=n[2]+1,v=n[3]-n[2]-1;e.add(p,v,[])}}e.add(n[3]+1,0,[["exit",d,t]])}return i!==void 0&&(s.end=Object.assign({},oi(t.events,i)),e.add(i,0,[["exit",s,t]]),s=void 0),s}function Xy(e,t,n,r,i){const s=[],o=oi(t.events,n);i&&(i.end=Object.assign({},o),s.push(["exit",i,t])),r.end=Object.assign({},o),s.push(["exit",r,t]),e.add(n+1,0,s)}function oi(e,t){const n=e[t],r=n[0]==="enter"?"start":"end";return n[1][r]}const g4={name:"tasklistCheck",tokenize:v4};function y4(){return{text:{91:g4}}}function v4(e,t,n){const r=this;return i;function i(l){return r.previous!==null||!r._gfmTasklistFirstContentOfListItem?n(l):(e.enter("taskListCheck"),e.enter("taskListCheckMarker"),e.consume(l),e.exit("taskListCheckMarker"),s)}function s(l){return ce(l)?(e.enter("taskListCheckValueUnchecked"),e.consume(l),e.exit("taskListCheckValueUnchecked"),o):l===88||l===120?(e.enter("taskListCheckValueChecked"),e.consume(l),e.exit("taskListCheckValueChecked"),o):n(l)}function o(l){return l===93?(e.enter("taskListCheckMarker"),e.consume(l),e.exit("taskListCheckMarker"),e.exit("taskListCheck"),a):n(l)}function a(l){return G(l)?t(l):te(l)?e.check({tokenize:x4},t,n)(l):n(l)}}function x4(e,t,n){return se(e,r,"whitespace");function r(i){return i===null?n(i):t(i)}}function w4(e){return D1([H3(),t4(),u4(e),f4(),y4()])}const k4={};function b4(e){const t=this,n=e||k4,r=t.data(),i=r.micromarkExtensions||(r.micromarkExtensions=[]),s=r.fromMarkdownExtensions||(r.fromMarkdownExtensions=[]),o=r.toMarkdownExtensions||(r.toMarkdownExtensions=[]);i.push(w4(n)),s.push(U3()),o.push(V3(n))}function S4(){const{worldId:e}=ef(),t=ur(),n=CR(Number(e)),r=ln.find(p=>p.id===Number(e)),[i,s]=C.useState(!0),[o,a]=C.useState(""),l=C.useRef(null),[u,c]=C.useState(!1),d=C.useMemo(()=>{if(!n)return[];const p=[],v=n.split(`
`);for(const w of v){const m=w.match(/^## (.+)/),g=w.match(/^### (.+)/);m?p.push({level:2,text:m[1],id:fs(m[1])}):g&&p.push({level:3,text:g[1],id:fs(g[1])})}return p},[n]);C.useEffect(()=>{if(!t.hash)return;const p=decodeURIComponent(t.hash.slice(1)),v=setTimeout(()=>{var m;const w=(m=l.current)==null?void 0:m.querySelector(`#${CSS.escape(p)}`);w&&(w.scrollIntoView({behavior:"smooth",block:"start"}),a(p))},300);return()=>clearTimeout(v)},[t.hash]),C.useEffect(()=>{const p=l.current;if(!p)return;const v=()=>{c(p.scrollTop>400);const w=p.querySelectorAll("h2, h3");let m="";for(const g of w){const y=g.getBoundingClientRect(),k=p.getBoundingClientRect();y.top-k.top<120&&(m=g.id)}m&&a(m)};return p.addEventListener("scroll",v),()=>p.removeEventListener("scroll",v)},[]);const h=p=>{var w;const v=(w=l.current)==null?void 0:w.querySelector(`#${CSS.escape(p)}`);v&&v.scrollIntoView({behavior:"smooth",block:"start"})},f=()=>{var p;(p=l.current)==null||p.scrollTo({top:0,behavior:"smooth"})};return!n||!r?x.jsxs("div",{className:"max-w-4xl mx-auto p-6 text-center py-20",children:[x.jsx("p",{className:"text-slate-500 text-lg",children:"找不到這個世界的講義"}),x.jsx(Fe,{to:"/di-quest/map",className:"btn-primary inline-block mt-4",children:"返回地圖"})]}):x.jsxs("div",{className:"h-[calc(100vh-73px)] flex",children:[x.jsx("aside",{className:`${i?"w-72":"w-0"} flex-shrink-0 border-r border-slate-700 bg-slate-900/50 overflow-hidden transition-all duration-300`,children:x.jsxs("div",{className:"w-72 h-full overflow-y-auto p-4",children:[x.jsxs("div",{className:"flex items-center gap-2 mb-4 pb-3 border-b border-slate-700",children:[x.jsx(jr,{className:"w-4 h-4 text-brand-primary"}),x.jsx("span",{className:"text-white font-medium text-sm",children:"目錄"})]}),x.jsx("nav",{className:"space-y-1",children:d.map(p=>x.jsx("button",{onClick:()=>h(p.id),className:`block w-full text-left text-sm py-1.5 px-2 rounded transition-colors ${p.level===3?"pl-6":""} ${o===p.id?"text-brand-primary bg-brand-primary/10":"text-slate-400 hover:text-white hover:bg-slate-800"}`,children:p.text},p.id))})]})}),x.jsxs("div",{className:"flex-1 flex flex-col min-w-0",children:[x.jsxs("div",{className:"flex items-center justify-between px-6 py-3 border-b border-slate-700 bg-slate-900/50 flex-shrink-0",children:[x.jsxs("div",{className:"flex items-center gap-4",children:[x.jsx(Fe,{to:"/di-quest/map",className:"text-slate-400 hover:text-white transition-colors",children:x.jsx(tf,{className:"w-5 h-5"})}),x.jsxs("div",{children:[x.jsx("span",{className:"text-2xl mr-2",children:r.emoji}),x.jsxs("span",{className:"text-white font-medium",children:[r.name," — 講義"]})]})]}),x.jsxs("div",{className:"flex items-center gap-3",children:[x.jsx("button",{onClick:()=>s(!i),className:"px-3 py-1.5 text-slate-400 hover:text-white text-sm border border-slate-700 rounded transition-colors",children:i?"隱藏目錄":"顯示目錄"}),x.jsx(Fe,{to:"/di-quest/map",className:"px-4 py-1.5 bg-brand-primary text-white text-sm rounded hover:bg-blue-600 transition-colors",children:"開始挑戰"})]})]}),x.jsx("div",{ref:l,className:"flex-1 overflow-y-auto",children:x.jsx("article",{className:"max-w-4xl mx-auto px-8 py-8 lesson-content",children:x.jsx(u5,{remarkPlugins:[b4],components:{h1:({children:p})=>{const v=fs(String(p));return x.jsx("h1",{id:v,className:"text-3xl font-bold text-white mb-6 mt-2",children:p})},h2:({children:p})=>{const v=fs(String(p));return x.jsx("h2",{id:v,className:"text-2xl font-bold text-white mb-4 mt-10 pb-2 border-b border-slate-700 scroll-mt-4",children:p})},h3:({children:p})=>{const v=fs(String(p));return x.jsx("h3",{id:v,className:"text-xl font-semibold text-white mb-3 mt-8 scroll-mt-4",children:p})},p:({children:p})=>x.jsx("p",{className:"text-slate-300 leading-relaxed mb-4",children:p}),strong:({children:p})=>x.jsx("strong",{className:"text-white font-semibold",children:p}),em:({children:p})=>x.jsx("em",{className:"text-slate-400 italic",children:p}),blockquote:({children:p})=>x.jsx("blockquote",{className:"border-l-4 border-brand-primary pl-4 my-4 bg-brand-primary/5 py-3 pr-4 rounded-r-lg",children:p}),ul:({children:p})=>x.jsx("ul",{className:"list-disc list-inside text-slate-300 mb-4 space-y-1",children:p}),ol:({children:p})=>x.jsx("ol",{className:"list-decimal list-inside text-slate-300 mb-4 space-y-1",children:p}),li:({children:p})=>x.jsx("li",{className:"text-slate-300",children:p}),hr:()=>x.jsx("hr",{className:"border-slate-700 my-8"}),a:({href:p,children:v})=>x.jsx("a",{href:p,className:"text-brand-primary hover:underline",target:"_blank",rel:"noopener noreferrer",children:v}),code:({inline:p,className:v,children:w})=>{if(p)return x.jsx("code",{className:"bg-slate-800 text-brand-accent px-1.5 py-0.5 rounded text-sm font-mono",children:w});const m=(v==null?void 0:v.replace("language-",""))||"";return x.jsxs("div",{className:"relative my-4",children:[m&&x.jsx("div",{className:"absolute top-0 right-0 px-2 py-1 text-xs text-slate-500 bg-slate-800 rounded-bl rounded-tr-lg",children:m}),x.jsx("pre",{className:"bg-slate-900 border border-slate-700 rounded-lg p-4 overflow-x-auto",children:x.jsx("code",{className:"text-sm font-mono text-slate-300 leading-relaxed",children:w})})]})},table:({children:p})=>x.jsx("div",{className:"overflow-x-auto my-4",children:x.jsx("table",{className:"min-w-full border border-slate-700 rounded-lg overflow-hidden",children:p})}),thead:({children:p})=>x.jsx("thead",{className:"bg-slate-800",children:p}),th:({children:p})=>x.jsx("th",{className:"px-4 py-2 text-left text-sm font-medium text-white border-b border-slate-700",children:p}),td:({children:p})=>x.jsx("td",{className:"px-4 py-2 text-sm text-slate-300 border-b border-slate-800",children:p}),tr:({children:p})=>x.jsx("tr",{className:"hover:bg-slate-800/50",children:p})},children:n})})}),u&&x.jsx("button",{onClick:f,className:"fixed bottom-24 right-24 w-10 h-10 bg-slate-800 border border-slate-700 rounded-full flex items-center justify-center text-slate-400 hover:text-white hover:bg-slate-700 transition-colors shadow-lg z-50",children:x.jsx(EC,{className:"w-5 h-5"})})]})]})}function fs(e){return e.toLowerCase().replace(/[^\w\u4e00-\u9fff\s-]/g,"").replace(/\s+/g,"-").replace(/-+/g,"-").trim()}function _4(){return x.jsx(eC,{children:x.jsxs(Ft,{path:"/",element:x.jsx(UC,{}),children:[x.jsxs(Ft,{path:"di-quest",element:x.jsx(VC,{}),children:[x.jsx(Ft,{index:!0,element:x.jsx(_g,{})}),x.jsx(Ft,{path:"map",element:x.jsx(_g,{})}),x.jsx(Ft,{path:"quest/:worldId/:questId",element:x.jsx(l2,{})}),x.jsx(Ft,{path:"arena/:worldId/:questId/:challengeId?",element:x.jsx(AR,{})}),x.jsx(Ft,{path:"lesson/:worldId",element:x.jsx(S4,{})}),x.jsx(Ft,{path:"progress",element:x.jsx(RR,{})}),x.jsx(Ft,{path:"chat",element:x.jsx(Oj,{})})]}),x.jsx(Ft,{index:!0,element:x.jsx(Y_,{to:"/di-quest",replace:!0})})]})})}vc.createRoot(document.getElementById("root")).render(x.jsx(rn.StrictMode,{children:x.jsx(lC,{children:x.jsx(xC,{children:x.jsx(_4,{})})})}));
