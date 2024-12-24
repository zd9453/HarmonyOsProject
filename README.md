### 实用快捷键：

---

- **ctrl+F12 / alt+7** ：    
  *打开代码结构树，快速查看文件代码的结构树，包括全局变量和函数，类成员变量和方法等，并可以跳转到对应代码行*


- **Ctrl + Alt + L** ：   
  *可以快速对选定范围的代码进行格式化*


- **鼠标右键 > Find Usages或 Alt +F7** ：  
  *可点击图标查看变量赋值位置，点击图标查看变量引用情况*


- **单击弹窗右下角Show in API Reference** ：   
  *可以快速查阅更详细的API文档*


- **Ctrl+H** ：   
  *或在菜单栏Navigate页签下选择Type Hierarchy，在弹出的Hierarchy窗口中查看接口/类的继承关系结构*

---

- **提取公共样式**

```ArkTs
@Extend(Image)
function titleImageStyle(click?: () => void) {   
    .width(TITLE_LAYOUT_HEIGHT)   
    .padding(10)   
    .aspectRatio(1)   
    .onClick(click)   
}
```

*使用*

```javascript
Image($r('app.media.ic_public_view_grid'))
    .titleImageStyle(() => { //点击事件
        console.log(">>>>", 'icon click')
    })
```

---

