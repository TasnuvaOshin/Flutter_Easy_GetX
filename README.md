# Flutter Easy GetX 


<div>
<img src="https://github.com/TasnuvaOshin/Flutter_Easy_GetX/blob/main/Screenshot%202021-07-29%20at%204.39.04%20AM.png" width="300" height="512"/>
</div>

## Description

People ask me how I manage state,dependency,routes etc when I work with flutter,Here is the Simple Berief About GetX which I'm using for Dummy Basic Ecommerce Concept based flutter app development . 
Here I cover 
##
* State Management 
* Route Management
* Dependency Management 
* Internationalization
* Storage



## Getting Started

### Dependencies


dependencies:
  get: ^4.3.0
  
  get_storage: ^2.0.3

### Installing

* flutter pub add get

### Executing program
##
* State Management 

```
class Purchase extends GetxController {
  var products = <Product>[].obs;
  .........
 
```
obs to observe the products that can be changed. similarly when any user will do add to cart it needs to be observed so 

```
class DemoController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;
   
```
For More Check Out the Controller and Home.dart and Demo.dart 
##
* Route Management

Initialize the routes in main.dart 

```
  routes: {
          //routes for named navigation
          '/': (context) => HomePage(),
          '/cart': (context) => DemoPage(),
        },
        
        -------
 
```

Now You can called By named route using getX.

```
  IconButton(
                      onPressed: () => Get.toNamed('/cart',
                          arguments:
                              "Home Page To Demo Page -> Passing arguments"), //sending arguments 
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ))
     ......
 
```
##
* Dependency Management
handle controller for Dependency Injection (Controller).
```
 
  final var ctrl = Get.put(DemoController());
  .......
 
```
After you add this once in your project you can find it out , you dont need to re connect  it again and again Just Use Get.find()

```
 
 final DemoController ctrl = Get
      .find(); //getting the cart controller , you can show amount or anything
  .......
 
```

##
* Internationalization 

Change Theme or Language Easily . here is the demo 
main.dart
```
 
void main() async {
  await GetStorage.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final DemoController ctrl = Get.put(DemoController());
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (_) {
      // for darkmode instant change
      return GetMaterialApp(
        //for navigation dont forget to use GetMaterialApp
        title: 'Easy GetX',
        theme: ctrl.theme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          //routes for named navigation
          '/': (context) => HomePage(),
          '/cart': (context) => DemoPage(),
        },
      );
    });
  }
}

 
```

in the controller End :

```
 
 bool get isDark => storage.read('darkmode') ?? false;
  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  void changeTheme(bool val) => storage.write('darkmode', val);

  .......
 

```
to trigger it from anywhere [Checkout the DemoPage.dart file]
```
SwitchListTile(
              value: ctrl.isDark,
              title: Text("Touch to change ThemeMode"),
              onChanged: ctrl.changeTheme,
            ),
  .......
 

```


##
* Storage [alternative of shared preference] Just need to Write GetStorage();


```
  final storage = GetStorage();
  bool get isDark => storage.read('darkmode') ?? false;
  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  void changeTheme(bool val) => storage.write('darkmode', val);
```

## Help

If you need any help regarding this 
```
tasnuva.oshin12@gmail.com
```

Thanks
