import 'package:bite_sized/modules/models/Storage.dart';
import 'package:bite_sized/persistents/LoggedUser.dart';
import 'package:bite_sized/widgets/custom_button.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:file_picker/file_picker.dart';

class AddHistory extends StatefulWidget {
  const AddHistory({super.key});

  @override
  State<AddHistory> createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(
              height: 20,
            ),
            _buildBody()
          ],
        ),
      )),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.network(
          'https://th.bing.com/th/id/OIP.GMFIR_fiNa4eDqfDV4gx7QHaE6?pid=ImgDet&rs=1',
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        // Container(
        //   child: GestureDetector(
        //     onTap: () async {
        //       final results = await FilePicker.platform.pickFiles(
        //           allowMultiple: false,
        //           type: FileType.custom,
        //           allowedExtensions: ['png', 'jpg']);

        //       if (results == null) {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //             const SnackBar(content: Text('No file selected')));
        //         return null;
        //       }

        //       final path = results.files.single.path;
        //       final fileName = results.files.single.name;

        //       storage.uploadFile(path!, fileName).then((value) => setState(() {
        //             print('-------------');
        //             print(fileName);
        //             imagePath = fileName;
        //             //backgroundDefault = false;
        //           }));
        //     },
        //     child: FutureBuilder(
        //         //A URL dentro de downloadUrl é mostrada na tela
        //         future: storage.donwloadUrl(imagePath),
        //         builder:
        //             (BuildContext context, AsyncSnapshot<String> snapshot) {
        //           if (snapshot.connectionState == ConnectionState.done &&
        //               snapshot.hasData) {
        //             return Container(
        //               width: double.infinity,
        //               height: 200,
        //               child: Image.network(
        //                 snapshot.data!,
        //                 fit: BoxFit.cover,
        //               ),
        //             );
        //           }
        //           if (snapshot.connectionState == ConnectionState.waiting ||
        //               !snapshot.hasData) {
        //             return CircularProgressIndicator();
        //           }
        //           return Container();
        //         }),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.white))),
          // color: Colors.green,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(10, -15.0, 0.0),
                child: Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(left: 5, bottom: 10),
                      child: GestureDetector(
                        onTap: () => print('profile'),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: CircleAvatar(
                              foregroundImage: NetworkImage(
                                  LoggedUser.user.profileImageUrl)),
                        ),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(5, 10, 0.0),
                      //margin: EdgeInsets.only(top: 15, left: 5),
                      child: Text(
                        '${LoggedUser.user.userName} - ${LoggedUser.user.subscribers}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 13,
                            fontFamily: 'roboto, arial, sans-serife',
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //transform: Matrix4.translationValues(55, -10.0, 0.0),
                    margin: EdgeInsets.only(bottom: 10, left: 57),
                    child: ValueListenableBuilder(
                      valueListenable: titleController,
                      builder: (_, __, ___) {
                        return Text(
                          (titleController.text != '')
                              ? titleController.text
                              : 'Titulo aqui',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 28),
            child: Column(children: [
              _buildTitleArea(),
              const SizedBox(
                height: 20,
              ),
              _buildDescricaoArea(),
              const SizedBox(
                height: 20,
              ),
              _buildButtonCadastrar(),
              const SizedBox(
                height: 20,
              ),
            ]))
      ],
    );
  }

  _buildTitleArea() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Titulo',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 0, 0, 0),
              hintText: 'Digite seu Titulo'),
          controller: titleController,
        )
      ],
    );
  }

  _buildDescricaoArea() {
    return Container(
      height: 200,
      constraints: const BoxConstraints(maxHeight: 200, maxWidth: 800),
      child: Column(
        children: [
          _buildMensagemTextField(),
        ],
      ),
    );
  }

  _buildMensagemTextField() {
    return SizedBox(
      height: 200,
      child: TextField(
        scrollPadding: const EdgeInsets.all(2),
        controller: descriptionController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        maxLength: 500,
        decoration: const InputDecoration(
            hintText: 'Insira a mensagem aqui.',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)))),
        expands: true,
        minLines: null,
        maxLines: null,
        buildCounter: (_,
                {required currentLength, maxLength, required isFocused}) =>
            Container(
                alignment: Alignment.topLeft,
                child: Text(
                    currentLength.toString() + "/" + maxLength.toString())),
      ),
    );
  }

  _buildButtonCadastrar() {
    return CustomButton(
      text: 'Postar',
      icon: const Icon(
        Icons.send,
        size: 24.0,
        color: Colors.black,
      ),
      onPressed: (){
        print('Postando aqui........');
      },
    );
  }
}
