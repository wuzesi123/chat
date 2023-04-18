import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef VoidCallBack = void Function();
typedef StringsCallBack = void Function(String emoji, String messageId);

class ChatUITextField extends StatefulWidget {
  const ChatUITextField({
    Key? key,
    required this.focusNode,
    required this.textEditingController,
    required this.onPressed,
    required this.onRecordingComplete,
    required this.onImageSelected,
  }) : super(key: key);

  /// Provides focusNode for focusing text field.
  final FocusNode focusNode;

  /// Provides functions which handles text field.
  final TextEditingController textEditingController;

  /// Provides callback when user tap on text field.
  final VoidCallBack onPressed;

  /// Provides callback once voice is recorded.
  final Function(String?) onRecordingComplete;

  /// Provides callback when user select images from camera/gallery.
  final StringsCallBack onImageSelected;

  @override
  State<ChatUITextField> createState() => _ChatUITextFieldState();
}

class _ChatUITextFieldState extends State<ChatUITextField> {
  String _inputText = '';

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: widget.focusNode,
              controller: widget.textEditingController,
              style: const TextStyle(color: Colors.black),
              maxLines: 5,
              minLines: 1,
              onChanged: _onChanged,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                  letterSpacing: 0.25,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
              ),
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  widget.onPressed();
                }
              },
            ),
          ),
          _inputText.isNotEmpty
              ? IconButton(
                  color: Colors.green,
                  onPressed: () {
                    widget.onPressed();
                    setState(() => _inputText = '');
                  },
                  icon: const Icon(Icons.send),
                )
              : Row(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () => _onIconPressed(ImageSource.camera),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () => _onIconPressed(ImageSource.gallery),
                        icon: const Icon(
                          Icons.image,
                          color: Colors.grey,
                        )),
                  ],
                ),
        ],
      ),
    );
  }

  void _onIconPressed(ImageSource imageSource) async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: imageSource);
      widget.onImageSelected(image?.path ?? '', '');
    } catch (e) {
      widget.onImageSelected('', e.toString());
    }
  }

  void _onChanged(String inputText) => setState(() => _inputText = inputText);
}
