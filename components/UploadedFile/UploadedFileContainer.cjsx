'use strict'

{ deleteAttachment }                      = require 'appirio-tech-client-app-layer'
{ connect }                               = require 'react-redux'
{ createElement, createClass, PropTypes } = require 'react'

UploadedFile = require './UploadedFile'

container =
  propTypes:
    file: PropTypes.object.isRequired

  onDelete: ->
    { dispatch, file } = this.props

    dispatch deleteAttachment file

  render: ->
    { preview, progress, fileName, enableCaptions, captions, fileId } = this.props.file
    { onDelete } = this

    status = 'uploaded'
    status = 'uploading' unless fileId

    createElement UploadedFile, {
      status
      preview
      progress
      fileName
      enableCaptions
      captions
      fileId
      onDelete
    }

module.exports = connect()(createClass(container))