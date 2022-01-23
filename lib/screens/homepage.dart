
import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_download_app/screens/screen-2.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  //  __init();
    
  }
//   __init()async{
//     if (Platform.isAndroid) {

//    Map<Permission, PermissionStatus> statuses = await [
//     Permission.photos
//    ].request();//Permission.manageExternalStorage
// }
//   }
  List<String> names=[
    "messi",
    "ronaldo",
    "neymar",
    "suarez",
    "bale",
    "coutinho",
    "benzema",
    "modric",
    "noyer",
    "salah",
    "lukaku",
    "harry",
    "harland",
    "mbappe",
    "grizman",
    "pogba",
    "lewandowski",


  ];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        margin:const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(names.length, (index)=>Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
            height: 400,
            width: size.width-50,
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(names[index])));
               
               
                }, icon: Icon(Icons.fit_screen_outlined),color: Colors.white,iconSize: 40,),
                IconButton(
                  onPressed: ()async{

                  try {
                      ByteData imageData1 = await rootBundle.load("assets/"+names[index]+".jpg");
                    await ImageGallerySaver.saveImage(
                    imageData1.buffer.asUint8List(),
                    quality: 90,
                    name: "footballers");

                    await Flushbar(
                      backgroundColor: Colors.blueGrey,
                      flushbarPosition: FlushbarPosition.TOP,
                      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                      title: 'video_download_app',
                      message:
                          names[index]+" is saved to gallery",
                          messageSize: 17,
                          titleSize: 17,
                      duration:const Duration(seconds: 5),
                    ).show(context);
                  } catch (e) {
                  }
                  // final Directory directory = await getApplicationDocumentsDirectory();
                  //   final File file = File('${directory.path}/my_file.txt');
                  //   await file.writeAsString("salom");
                  //   String words=await file.readAsString();
                  // print(words);
                //  final _dir= await  getExternalStorageDirectory();
                //  String newpath="";
                //  List<String> folders=_dir!.path.split("/");
                //  for ( var i = 1 ; i<folders.length  ; i++ ){
                //      String folder=folders[i];
                //      if(folder !="Android"){
                //        newpath=newpath +"/"+folder;
                //      }else{
                //        break;
                //      }
                //  }
                //  String foo = 'Hello world';
                //  List<int> bytes = foo.codeUnits;
                //  print(bytes);
                //  newpath+="/Image_download_app";
                //  ByteData imageData1 = await rootBundle.load("assets/"+names[index]+".jpg");
                // //  String image_atString=imageData1.d
                //   File file=await  File(newpath+"/"+names[index]+".jpg");

                // //  file.openWrite(encoding:Encoding. );
                //   // file.writeAsBytes(imageData1.buffer.asUint8List(),mode: FileMode.write).then((File myfile)async{
                //   //     await GallerySaver.saveImage(myfile.path,albumName: "footballers");
                //   //     print('Image is saved');
                //   // }).catchError((e)=>print("aka xato:"+e.toString()));
                 
                }, icon:const Icon(Icons.file_download_rounded),color: Colors.white,iconSize: 40,),
              ],
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(image:AssetImage("assets/"+names[index]+".jpg") ,fit: BoxFit.cover,)
            ),
        )),
          ),
          )),
    );
  }
}

