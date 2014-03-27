class TaxonomicUnit < ActiveRecord::Base

  def get_parent
    parent_tsn ? self.class.find(parent_tsn) : nil
  end

  def get_parent_id
    get_parent.id
  end

  def get_ancestors
    ancestors = []
    taxon_unit = self

    while taxon_unit.parent_tsn != 0 do
      taxon_unit = taxon_unit.get_parent
      ancestors << taxon_unit
    end
    ancestors
  end

  def get_ancestors_ids
    get_ancestors.map{|a| a.id}
  end
end