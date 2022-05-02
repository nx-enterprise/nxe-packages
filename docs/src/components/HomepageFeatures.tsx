import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

type FeatureItem = {
  title: string;
  image: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Ready for the Big Time',
    image: '/img/buildings-svgrepo-com.svg',
    description: (
      <>
        Nx Enterprise was designed from real-world experiences building
        applications for large companies at scale.
      </>
    ),
  },
  {
    title: 'Leverage the power of Dapr',
    image: 'https://dapr.io/images/dapr.svg',
    description: (
      <>
        Nx Enterprise is design to run on top of Dapr - Microsoft's
        groundbreaking framework for building distributed applications.
      </>
    ),
  },
  {
    title: 'Built-In Domain Drive Design Best Practices',
    image:
      'https://pluralsight2.imgix.net/paths/images/domain-driven-design-6d10f953a0.png',
    description: (
      <>
        We believe an opinionated domain-driven-design approach to writing code
        is essential in the enterprise.
      </>
    ),
  },
];

function Feature({ title, image, description }: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <img className={styles.featureSvg} alt={title} src={image} />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
