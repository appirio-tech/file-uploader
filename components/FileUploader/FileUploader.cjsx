'use strict'

require './FileUploaderStyles'

React                  = require 'react'
UploadedFilesContainer = require '../UploadedFiles/UploadedFilesContainer'
Dropzone               = require 'react-dropzone'

FileUploader = ({ multiple, onChange, requestingUploadUrl}) ->
  <div className="FileUploader">
    {
      if requestingUploadUrl
        <h1>requestingUploadUrl...</h1>
    }
    <UploadedFilesContainer/>

    <div className="dropzone-container">
      <Dropzone multiple={multiple} onDrop={onChange} className="Dropzone">
        <button>Choose files to upload.</button>
      </Dropzone>
    </div>
  </div>

module.exports = FileUploader


