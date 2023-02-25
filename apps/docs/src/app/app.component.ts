import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  standalone: true,
  imports: [RouterOutlet],
  selector: 'docs-root',
  template: ` <router-outlet /> `,
  styles: [],
})
export class AppComponent {
  title = 'docs';
}
