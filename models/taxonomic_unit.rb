class TaxonomicUnit < ActiveRecord::Base

  belongs_to :kingdom

  def get_parent
    parent_tsn != 0 ? self.class.find(parent_tsn) : nil
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

  def get_ancestor_ids
    get_ancestors.map{|a| a.id}
  end

  def common_ancestor(taxon_unit)
    (get_ancestors & taxon_unit.get_ancestors).first
  end

  def is_ancestor_of?(taxon_unit)
    taxon_unit.get_ancestor_ids.include?(id)
  end

  def get_children
    self.class.where(parent_tsn: tsn)
  end
end
