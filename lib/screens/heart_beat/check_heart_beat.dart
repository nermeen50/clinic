import 'package:doctor_application/screens/heart_beat/cubit/heart_beat_cubit.dart';
import 'package:doctor_application/screens/heart_beat/cubit/heart_beat_state.dart';
import 'package:doctor_application/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextEditingController _controller = TextEditingController();

class CheckHeartBeat extends StatelessWidget {
  const CheckHeartBeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Check Heart Beat'),
        backgroundColor: Colors.red[200],
      ),
      body: BlocBuilder<HeartBeatCubit, HeartBeatState>(
        builder: (ctx, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 0.0),
              child: Stack(children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 0.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Column(
                      children: const <Widget>[],
                    )),
                Container(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 0.0,
                      ),
                      TextField(
                        controller: HeartBeatCubit.get(ctx).patientName,
                        decoration: InputDecoration(
                          labelText: ' patient name',
                          prefixIcon: const Icon(Icons.people),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: HeartBeatCubit.get(ctx).phonenum,
                        decoration: InputDecoration(
                          labelText: 'phone',
                          prefixIcon: const Icon(Icons.phone),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: HeartBeatCubit.get(ctx).age,
                        decoration: InputDecoration(
                          labelText: 'age',
                          prefixIcon: const Icon(Icons.person_2_rounded),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: HeartBeatCubit.get(ctx).description,
                        minLines: 1,
                        maxLines: 20,
                        decoration: InputDecoration(
                          label: const Text('Description'),
                          prefixIcon: const Icon(Icons.description),
                          border: myfocusborder(),
                          enabledBorder: myfocusborder(),
                          focusedBorder: myfocusborder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: HeartBeatCubit.get(ctx).onUploadRecord,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  size: 40.0,
                                  color: Colors.red[200],
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  HeartBeatCubit.get(ctx).filePath != null
                                      ? HeartBeatCubit.get(ctx)
                                          .filePath!
                                          .path
                                          .split('/')
                                          .last
                                      : 'Upload HeartBeat Record',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomRoundedButton(
                        text: 'Done',
                        load: state is HeartBeatLoading ? true : false,
                        textColor: Colors.white,
                        pressed: () =>
                            HeartBeatCubit.get(ctx).checkHeartBeat(context),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  //
  // OutlineInputBorder myinputborder() {
  //   return const OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(20)),
  //       borderSide: BorderSide(
  //         color: Color(0xFFF2BEA1),
  //         width: 3,
  //       ));
  //}

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.red[200]!,
          width: 3,
        ));
  }
}
