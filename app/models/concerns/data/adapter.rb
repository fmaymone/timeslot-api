class Adapter

  def initialize(file: nil, slots: nil, group: nil)
    @file = file
    @slots = slots
    @group = group
  end

  def import
    raise NotImplementedError,
          "Subclasses must define the method 'import'."
  end

  def export
    raise NotImplementedError,
          "Subclasses must define the method 'export'."
  end

  private def is_valid_event
    raise NotImplementedError,
          "Subclasses must define the method 'is_valid_event'."
  end

  private def import_file
    raise NotImplementedError,
          "Subclasses must define the method 'import_file'."
  end

  private def import_event_location
    raise NotImplementedError,
          "Subclasses must define the method 'import_event_location'."
  end

  private def import_event_media
    raise NotImplementedError,
          "Subclasses must define the method 'import_event_media'."
  end

  private def import_event_notes
    raise NotImplementedError,
          "Subclasses must define the method 'import_event_notes'."
  end

  private def import_event_alerts
    raise NotImplementedError,
          "Subclasses must define the method 'import_event_alerts'."
  end

  private def import_event_visibility
    raise NotImplementedError,
          "Subclasses must define the method 'import_event_visibility'."
  end

  private def export_event_location
    raise NotImplementedError,
          "Subclasses must define the method 'export_event_location'."
  end

  private def export_event_media
    raise NotImplementedError,
          "Subclasses must define the method 'export_event_media'."
  end

  private def export_event_notes
    raise NotImplementedError,
          "Subclasses must define the method 'export_event_notes'."
  end

  private def export_event_alerts
    raise NotImplementedError,
          "Subclasses must define the method 'export_event_alerts'."
  end

  private def export_event_visibility
    raise NotImplementedError,
          "Subclasses must define the method 'export_event_visibility'."
  end
end
