var Article;Article=(function(){function Article(element){this.element=element;this.id=this.element.getAttribute('data-url').replace(/\//g,'');this.container=this.createContainer();this.thread=new Thread(this);this.fetchComments();this.bindEvents()};Article.prototype.createBlocks=function(){return this.blocks=[].slice.call(this.element.querySelectorAll(CarnivalOptions.block_selector)).map((function(_this){return function(blockElement,index){return new Block(blockElement,_this.id)}})(this))};Article.prototype.insertBlocksIntoDom=function(){var block,_i,_len,_ref,_results;_ref=this.blocks;_results=[];for(_i=0,_len=_ref.length;_i<_len;_i++){block=_ref[_i];block.setComments(this.commentData.filter((function(_this){return function(comment){return comment.thread===block.id()}})(this)));_results.push(block.insert())};return _results};Article.prototype.bindEvents=function(){this.element.addEventListener('commenting',(function(_this){return function(event){Carnival.addClass(_this.element,'commenting');return _this.thread.displayForBlock(event.detail)}})(this));return this.element.addEventListener('doneCommenting',(function(_this){return function(){if(_this.element.querySelectorAll('.commenting').length===0)return Carnival.removeClass(_this.element,'commenting')}})(this))};Article.prototype.fetchComments=function(){return Carnival.get('/comments?article='+this.id,(function(_this){return function(data){_this.commentData=data.comments;_this.createBlocks();return _this.insertBlocksIntoDom()}})(this))};Article.prototype.createContainer=function(){var container;container=document.createElement('div');container.className='carnival';this.element.insertBefore(container,this.element.firstChild);return container};return Article})();var Block,__bind=function(fn,me){return function(){return fn.apply(me,arguments)}};Block=(function(){function Block(element,articleId){this.element=element;this.articleId=articleId;this.deactivate=__bind(this.deactivate,this);this.activate=__bind(this.activate,this);this.bindEvents();this._key=this.element.id=this.generateKey();this.comments=[];this.indicator=new Indicator(this)};Block.prototype.id=function(){return this._key};Block.prototype.bindEvents=function(){this.element.addEventListener('mouseenter',(function(_this){return function(){return _this.indicator.show()}})(this));return this.element.addEventListener('mouseleave',(function(_this){return function(){return _this.indicator.hide()}})(this))};Block.prototype.insert=function(){return this.parent().insertBefore(this.indicator.element,this.element)};Block.prototype.content=function(){return(this.element.innerText||this.element.textContent||'').replace(/[^a-z\. ]+/gi,'')};Block.prototype.generateKey=function(){var content,first,i,k,key,last,len,lines,max,_i,_ref;key="";len=6;content=this.content();if(content&&content.length>1){lines=this.getSentences(content);if(lines.length){first=this.cleanArray(lines[0].replace(/[\s\s]+/gi,' ').split(' ')).slice(0,len/2);last=this.cleanArray(lines[lines.length-1].replace(/[\s\s]+/gi,' ').split(' ')).slice(0,len/2);k=first.concat(last);max=k.length>len?len:k.length;for(i=_i=0,_ref=max-1;0<=_ref?_i<=_ref:_i>=_ref;i=0<=_ref?++_i:--_i)key+=k[i].substring(0,1)}};if(key==="")key=this.keyFromMarkup();return key};Block.prototype.getSentences=function(el){var d,extList,geoList,html,item,len,lines,list,mrsList,numList,topList,webList,_i,_j,_k,_len,_len1,_len2;html=typeof el==="string"?el:el.innerHTML;mrsList="Mr,Ms,Mrs,Miss,Msr,Dr,Gov,Pres,Sen,Prof,Gen,Rep,St,Messrs,Col,Sr,Jf,Ph,Sgt,Mgr,Fr,Rev,No,Jr,Snr";topList="A,B,C,D,E,F,G,H,I,J,K,L,M,m,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,etc,oz,cf,viz,sc,ca,Ave,St";geoList="Calif,Mass,Penn,AK,AL,AR,AS,AZ,CA,CO,CT,DC,DE,FL,FM,GA,GU,HI,IA,ID,IL,IN,KS,KY,LA,MA,MD,ME,MH,MI,MN,MO,MP,MS,MT,NC,ND,NE,NH,NJ,NM,NV,NY,OH,OK,OR,PA,PR,PW,RI,SC,SD,TN,TX,UT,VA,VI,VT,WA,WI,WV,WY,AE,AA,AP,NYC,GB,IRL,IE,UK,GB,FR";numList="0,1,2,3,4,5,6,7,8,9";webList="aero,asia,biz,cat,com,coop,edu,gov,info,int,jobs,mil,mobi,museum,name,net,org,pro,tel,travel,xxx";extList="www";d="__DOT__";list=(topList+","+geoList+","+numList+","+extList).split(",");len=list.length;for(_i=0,_len=list.length;_i<_len;_i++){item=list[_i];html=html.replace(new RegExp(" "+item+"\\.","g")," "+item+d)};list=(mrsList+","+numList).split(",");for(_j=0,_len1=list.length;_j<_len1;_j++){item=list[_j];html=html.replace(new RegExp(item+"\\.","g"),item+d)};list=webList.split(",");for(_k=0,_len2=list.length;_k<_len2;_k++){item=list[_k];html=html.replace(new RegExp("\\."+item,"g"),d+item)};lines=this.cleanArray(html.split('. '));return lines};Block.prototype.cleanArray=function(array){return array.filter(function(item){return item&&item.replace(/\s/g,"")})};Block.prototype.parent=function(){return this.element.parentNode};Block.prototype.setComments=function(commentData){this.comments=commentData.map(function(comment){return new Comment(comment)});return this.indicator.setCount(this.comments.length)};Block.prototype.activate=function(){Carnival.addClass(this.element,'commenting');return this.element.dispatchEvent(new CustomEvent("commenting",{bubbles:true,detail:this}))};Block.prototype.deactivate=function(){Carnival.removeClass(this.element,'commenting');return this.element.dispatchEvent(new CustomEvent("doneCommenting",{bubbles:true,detail:this}))};Block.prototype.top=function(){return this.element.offsetTop-this.element.scrollTop+this.element.clientTop};Block.prototype.keyFromMarkup=function(){if(this.element.querySelector('img')!=null){return this.element.querySelector('img').src.replace(/[^a-z ]+/gi,'')}else return ''};return Block})();var Comment;Comment=(function(){function Comment(comment){this.comment=comment;this.createElement()};Comment.prototype.id=function(){return 'comment-'+this.comment.id};Comment.prototype.createElement=function(){this.element=document.createElement('li');this.element.id=this.id();this.element.className='comment';return this.element.innerHTML="<div class='author'><img src='"+this.comment.gravatar_url+"'><span>"+this.comment.user_name+"</span></div><div class='body'>"+this.comment.body_html+"</div>"};Comment.prototype.insert=function(listElement){listElement.appendChild(this.element);return CarnivalOptions.onNewComment(this)};return Comment})();var CommentForm;CommentForm=(function(){function CommentForm(thread){this.thread=thread;this.createElement();this.bindEvents()};CommentForm.prototype.createElement=function(){this.element=document.createElement('li');this.element.id='comment-form';this.element.className='comment-form';return this.element.innerHTML="<a class='create'><span>+</span> Leave a comment</a><form><a class='cancel'>✖</a><div class='author'><img src=''><span></span></div><textarea placeholder='Type here&hellip;' class='body'></textarea><input type='submit' value='Comment'></form>"};CommentForm.prototype.body=function(){return this.element.querySelector('.body').value};CommentForm.prototype.resizeTextarea=function(){if(this.scrollHeight>this.clientHeight)return this.style.height=this.scrollHeight+"px"};CommentForm.prototype.bindEvents=function(){this.element.querySelector('textarea').addEventListener('keyup',this.resizeTextarea);this.element.addEventListener('submit',(function(_this){return function(event){event.preventDefault();event.stopPropagation();return _this.saveComment()}})(this));this.element.querySelector('a.create').addEventListener('click',(function(_this){return function(event){event.preventDefault();event.stopPropagation();if(Carnival.isLoggedIn()){return _this.showCommentForm()}else return Carnival.login()}})(this));this.element.querySelector('a.cancel').addEventListener('click',(function(_this){return function(event){event.preventDefault();event.stopPropagation();return _this.hideCommentForm()}})(this));this.element.querySelector('textarea').addEventListener('keydown',(function(_this){return function(event){if(event.keyCode===13&&event.metaKey)return _this.saveComment()}})(this));return document.addEventListener('hasLoggedIn',(function(_this){return function(){return _this.showCommentForm()}})(this))};CommentForm.prototype.hasBody=function(){return this.body().replace(/\s/g,'').length>4};CommentForm.prototype.showCommentForm=function(){this.element.querySelector('a').style.display='none';this.element.querySelector('form').style.display='block';this.element.querySelector('.author span').innerHTML=Carnival.userName();this.element.querySelector('.author img').src=Carnival.userGravatarUrl();return this.element.querySelector('.body').focus()};CommentForm.prototype.hideCommentForm=function(){this.element.querySelector('form').style.display='none';return this.element.querySelector('a').style.display='block'};CommentForm.prototype.saveComment=function(){if(this.hasBody()){this.thread.add(this.body());return this.element.querySelector('.body').value=''}};return CommentForm})();var Indicator,__bind=function(fn,me){return function(){return fn.apply(me,arguments)}};Indicator=(function(){function Indicator(block){this.block=block;this.toggle=__bind(this.toggle,this);this.deactivate=__bind(this.deactivate,this);this.activate=__bind(this.activate,this);this.createElement=__bind(this.createElement,this);this.createElement();this.active=false;this.bindEvents();this.count=0};Indicator.prototype.id=function(){return this.block.id()+'-indicator'};Indicator.prototype.createElement=function(){this.element=document.createElement('div');this.element.id=this.id();this.element.setAttribute('data-indicator-for',this.block.id());this.element.className='comment-indicator';return this.element.innerHTML="<span class='count'></span>"+this.iconHTML()};Indicator.prototype.iconHTML=function(){return '<svg><path d="M0.848275862,0 C0.38,0 0,0.508615385 0,1.13538462 L0,18.4006154 C0,19.0273846 0.38,19.536 0.848275862,19.536 L4.16896552,19.536 L4.16896552,22.8 C4.16896552,23.6815385 4.60068966,23.9704615 5.12758621,23.4433846 L9.03448276,19.5369231 L19.2206897,19.5369231 C19.6889655,19.5369231 20.0689655,19.0283077 20.0689655,18.4015385 L20.0689655,1.13538462 C20.0696552,0.508615385 19.6896552,3.68935651e-15 19.2213793,3.68935651e-15 L0.848275862,0 Z"></path></svg>'};Indicator.prototype.bindEvents=function(){this.element.addEventListener('mouseenter',(function(_this){return function(){return _this.show()}})(this));this.element.addEventListener('mouseleave',(function(_this){return function(){return _this.hide()}})(this));this.element.addEventListener('click',(function(_this){return function(){return _this.toggle()}})(this));return document.addEventListener('commenting',(function(_this){return function(event){if(_this.active&&event.detail!==_this.block){_this.deactivate();return _this.hide()}}})(this))};Indicator.prototype.activate=function(){this.active=true;Carnival.addClass(this.element,'commenting');return this.block.activate()};Indicator.prototype.deactivate=function(){this.active=false;Carnival.removeClass(this.element,'commenting');return this.block.deactivate()};Indicator.prototype.toggle=function(){if(this.active){return this.deactivate()}else return this.activate()};Indicator.prototype.hide=function(){if(!(this.active||this.hasComments()))return this.element.style.opacity='0'};Indicator.prototype.show=function(){return this.element.style.opacity='1'};Indicator.prototype.setCount=function(count){this.count=count;this.countElement().innerHTML=this.displayCount();return this.showIfComments()};Indicator.prototype.displayCount=function(){if(this.count>0){return this.count}else return '+'};Indicator.prototype.countElement=function(){return this.element.querySelector(':scope > .count')};Indicator.prototype.showIfComments=function(){if(this.hasComments())return this.show()};Indicator.prototype.hasComments=function(){return this.count>0};return Indicator})();var Thread,__bind=function(fn,me){return function(){return fn.apply(me,arguments)}};Thread=(function(){function Thread(article){this.article=article;this.createElement=__bind(this.createElement,this);this.createElement();this.renderCommentForm();this.active=false};Thread.prototype.id=function(){return this.currentBlock.id()+'-comments'};Thread.prototype.createElement=function(){return this.element=document.createElement('ol')};Thread.prototype.setupElement=function(){this.element.id=this.id();this.element.setAttribute('data-comments-for',this.currentBlock.id());return this.element.className='comments'};Thread.prototype.displayForBlock=function(currentBlock){this.currentBlock=currentBlock;this.setupElement();this.insertCommentsIntoDom();this.renderCommentForm();this.article.container.insertBefore(this.element,this.article.container.lastChild);return this.element.style.top=this.currentBlock.top()+'px'};Thread.prototype.comments=function(){return this.currentBlock.comments};Thread.prototype.removeAllComments=function(){return [].slice.call(this.element.querySelectorAll('li.comment')).map((function(_this){return function(comment){return _this.element.removeChild(comment)}})(this))};Thread.prototype.insertCommentsIntoDom=function(){var comment,_i,_len,_ref,_results;this.removeAllComments();_ref=this.comments();_results=[];for(_i=0,_len=_ref.length;_i<_len;_i++){comment=_ref[_i];_results.push(comment.insert(this.element))};return _results};Thread.prototype.renderCommentForm=function(){if(this.commentForm==null)this.commentForm=new CommentForm(this);return this.element.appendChild(this.commentForm.element)};Thread.prototype.add=function(body){return Carnival.post('/comments',this.commentHash(body),(function(_this){return function(response){var comment;comment=new Comment(response.comment);_this.comments().push(comment);_this.currentBlock.indicator.setCount(_this.comments().length);comment.insert(_this.element);return _this.renderCommentForm()}})(this))};Thread.prototype.commentHash=function(body){return {article:this.article.id,thread:this.currentBlock.id(),body:body}};return Thread})();var Carnival;Carnival=(function(){function Carnival(){this.setOptionsFromDefaults();if(CarnivalOptions.enabled){this.elements=document.querySelectorAll(CarnivalOptions.article_selector);this.articles=[].slice.call(this.elements).map(function(articleElement){return new Article(articleElement)})}};Carnival.defaults={article_selector:'article',block_selector:':scope > p, :scope > pre',enabled:true,onNewComment:function(comment){}};Carnival.prototype.setOptionsFromDefaults=function(){var property,_results;_results=[];for(property in Carnival.defaults)if(!(property in CarnivalOptions)){_results.push(CarnivalOptions[property]=Carnival.defaults[property])}else _results.push(void 0);return _results};Carnival.hasClass=function(elem,className){return new RegExp(' '+className+' ').test(' '+elem.className+' ')};Carnival.addClass=function(elem,className){if(!this.hasClass(elem,className))return elem.className+=' '+className};Carnival.removeClass=function(elem,className){var newClass;newClass=' '+elem.className.replace(/[\t\r\n]/g,' ')+' ';if(this.hasClass(elem,className)){while(newClass.indexOf(' '+className+' ')>=0){newClass=newClass.replace(' '+className+' ',' ')};return elem.className=newClass.replace(/\^s+|\s+$/g,'')}};Carnival.get=function(url,callback){var request;request=new XMLHttpRequest;request.withCredentials=true;request.open('GET','http://'+CarnivalOptions.host+url,true);request.setRequestHeader('Content-Type','application/json');request.onload=function(){if(request.status>=200&&request.status<400)return callback(JSON.parse(request.responseText))};return request.send()};Carnival.post=function(url,data,callback){var request;request=new XMLHttpRequest();request.withCredentials=true;request.open('POST','http://'+CarnivalOptions.host+url,true);request.setRequestHeader('Content-Type','application/json');request.onload=function(){if(request.status>=200&&request.status<400)return callback(JSON.parse(this.responseText))};return request.send(JSON.stringify(data))};Carnival.userName=function(){return Carnival.user.first_name+' '+Carnival.user.last_name};Carnival.userGravatarUrl=function(){return Carnival.user.gravatar_url};Carnival.isLoggedIn=function(){this.getUser();if(this.user!=null){return true}else return false};Carnival.getUser=function(){var request;request=new XMLHttpRequest;request.withCredentials=true;request.open('GET','http://'+CarnivalOptions.host+'/user',false);request.send();if(request.status===200)return this.user=JSON.parse(request.responseText).user};Carnival.hasLoggedIn=function(event){if(event.origin!=='http://'+CarnivalOptions.host)return;Carnival.loginWindow.close();Carnival.getUser();return document.dispatchEvent(new CustomEvent("hasLoggedIn",{bubbles:true}))};Carnival.login=function(){var height,left,top,width;width=600;height=600;left=(screen.width/2)-(width/2);top=(screen.height/2)-(height/2);this.loginWindow=window.open('http://'+CarnivalOptions.host+'/auth/page/learn/forward','carnivalLogin','height='+height+',width='+width+',top='+top+',left='+left+',menubar=no');return window.addEventListener('message',this.hasLoggedIn)};return Carnival})();var carnival;carnival=new Carnival()