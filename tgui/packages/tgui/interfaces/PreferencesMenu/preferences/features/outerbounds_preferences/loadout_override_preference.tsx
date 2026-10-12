// THIS IS AN REDSHIFT UI FILE
import type { Feature } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const loadout_override_preference: Feature<string> = {
  name: 'Loadout Item Preference',
  component: FeatureDropdownInput,
};
