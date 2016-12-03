---
title: Salesforce Apex XMLDOMクラス
---

XMLDomクラスは[Force.com Code Share](http://developer.force.com/codeshare/projectpage?id=a0630000002ahp5AAA)からダウンロードする。

```
public void main() {
	String xml = 
		'<?xml version="1.0" encoding="utf-8"?>' +
		'<users>' + 
			'<user id="1">' +
				'<firstname>山田</firstname>' +
				'<lastname>太郎</lastname>' +
				'<age>30</age>' +
			'</user>' +
			'<user id="2">' +
				'<firstname>田中</firstname>' +
				'<lastname>二郎</lastname>' +
				'<age>24</age>' +
			'</user>' +
			'<user id="3">' +
				'<firstname>山本</firstname>' +
				'<lastname>三郎</lastname>' +
				'<age>24</age>' +
			'</user>' +
		'</users>';

	XMLDom root = new XMLDom(xml);

	XMLDom.Element users = root.ownerDocument().firstChild();
	List<XMLDom.Element> elements = users.childNodes;
	//List<XMLDom.Element> elements = root.getElementsByTagName('users');

	for (XMLDom.Element user : elements) {
		user.dump(); // user-> {id=1}
		//user.nodeName;// 'user'
		String id = user.getAttribute('id');
		String firstname = user.getElementByTagName('firstname').nodeValue;
		String lastname = user.getValue('lastname');
		String age = user.getElementsByPath('/users/user/age').get(0).nodeValue;
		user.path();// /users/user
	}
}
```

