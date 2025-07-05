import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BankPassbookUpload extends StatefulWidget {
  final void Function(File file) onUploaded;
  const BankPassbookUpload({Key? key, required this.onUploaded})
    : super(key: key);

  @override
  _BankPassbookUploadState createState() => _BankPassbookUploadState();
}

class _BankPassbookUploadState extends State<BankPassbookUpload> {
  PlatformFile? _picked;
  String? _errorMessage;
  bool _uploading = false;

  static const maxFileSize = 5 * 1024 * 1024; // 5 MB
  static const allowedExt = ['jpg', 'png', 'pdf'];

  Future<void> _pickFile() async {
    setState(() {
      _errorMessage = null;
      _picked = null;
    });
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExt,
      );
      if (result == null) return; // user cancelled

      final file = result.files.first;
      if (file.size > maxFileSize) {
        setState(() {
          _errorMessage = 'File too large. Max allowed size is 5 MB.';
        });
        return;
      }
      if (!allowedExt.contains(file.extension?.toLowerCase())) {
        setState(() {
          _errorMessage = 'Invalid file type. Use JPG, PNG, or PDF.';
        });
        return;
      }

      setState(() => _picked = file);
    } catch (e) {
      setState(() => _errorMessage = 'Failed to pick file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final preview = _picked == null
        ? Center(
            child: Text('+ Upload Image', style: TextStyle(color: Colors.grey)),
          )
        : (_picked!.extension == 'pdf'
              ? Icon(Icons.picture_as_pdf, size: 60, color: Colors.red)
              : Image.file(File(_picked!.path!), height: 100));

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Secure Your Account in Seconds',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Upload Your Bank Passbook', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _uploading ? null : _pickFile,
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: preview),
            ),
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(_errorMessage!, style: TextStyle(color: Colors.red)),
          ],
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: _uploading
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Save'),
          ),
          const SizedBox(height: 8),
          Text(
            'Only JPG, PNG, or PDF files. Max size: 5 MB.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
