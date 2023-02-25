import 'zone.js';
import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import { provideFileRouter } from '@analogjs/router';

bootstrapApplication(AppComponent, {
  providers: [provideFileRouter()],
}).catch((err) => console.error(err));
