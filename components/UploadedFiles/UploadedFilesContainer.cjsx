'use strict'

React         = require 'react'
{ connect }   = require 'react-redux'
classnames    = require 'classnames'
UploadedFiles = require './UploadedFiles'

{ getAttachments, deleteAttachment } = require 'appirio-tech-client-app-layer'

{ createClass, createElement, PropTypes } = React

mapStateToProps = (state) ->
  { id, assetType, category } = state?.fileUploader

  filterAttachments = (attachments) ->
    filteredFiles = []

    for key, attachment of attachments
      if id == attachment.id
        if assetType == attachment.assetType
          if category == attachment.category
            filteredFiles.push attachment

    filteredFiles

  files = filterAttachments(state?.attachments)

  { id, assetType, category, files }

container =
  propTypes:
    id       : PropTypes.string.isRequired
    assetType: PropTypes.string.isRequired
    category : PropTypes.string.isRequired
    dispatch : PropTypes.func.isRequired
    files    : PropTypes.array.isRequired

  onDelete: (file) ->
    this.props.dispatch deleteAttachment file

  componentWillMount: ->
    { dispatch, id, assetType, category } = this.props

    dispatch getAttachments { id, assetType, category }

  render: ->
    createElement UploadedFiles,
      files: this.props.files
      onDelete: this.onDelete

module.exports = connect(mapStateToProps)(createClass(container))

