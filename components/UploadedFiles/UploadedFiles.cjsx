'use strict'

require './UploadedFilesStyles'

React        = require 'react'
UploadedFile = require '../UploadedFile/UploadedFile'

UploadedFiles = ({ files, onDelete }) ->
  <ul className="UploadedFiles flex wrap">
    {
      files?.map (file) ->
        { preview, progress, fileName, fileId, tempId } = file

        status         = 'uploaded'
        status         = 'uploading' unless fileId
        enableCaptions = true
        captions       = 'hello'
        onDeleteProxy  = ->
          onDelete file

        <li>
          <UploadedFile
            preview={preview}
            progress={progress}
            fileName={fileName}
            status={status}
            enableCaptions={enableCaptions}
            captions={captions}
            onDelete={onDeleteProxy}
          />
        </li>
    }
  </ul>

module.exports = UploadedFiles

