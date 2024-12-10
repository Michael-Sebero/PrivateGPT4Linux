## How to Install
```
curl -LO https://raw.githubusercontent.com/Michael-Sebero/PrivateGPT4Linux/main/files/installers/installer.sh

sh installer.sh
```

## How to Launch PrivateGPT
```
(ollama serve &) && (cd private-gpt && PGPT_PROFILES=ollama make run)
```

- Enter `localhost:8001` in your browser, despite it being ran in your browser privateGPT is offline.

## Supported File Formats to Ingest

- `.csv`: CSV (Comma-Separated Values)
- `.docx`: Word Document
- `.epub`: EPub (Electronic Publication)
- `.hwp`: HWP (Hancom Writer)
- `.ipynb`: Jupyter Notebook
- `.jpg`: JPEG Image
- `.json`: JSON (JavaScript Object Notation)
- `.jpeg`: JPEG Image
- `.md`: Markdown
- `.mbox`: Mbox (Mailbox)
- `.mp3`: MP3 Audio
- `.mp4`: MP4 Video
- `.pdf`: Portable Document Format (PDF)
- `.png`: PNG Image
- `.ppt`: PowerPoint Document
- `.pptm`: PowerPoint Document (Macro-Enabled)
- `.pptx`: PowerPoint Document
   
## How to Change the Model

. Reinstall PrivateGPT but replace `ollama pull llama3.1` and `ollama pull nomic-embed-text` in the installer.

## Documentation 

https://docs.privategpt.dev/manual
