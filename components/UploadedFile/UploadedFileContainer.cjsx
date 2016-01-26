'use strict'

{ deleteAttachment }                      = require 'appirio-tech-client-app-layer'
{ connect }                               = require 'react-redux'
{ createElement, createClass, PropTypes } = require 'react'

UploadedFile = require './UploadedFile'

container =
  propTypes:
    status        : PropTypes.string.isRequired
    preview       : PropTypes.string.isRequired
    progress      : PropTypes.number
    deleteId      : PropTypes.string.isRequired
    fileName      : PropTypes.string.isRequired
    enableCaptions: PropTypes.bool
    captions      : PropTypes.string

  onDelete: ->
    { dispatch, deleteId } = this.props

    dispatch deleteAttachment(deleteId)

  render: ->
    { preview, progress, fileName, enableCaptions, captions, fileId, status } = this.props
    { onDelete } = this

    createElement UploadedFile, {
      status
      preview
      progress
      fileName
      enableCaptions
      captions
      onDelete
    }

module.exports = connect()(createClass(container))